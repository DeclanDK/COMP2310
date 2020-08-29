--  Declan Duncan-Keen, 2020 - coded with Uwe R. Zimmer

with Ada.Numerics.Discrete_Random; use Ada.Numerics;
with Ada.Text_IO;                  use Ada.Text_IO;
with Maybe_Type;
with Queue_Pack_Protected_Generic;
with Sync_Type;
with Ordered_Bounded_List;

procedure Pipelined_Insertsort is

   No_Of_Nodes : constant Positive := 8;
   Data_Stream_Length : constant Positive := 100_000;

   subtype Data_Stream_Range is Positive range 1 .. Data_Stream_Length;

   subtype Element is Positive range 10_000 .. 99_999;

   package Random_Element is new Discrete_Random (Result_Subtype => Element);
   use Random_Element;

   Element_Generator : Generator;

   package Element_Queue is new Queue_Pack_Protected_Generic (Element => Element,
                                                              Size    => Data_Stream_Length);
   use Element_Queue;

   Result_Queue : Protected_Queue;

   package Maybe_Element_Type is new Maybe_Type (Element => Element);
   use Maybe_Element_Type;
   subtype Maybe_Element is Maybe_Element_Type.Maybe;

   type Node;
   type Node_Access is access all Node;

   task type Node is
      entry Feed (E : Maybe_Element);
   end Node;

   function New_Node return Node_Access is (new Node);

   task body Node is

      Next : Node_Access := null;

      function Access_Next return Node_Access is

      begin
         if Next = null then
            Next := New_Node;
         end if;
         return Next;
      end Access_Next;

      Node_Size : constant Positive :=
        (1 + (Data_Stream_Length - 1) / No_Of_Nodes);

      package Maybe_Element_Queue is new Queue_Pack_Protected_Generic
        (Element => Maybe_Element,
         Size => Node_Size);
      use Maybe_Element_Queue;

      Queue : Maybe_Element_Queue.Protected_Queue;

      --  Max_Element : Maybe_Element with Atomic;

      package Sync_Maybe_Element is new Sync_Type (Element => Maybe_Element,
                                                   Default => Invalid_Value);

      Max_Element : Sync_Maybe_Element.Protect;

      function Pass_To_Next_Node (E : Maybe_Element) return Boolean is

         ME : constant Maybe_Element := Max_Element.Read;

      begin
         return E.Valid and then ME.Valid and then E.Value >= ME.Value;
      end Pass_To_Next_Node;

      --  (E.Valid and then Max_Element.Read.Valid and then E.Value >= Max_Element.Read.Value);

      task Insert_Elements;
      task body Insert_Elements is

         package Ordered_Bounded_Elements is new Ordered_Bounded_List (Max_Length    => Node_Size,
                                                                       Maybe_Element => Maybe_Element_Type);
         use Ordered_Bounded_Elements;

         function Pass_On (E : Element) return Boolean is (List_Full and then E >= Last_Element);
      begin
            Insert_Element_Loop : loop
               declare
                  Item : constant Maybe_Element := Dequeue (Queue);
               begin
                  if Item.Valid then
                     if Pass_On (Item.Value) then
                        Access_Next.all.Feed (Item);
                     else
                        declare
                           Overflow_Element : constant Maybe_Element := Add_To_List (Item.Value);
                        begin
                           if Overflow_Element.Valid then
                              Access_Next.all.Feed (Overflow_Element);
                              Max_Element.Write (Valid_Value (Last_Element));
                           end if;
                        end;
                     end if;
                  else
                  for E of Read_List loop
                     Result_Queue.Enqueue (E);
                  end loop;
                  if Next /= null then
                     Next.all.Feed (Item);
                  end if;
                  exit Insert_Element_Loop;
                  end if;
               end;
            end loop Insert_Element_Loop;

      end Insert_Elements;

      Candidate : Maybe_Element := Invalid_Value;

   begin
      loop
         accept Feed (E : Maybe_Element) do
            Candidate := E;
         end Feed;

         if Pass_To_Next_Node (Candidate) then
            Access_Next.all.Feed (Candidate);
         else
            Queue.Enqueue (Candidate);
         end if;

         exit when not Candidate.Valid;
      end loop;

   end Node;

   Initial_Node : Node;

begin
   Put_Line ("--- Feeding in"
             & Positive'Image (Data_Stream_Length) & " random elements");
   Reset (Element_Generator);
   for I in Data_Stream_Range loop
      Initial_Node.Feed (Valid_Value (Random (Element_Generator)));
   end loop;

   Put_Line ("--- Feeding in the end of the data token");
   Initial_Node.Feed (Invalid_Value);

   declare
      --  Result : constant array (Data_Stream_Range) of Element := (others => Dequeue (Result_Queue));
      Result : array (Data_Stream_Range) of Element := (others => Element'Invalid_Value);
   begin
      for R of Result loop
         R := Dequeue (Result_Queue);
      end loop;
      for I in 1 .. Data_Stream_Length - 1 loop
         if Result (I) > Result (I + 1) then
            raise Program_Error with "Found an out of order item!";
         end if;
      end loop;
      Put_Line ("--- Read out" & Positive'Image (Data_Stream_Length) & " elements");
   end;

   Put_Line ("Result is sorted!");
end Pipelined_Insertsort;

-- repair this program according to the lab sheet.

with Ada.Text_IO; use Ada.Text_IO;

procedure Counter_Test_Synchronized is

   Sum : Natural := 50;


   type Index is range 1 .. 4;
   type Boolean_Array is array (Index) of Boolean;
   type Natural_Array is array (Index) of Natural;

   Entering : Boolean_Array := (False, False, False, False);
   Number : Natural_Array := (0, 0, 0, 0);

   function Get_Max (Arr : Natural_Array) return Natural is
      Maximum : Natural := 0;
   begin
      for I in Index loop
         if Arr (I) > Maximum then
            Maximum := Arr (I);
         end if;
      end loop;
      return Maximum;
   end Get_Max;

   task type Counter (Id : Index; Goal : Natural);

   task body Counter is

   begin
      Entering (Id) := True;
      Number (Id) := Get_Max (Number) + 1;
      Entering (Id) := False;

      for j in Index loop
         while Entering (j) loop
            null;
         end loop;
         while (Number (j) /= 0 and Number (j) < Number (Id) and j < Id) loop
            null;
         end loop;
      end loop;

      while Sum /= Goal loop
         delay 0.0001;
            Sum := (if Sum > Goal then Sum - 1 else Sum + 1);
            Put (Natural'Image (Sum));
      end loop;
      Number (Id) := 0;

      New_Line;
      Put_Line ("Counter task" & Index'Image (Id) & " terminates with sum being:" & Natural'Image (Sum));
      New_Line;

   end Counter;

   Counter_0 : Counter (1, 30);
   Counter_1 : Counter (2, 40);
   Counter_2 : Counter (3, 60);
   Counter_3 : Counter (4, 70);

begin
   New_Line;
   Put_Line ("Counter_Test terminates with sum being:" & Natural'Image (Sum));
end Counter_Test_Synchronized;

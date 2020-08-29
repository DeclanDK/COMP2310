package body Ordered_Bounded_List is

   No_Of_Elements : Natural range 0 .. Max_Length := 0;

   Data : List (Data_Index);

   Last : Element renames Data (Data_Index'Last);

   function Add_To_List (E : Element) return Maybe is

      Overflow : Maybe := Invalid_Value;

   begin
      if List_Full then
         Overflow := Valid_Value (Last);
         No_Of_Elements := No_Of_Elements - 1;
      end if;

      declare
         function Find_Spot (L, M : Data_Index) return Data_Index is
           (if L = M then L
            elsif Data ((L + M) / 2) < E
            then Find_Spot ((L + M) / 2 + 1, M)
            else Find_Spot (L, (L + M / 2)));


         Spot : constant Data_Index := Find_Spot (Data_Index'First, No_Of_Elements + 1);

      begin
         Data (Spot + 1 .. No_Of_Elements + 1) := Data (Spot .. No_Of_Elements);
         Data (Spot) := E;
         No_Of_Elements := No_Of_Elements + 1;
      end;
          


      return Overflow;
   end Add_To_List;
   
   function List_Full return Boolean is (No_Of_Elements = Max_Length);

   function Last_Element return Element is (Last);

   function Read_List return List is (Data (1 .. No_Of_Elements));

end Ordered_Bounded_List;

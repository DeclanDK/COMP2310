with Quicksort;

package body Sorting_Tests is

   ---------------
   -- Is_Sorted --
   ---------------

   function Is_Sorted (Field : Element_Array) return Boolean is

   begin
      for ix in Field'First .. Index'Pred (Field'Last) loop
         if Field (Index'Succ (ix)) < Field (ix) then
            return False;
         end if;
      end loop;
      return True;
   end Is_Sorted;

   --------------------
   -- Is_Permutation --
   --------------------

   function Is_Permutation (Field_A, Field_B : Element_Array) return Boolean is

      procedure Quicksort_Elements is new Quicksort (Element       => Element,
                                                     Index         => Index,
                                                     Element_Array => Element_Array);

      Sorted_Field_A : Element_Array := Field_A;
      Sorted_Field_B : Element_Array := Field_B;

   begin
      Quicksort_Elements (Sorted_Field_A);
      Quicksort_Elements (Sorted_Field_B);

      return Sorted_Field_A = Sorted_Field_B;
   end Is_Permutation;

end Sorting_Tests;

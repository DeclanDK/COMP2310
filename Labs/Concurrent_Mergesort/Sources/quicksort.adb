procedure Quicksort (Field : in out Element_Array) is

begin
   if Field'Length > 1 then

      declare
         subtype Field_Range is Index range Field'Range;

         Swap :          Field_Range := Field'First;
         Low  :          Field_Range := Index'Succ (Field'First);
         High :          Field_Range := Field'Last;
         x    : constant Element     := Field (Swap);

      begin
         while Low <= High loop

            while High > Swap loop
               if Field (High) < x then
                  Field (Swap) := Field (High);
                  Swap := High;
               end if;
               High :=  Index'Pred (High);
            end loop;

            while Low < Swap loop
               if x < Field (Low) then
                  Field (Swap) := Field (Low);
                  Swap := Low;
               end if;
               Low := Index'Succ (Low);
            end loop;

         end loop;

         Field (Swap) := x;

         if Index'Succ (Field'First) < Swap then
            Quicksort (Field (Field'First .. Index'Pred (Swap)));
         end if;

         if Swap < Index'Pred (Field'Last) then
            Quicksort (Field (Index'Succ (Swap) .. Field'Last));
         end if;

      end;
   end if;
end Quicksort;

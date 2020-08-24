with Ada.Text_IO;                 use Ada.Text_IO;
with Protected_Element_Generic;
with Unprotected_Element_Generic;

procedure Count_Up is

begin
   for i in 1 .. 20 loop
      declare
         package Protected_Natural is new Protected_Element_Generic
           (Element => Natural, Init => 0);
         package Unprotected_Natural is new Unprotected_Element_Generic
           (Element => Natural, Init => 0);

         use Protected_Natural;
         use Unprotected_Natural;

         task type Count_up_by (Difference : Natural) is
            entry Done;
         end Count_up_by;

         task body Count_up_by is

         begin
            for i in 1 .. Difference loop
               Protected_Element.Inc;
            end loop;

            for i in 1 .. Difference loop
               Unprotected_Element.Inc;
            end loop;

            accept Done;
         end Count_up_by;

         Counters : array (1 .. 10) of Count_up_by (1_000);

      begin
         for t of Counters loop
            t.Done;
         end loop;

         Put_Line ("Protected value:" & Natural'Image (Protected_Element.Get) &
              " - Unprotected value:" & Natural'Image (Unprotected_Element.Get));
      end;
   end loop;
end Count_Up;


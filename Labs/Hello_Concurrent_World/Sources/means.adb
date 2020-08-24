with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
  type Number is digits 5;
  type Numbers is array (Positive range <>) of Number;
   task Arithmetic_Mean_Task;
   task Harmonic_Mean_Task;
  Test_Numbers : constant Numbers  := (10.0, 20.0, 30.0, 40.0);
  arith_Mean : Number;
  harm_Mean : Number;
  -- Function which computes an arithmetic mean
  function Arithmetic_Mean (Numbers_Arr : Numbers) return Number
  is
      Sum : Number := 0.0;
      array_length : constant Number := Number (Numbers_Arr'Length);
  begin
      for i in Numbers_Arr'Range loop
         Sum := Sum + Numbers_Arr (i);
      end loop;
      Sum := Sum / array_length;
      return Sum;
  end Arithmetic_Mean;

  -- Function which computes a harmonic mean
  function Harmonic_Mean (Numbers_Arr : Numbers) return Number
  is
      Sum : Number := 0.0;
      array_length : constant Number := Number (Numbers_Arr'Length);
  begin
      for i in Numbers_Arr'Range loop
         Sum := Sum + (1.0 / (Numbers_Arr (i)));
      end loop;
      Sum :=  array_length / Sum;
      return Sum;
  end Harmonic_Mean;

   -- Task which commputes an arithmetic mean
   task body Arithmetic_Mean_Task is
   begin
      arith_Mean := Arithmetic_Mean (Test_Numbers);
      Put ("Arithmetic Mean : ");  Put (Number'Image (arith_Mean)); New_Line;
   end Arithmetic_Mean_Task;

   task body Harmonic_Mean_Task is
   begin
      harm_Mean := Harmonic_Mean (Test_Numbers);
      Put ("Harmonic Mean : "); Put (Number'Image (harm_Mean)); New_Line;
     end Harmonic_Mean_Task;

begin
   null;
   -- Tasks are automatically completed
end Main;

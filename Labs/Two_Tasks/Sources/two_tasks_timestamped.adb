with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
-- Complete this procedure according to the lab sheet

procedure Two_Tasks_Timestamped is

   Start_Up_Time : constant Time := Clock;

   task First_One;
   task Second_One;

   task body First_One is
      First_Now : constant Time := Clock;
   begin
      Put ("Hello from Task 1.. ");
      New_Line;
      Put (Day_Number'Image   (Day     (First_Now)) & ".");
      Put (Month_Number'Image (Month   (First_Now)) & ".");
      Put (Year_Number'Image  (Year    (First_Now)) & " at");
      Put (Day_Duration'Image (Seconds (First_Now)) & " seconds - Seconds since start up:");
      Put (Duration'Image (First_Now - Start_Up_Time));
      New_Line;
      Put_Line ("and goodbye world from task 1");
   end First_One;

   task body Second_One is
      Second_Now : constant Time := Clock;
   begin
      Put ("Hello from Task 2.. ");
      New_Line;
      Put (Day_Number'Image   (Day     (Second_Now)) & ".");
      Put (Month_Number'Image (Month   (Second_Now)) & ".");
      Put (Year_Number'Image  (Year    (Second_Now)) & " at");
      Put (Day_Duration'Image (Seconds (Second_Now)) & " seconds - Seconds since start up:");
      Put (Duration'Image (Second_Now - Start_Up_Time));
      New_Line;
      Put_Line ("and goodbye world from task 2");
   end Second_One;

begin
   -- Tasks happen here
   Put ("Hello .. ");
   Put_Line ("and goodbye world from Two_Tasks");
end Two_Tasks_Timestamped;

-- It looks initially messy but that is what concurrency is, perhaps we could fix it but I don't have the knowledge currently
-- There are currently at least 3 tasks running, the two declared and the main procedure

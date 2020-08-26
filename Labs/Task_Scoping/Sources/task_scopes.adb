with Ada.Calendar;      use Ada.Calendar;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Text_IO;       use Ada.Text_IO;

procedure Task_Scopes is

   Start_Up_Time : constant Time := Clock;

   procedure Put_Line_Time (S : String) is

   begin
      -- Prefixes the time since startup as seconds with two decimal places
      Put (Float (Clock - Start_Up_Time), 1, 2, 0); Put_Line (" seconds: " & S);
   end Put_Line_Time;

   task type Outer_Type;
   type Outer_Type_Ptr is access Outer_Type;
   task body Outer_Type is

   begin
      delay 0.6; Put_Line_Time ("-- End of an outer task");
   end Outer_Type;

   task Static_Outer_Task;
   task body Static_Outer_Task is

   begin
      delay 0.1; Put_Line_Time ("Start of Static_Outer_Task");
      declare

         task type Inner_Type;
         type Inner_Type_Ptr is access Inner_Type;
         task body Inner_Type is

         begin
            delay 0.6; Put_Line_Time ("-- End of an inner task");
         end Inner_Type;

         task Static_Inner_Task;
         task body Static_Inner_Task is

         begin
            delay 0.2; Put_Line_Time ("Start of Static_Inner_Task");
            declare
--                 Inner_Task_Instance : Inner_Type;
--                 Outer_Task_Instance : Outer_Type;
--                 Dynamic_Inner_Instance : Inner_Type_Ptr := new Inner_Type;
--                 Dynamic_Outer_Instance : Outer_Type_Ptr := new Outer_Type;
            begin
               delay 0.3; Put_Line_Time ("End of Static_Inner_Task declare block");
            end;
            delay 0.1; Put_Line_Time ("End of Static_Inner_Task");
         end Static_Inner_Task;

      begin
         delay 0.4; Put_Line_Time ("End of Static_Outer_Task declare block");
      end;
      delay 0.1; Put_Line_Time ("End of Static_Outer_Task");
   end Static_Outer_Task;

begin
   delay 0.2; Put_Line_Time ("Start of main scope");
   delay 0.2; Put_Line_Time ("End of main scope");
end Task_Scopes;

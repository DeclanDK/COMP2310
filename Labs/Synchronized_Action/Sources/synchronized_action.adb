with Ada.Task_Identification; use Ada.Task_Identification;
with Ada.Text_IO;             use Ada.Text_IO;

procedure Synchronized_Action is

   No_Of_Tasks : constant Positive := 5;

   protected type Blockers (Group_Size : Positive) is

      entry Synchronize;

   private

      Barrier_Open : Boolean := False;

   end Blockers;

   protected body Blockers is

      entry Synchronize when Synchronize'Count = Group_Size or else Barrier_Open is

      begin
         Barrier_Open := Synchronize'Count > 0;
      end Synchronize;

   end Blockers;

   Blocker : Blockers (No_Of_Tasks);

   task type In_Synchronized_Stages;

   task body In_Synchronized_Stages is

   begin
      Put_Line ("Task " & Image (Current_Task) & " starting up");
      delay 1.0;

      Blocker.Synchronize;

      Put_Line ("Task " & Image (Current_Task) & " in stage 1");
      delay 1.0;

      Blocker.Synchronize;

      Put_Line ("Task " & Image (Current_Task) & " in stage 2");
   end In_Synchronized_Stages;

   Staged_Tasks : array (1 .. No_Of_Tasks) of In_Synchronized_Stages; pragma Unreferenced (Staged_Tasks);

begin
   null;
end Synchronized_Action;

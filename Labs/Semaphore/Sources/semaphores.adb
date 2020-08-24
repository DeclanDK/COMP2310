package body Semaphores is

   protected body Binary_Semaphore is

      entry Wait when Lock is
      begin
         Lock := False;
      end Wait;

      entry Signal when not Lock is
      begin
         Lock := True;
      end Signal;

   end Binary_Semaphore;

end Semaphores;

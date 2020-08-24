package Semaphores is
   
   protected type Binary_Semaphore (Initially_Available : Boolean) is 
      
      entry Wait; 
      entry Signal;
   
   private 
      Lock : Boolean := Initially_Available;
      
   end Binary_Semaphore;
   
end Semaphores;

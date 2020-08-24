package body Id_Dispenser is
   protected body Dispenser is

      procedure Draw_Id (Id : out Element) is
      begin
         Id := Counter;
         Counter := Element'Succ (Counter);
      end Draw_Id;
   end Dispenser;
end Id_Dispenser;

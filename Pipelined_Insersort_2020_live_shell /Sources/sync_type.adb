package body Sync_Type is

   protected body Protect is

      procedure Write (E : Element) is

      begin
         Value := E;
      end Write;

      function Read return Element is (Value);

   end Protect;

end Sync_Type;

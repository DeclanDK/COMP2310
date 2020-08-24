package body Unprotected_Element_Generic is

   package body Unprotected_Element is

      function Get return Element is (Store);

      procedure Set (E : Element) is

      begin
         Store := E;
      end Set;

      procedure Inc is

      begin
         Store := Element'Succ (Store);
      end Inc;

      procedure Dec is

      begin
         Store := Element'Pred (Store);
      end Dec;

   end Unprotected_Element;

end Unprotected_Element_Generic;

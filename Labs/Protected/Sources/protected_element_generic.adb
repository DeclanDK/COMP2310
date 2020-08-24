package body Protected_Element_Generic is

   protected body Protected_Element is

      function Get return Element is (Store);

      procedure Set (E : Element) is

      begin
         Store := E;
      end Set;

      entry Inc when Store < Element'Last is

      begin
         Store := Element'Succ (Store);
      end Inc;

      entry Dec when Store > Element'First is

      begin
         Store := Element'Pred (Store);
      end Dec;

   end Protected_Element;

end Protected_Element_Generic;

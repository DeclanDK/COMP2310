generic
   type Element is (<>); -- any discrete type
   Init : Element;       -- initial value

package Protected_Element_Generic is

   protected Protected_Element is

      function  Get return Element;
      procedure Set (E : Element);

      entry Inc;
      entry Dec;

   private
      Store : Element := Init;

   end Protected_Element;

end Protected_Element_Generic;

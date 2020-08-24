generic
   type Element is (<>); -- any discrete type
   Init : Element;       -- initial value

package Unprotected_Element_Generic is

   package Unprotected_Element is

      function  Get return Element;
      procedure Set (E : Element);

      procedure Inc;
      procedure Dec;

   private
      Store : Element := Init;

   end Unprotected_Element;

end Unprotected_Element_Generic;

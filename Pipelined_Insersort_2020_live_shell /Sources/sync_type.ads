generic

   type Element is private;
   Default : Element;

package Sync_Type is

   protected type Protect is

      procedure Write (E : Element);
      function Read return Element;

   private

      Value : Element := Default;

   end Protect;

end Sync_Type;

--
-- Uwe R. Zimmer, Australia, 2017
--

pragma Initialize_Scalars;

generic
   type Element is private;
   Size : Positive;

package Queue_Pack_Protected_Generic is

   type Queue_Type is limited private;

   protected type Protected_Queue is

      entry Enqueue (Item :     Element);
      entry Dequeue (Item : out Element);

      procedure Empty_Queue;

      function Is_Empty return Boolean;
      function Is_Full  return Boolean;

   private
      Queue : Queue_Type;

   end Protected_Queue;

   function Dequeue (Queue : in out Protected_Queue) return Element;

private
   subtype Index is Natural range 0 .. Size;
   type List is array (Index) of Element;
   type Queue_Type is record
      Top, Free : Index   := Index'First;
      Is_Empty  : Boolean := True;
      Elements  : List;
   end record;
end Queue_Pack_Protected_Generic;

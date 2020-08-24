--
-- Uwe R. Zimmer, Australia, 2015
--
generic
   type Element is private;
   type Marker is mod <>;
package Stack_Pack_Private is

   type Queue_Type is limited private;

   procedure Enqueue (Item :     Element; Queue : in out Queue_Type);
   procedure Dequeue (Item : out Element; Queue : in out Queue_Type);

   function Is_Empty (Queue : Queue_Type) return Boolean;
   function Is_Full  (Queue : Queue_Type) return Boolean;

   Queue_overflow, Queue_underflow : exception;

private
   type List is array (Marker) of Element;
   type Queue_Type is record
      Top, Free : Marker  := Marker'First;
      Is_Empty  : Boolean := True;
      Elements  : List;
   end record;
end Stack_Pack_Private;

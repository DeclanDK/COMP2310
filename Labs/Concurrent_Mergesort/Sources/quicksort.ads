generic

   type Element       is private;
   type Index         is (<>);
   type Element_Array is array (Index range <>) of Element;

   with function "<"  (Left, Right : Element) return Boolean is <>;

procedure Quicksort (Field : in out Element_Array);

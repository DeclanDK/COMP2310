with Maybe_Type; 

generic 
   
   Max_Length : Positive;
   with package Maybe_element is new Maybe_Type(<>); use Maybe_element;
   with function "<" (A, B : Element) return Boolean is <>;
   
package Ordered_Bounded_List is

   subtype Data_Index is Positive range 1 .. Max_Length;
   
   type List is array (Data_Index range <>) of Element;
   
   function Add_To_List (E : Element) return Maybe;
   
   function List_Full    return Boolean;
   function Last_Element return Element;
   function Read_List    return List;

end Ordered_Bounded_List;

--
--  Uwe R. Zimmer, Australia, 2017
--

package body Queue_Pack_Protected_Generic is

   protected body Protected_Queue is

      entry Enqueue (Item : Element) when not Is_Full is

      begin
         Queue.Elements (Queue.Free) := Item;
         Queue.Free     := Index'Succ (Queue.Free) mod Size;
         Queue.Is_Empty := False;
      end Enqueue;

      entry Dequeue (Item : out Element) when not Is_Empty is

      begin
         Item           := Queue.Elements (Queue.Top);
         Queue.Top      := Index'Succ (Queue.Top) mod Size;
         Queue.Is_Empty := Queue.Top = Queue.Free;
      end Dequeue;

      procedure Empty_Queue is

      begin
         Queue.Top      := Index'First;
         Queue.Free     := Index'First;
         Queue.Is_Empty := True;
      end Empty_Queue;

      function Is_Empty return Boolean is
        (Queue.Is_Empty);

      function Is_Full return Boolean is
        (not Queue.Is_Empty and then Queue.Top = Queue.Free);

   end Protected_Queue;

   function Dequeue (Queue : in out Protected_Queue) return Element is

      Item : Element;

   begin
      Queue.Dequeue (Item);
      return Item;
   end Dequeue;

end Queue_Pack_Protected_Generic;

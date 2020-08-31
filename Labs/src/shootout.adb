with Ada.Text_IO; use Ada.Text_IO;
with Boss_Office;
procedure Shootout is

   type Colours is (Black, White, Blue, Blonde, Orange, Brown, Pink);

   package Office is new Boss_Office (Choices => Colours);

   task type Gangster;
   task body Gangster is

   begin
      for Colour in Colours loop
         if Office.Can_I_be_Mr (Colour) then

            exit;
         end if;
      end loop;
   end Gangster;

   Gangsters : array (Colours) of Gangster; pragma Unreferenced (Gangsters);

begin null;
end Shootout;

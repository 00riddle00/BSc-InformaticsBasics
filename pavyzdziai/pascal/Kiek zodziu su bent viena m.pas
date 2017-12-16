// 7.
Program Eilutes;
var zodis:string;
    rasta: boolean;
    pozicija, kiekis, i:integer;
Begin
Writeln ('Programa suskaiciuos kiek ivestoje teksto eiluteje yra zodziu su bent viena m raide');
Writeln ();
WriteLn('Iveskite teksto eilute');
Readln (zodis);
Writeln ();

kiekis:=0;
rasta:= false;
for  i:=1 to length(zodis) do
Begin

   if(zodis[i] = 'm') then
   begin
         rasta:= true;
   end;
   
   if(rasta = true) then
   begin
        if(zodis[i] = ' ') then
        begin
               inc(kiekis);
               rasta:= false;
        end;
    end;
End;

Writeln ();
Writeln ('Rastu zodziu kiekis yra ', kiekis);
Writeln ();

Writeln ();
Writeln ('Programa baige darba');
Readln;
End.
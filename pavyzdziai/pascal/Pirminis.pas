{ A&B }
{ VU MIF I kursas, Informatika, V grupe }
{ Uzduotis nr. 2}
{ Ivesti naturalu skaiciu ir patikrinti ar jis pirminis. }

program Pirminis;
  var sk: integer;
    
function pirminis(sk:integer):boolean;
  var i,kiek:integer;
begin
   pirminis:=true;
   kiek:=1;
   if sk mod 2 = 0
   then
      pirminis:=false
   else
   begin
        i:=3;
        while pirminis and (sqr(i) <= sk) do
        begin
        if sk mod i = 0 then
            pirminis:=false;
        kiek:=kiek+1;
        i:=i+2;
        end;
   end;
   Writeln('Ciklas prasisuko ',kiek,' kart.');
end;

begin

  Writeln('Iveskite naturaluji skaiciu.');
  Readln(sk);

if pirminis(sk)
   then
       Writeln('Skaicius ',sk,' yra pirminis')
   else
       Writeln('Skaicius ',sk,' nera pirminis');
       
Readln;
end.

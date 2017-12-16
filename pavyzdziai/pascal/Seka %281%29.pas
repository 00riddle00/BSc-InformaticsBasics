{ Arunas Bendoraitis }
{ VU MIF Informatika, V grupe }
{ Uzduotis nr. 1, variantas nr. 15 }
{ Ivesti sveiku skaiciu seka, kurios pabaiga zymima skaiciumi 0. Isvesti nariu, kurie baigiasi 3 ir prasideda 2, skaiciu. }

program Seka;
    var i, pask, kiek: integer;
begin
  Writeln('Iveskite sveiku skaiciu seka, kurios pabaiga zymima skaiciumi 0.');
  Readln(i);
  kiek:=0;
  while i <> 0 do
    begin
        pask:= i mod 10;
        while i > 9 do
           i:= i div 10;
        if pask = 3 then
            if i = 2 then
                kiek:= kiek+1;
        Readln(i);
    end;
  Writeln('Sekoje yra ',kiek,' skaiciai, kurie baigiasi 3 ir prasideda 2.');
  Readln;
end.
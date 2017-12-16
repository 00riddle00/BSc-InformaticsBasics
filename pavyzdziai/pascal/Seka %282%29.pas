{ Arunas Bendoraitis }
{ VU MIF Informatika, V grupe }
{ Uzduotis nr. 1, variantas ? }
{ Ivesti sveiku skaiciu seka, kurios pabaiga zymima skaiciumi 0. Isvesti nariu, kurie dalinasi is 11, skaiciu bei ju skaitmenu suma. }

program Program1;
    var i, suma, pask, kiek: integer;
begin
  Writeln('Iveskite sveiku skaiciu seka, kurios pabaiga zymima skaiciumi 0.');
  Readln(i);
  kiek:=0;
  suma:=0;
  while i <> 0 do
    begin
        if  i mod 11 = 0 then
            begin
                kiek:= kiek+1;
                while i > 9 do
                begin
                    pask:= i mod 10;
                    suma:= suma+pask;
                    i:= i div 10;
                end;
              suma:= suma + i;
            end;
        Readln(i);
    end;
  Writeln('Sekoje yra ',kiek,' skaiciai, kurie dalinasi is 11, o ju skaitemu suma lygi ',suma,'.');
  Readln;
end.
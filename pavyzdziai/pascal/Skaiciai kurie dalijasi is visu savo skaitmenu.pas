{ Arunas Bendoraitis ... }
{ VU MIF I kursas, Informatika, V grupe }
{ Uzduotis nr. 3}
{ Atspauzdina skaicius nuo 100 iki 999 , kurie dalijasi is visu savo skaitmenu. }

program Program1;
  var pirmas, vidurinis, paskutinis, skaicius: integer;

begin

  for pirmas:=1 to 9 do
  begin
    for vidurinis:=1 to 9 do
    begin
      for paskutinis:=1 to 9 do
      begin
      skaicius:=pirmas*100+vidurinis*10+paskutinis;
      if skaicius mod pirmas = 0 then
        if skaicius mod vidurinis = 0 then
         if skaicius mod paskutinis = 0 then
            Writeln(skaicius);
      end;
    end;
  end;
 
Readln;
end.

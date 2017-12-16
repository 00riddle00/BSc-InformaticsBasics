{ A&B }
{ VU MIF I kursas, Informatika, V grupe }
{ Uzduotis nr. 1}
{ Duotas sveikasis skaicius. Raskite jo skaitmenu suma. }

program SkaitmenuSuma;
  var sk, suma, skaitmuo: integer;

begin

  Writeln('Iveskite sveikaji skaiciu.');
  Readln(sk);

  suma:= 0;

  while (sk <> 0) do
  begin
        skaitmuo := sk mod 10;
        suma := suma + skaitmuo;
        sk := sk div 10;
  end;
  
  Writeln('Skaitmenu suma yra: ', suma);

Readln;
end.
                
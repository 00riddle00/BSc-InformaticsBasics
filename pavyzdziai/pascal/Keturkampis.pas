{ Koreguota Aruno Bendoraicio }

program Noname2; {programos antraštė }
var sk : array [1..50,1..50] of integer;  {kintamajam sk priskiriame dvimatį masyvą }
    i,a, N,x,ilgis,z,c,K :integer;  {kiti reikalingi kintamieji }
begin  {programos pradžios sakinys }
  WriteLn('Įveskite n-tąjį skaičių');  { Paprašome įvesti n-tąjį skaičių }
  ReadLn(N);  {nuskaitome tą skaičių }
  K:=N; { kintamąjam K priskiriame nuskaitytą skaičių }
  ilgis:=2*N+1;  {apskaičiuojame ilgį ir plotį (jie yra lygūs) }
  WriteLn('Keturkampis:'); { išvedame žodį 'Keturkampis' }
  
  sk[N+1,N+1]:=0; {kvadrato viduriui (dvimačio masyvo viduriui) iš karto priskiriame nulį }
  
x:=1; { Papildomas skaičius reikalingas formuojant dvimatį masyvą }
for a:=1 to N do {ciklas nuo 1 iki N, nes N yra kvadrato gylis (centre nulį jau įrašėme) }
begin  {ciklo pradžia }
  for i:=x to ilgis do {ciklas suformuoti atitinkamą dvimatį masyvą, kuris vaizduotų kvardratą (pirma dalis) }
  begin  {ciklo pradžia }
    sk[i,ilgis]:=K;
    sk[x,i]:=K;
  end;   {ciklo pabaiga }

    for i:=x+1 to ilgis do {ciklas suformuoti atitinkamą dvimatį masyvą, kuris vaizduotų kvardratą (antra dalis) }
  begin  {ciklo pradžia }
    sk[i,x]:=K;
    sk[ilgis,i]:=K;
  end;   {ciklo pabaiga }

K:=K-1; { K sumažinam vienetu }
x:=x+1;  { x padidinam vienetu }
ilgis:=ilgis-1;   { ilgi sumažinam vienetu}
end; {ciklo pabaiga }

  for z:=1 to 2*N+1 do
  begin  {ciklo pradžia }
    for c:=1 to 2*N+1 do
    begin  {ciklo pradžia }
    Write(sk[z,c]); {atspauzdinam masyvą }
    end;  {ciklo pabaiga }
    writeln; { atspauzdinam naują eilutę }
  end; {ciklo pabaiga }
  Readln; {uždelsimas }
end.  {programos pabaiga }
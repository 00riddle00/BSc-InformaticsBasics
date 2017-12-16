{ Arunas Bendoraitis }
{ VU MIF I kursas, Informatika, V grupë }
{ Užduotis nr. 3}
{ Ivesti sveika skaiciu N. Ivesti N sveiku skaiciu a1, a2,…an. Jeigu tarp ju visi skaiciai yra neigiami arba neneigiami
– išvesti pranešima. Priešingu atveju apskaiciuoti reiškini:S=x1*y1+x2*y2+xp*yp kur xi – neigiami sekos nariai,
einantys iš eiles, yi – neneigiami sekos nariai, einantys iš eiles, p – min(n,t) ,kur n- neigiamu sekos nariu skaicius,
o t- neneigiamu sekos nariu skaicius. }

program Program1; {programos antrašte }

var n, i, sk, a,b, min, suma: integer; { kintamieji }
    neigiami, teigiami: array[1..100] of integer; {neigiamu ir teigiamu skaiciu masyvai }
begin   {programos pradžia }
  Writeln('Iveskite sveika skaiciu N.');  { paprašome, kad ivestu skaiciu N }
  Readln(n); {Nuskaitome ta skaiciu }
  Writeln('Iveskite ',n,' sveikus skaicius.'); { Paprašome, kad ivestu tuos N skaiciu }
   a:=0;  { a ir b kintamiegi skirti masyvo eiliškumui palaikyti, kad visi elementai eitu iš eiles }
   b:=0;
   for i:=1 to n do {ciklas nuskaityti tuos N skaiciu ir ivesti i masyva }
   begin  {ciklo pradžia }
     Readln(sk);
     if sk > 0 then  { jei skaicius didesnis už nuli, tai yra teigiamas, tada }
     begin
        a:=a+1; { a tai tarkim masyvo elemento numeris, tai iš pradžiu ji reikia padaryti 1, o po jis dideja 2 , 3 ir t.t. }
        teigiami[a]:=sk;  { i masyva idedame teigiama skaiciu }
     end
     else   { priešingu atveju (vadinasi skaicius buvo neigiamas}
     begin
        b:=b+1; {tas pats sh kas su a aukšciau }
        neigiami[b]:=sk;  { tai ta skaiciu idedame i neigiamu skaiciu masyvu }
     end;
   end;  {ciklo pabaiga }
    { Svarbu! , mes laikomysime, kad nulis nei teigiamas, nei neigiamas. Jei Tumasonis pasakys, kad nulis yra teigiamas,
    gali viska ištrinti ir daryti iš naujo :D Ha ha }
    if(teigiami[1] = 0) then {Taigi, jeigu teigiamu skaiciu masyvo pirmas skaicius yra nulis (reiškias jis neturi jokiu elementu) }
        Writeln('Visi ivesti skaiciai yra neigiami')  {tada parašome, jog visi skaiciai buvo neigiami }
    else if(neigiami[1] = 0) then {O jeigu neigiamu skaiciu masyvo pirmas skaicius yra nulis (reiškias jis neturi jokiu elementu) }
        Writeln('Visi ivesti skaiciai yra teigiami') {tada parašome, jog visi skaiciai buvo teigiami }
    else  {priešingu atveju, jei tarp ju buvo ir teigiamu ir neigiamu }
    begin
    if a > b then {nustatome "min(n,t) ,kur n- neigiamu sekos nariu skaicius,o t- neneigiamu sekos nariu skaicius"  n ir t, pas mus yra a ir b }
        min:=b {na tai jei b buvo didesnis, tai aišku, kad mažesnis bus a }
    else
        min:=a;  { o cia priešingu atveju, akivaizdu, jog mažesnis a bus }

    suma:=0; {musu suma pradžiai lygi nuliui. }
    for i:=1 to min do {ciklas apskaiciu ta suma pagal ta formule iš salygos }
        suma:=suma + neigiami[i]*teigiami[i]; {tiesiog prie sumos pridedame neigiamo ir teigiamo skaiciaus sandauga (kaip formuleje) }

    Writeln('Suma pagal formule lygi: ',suma);   {parašome, kad ta suma lygi }
    end;
   
Readln;
end.  {programos pabaiga :D }

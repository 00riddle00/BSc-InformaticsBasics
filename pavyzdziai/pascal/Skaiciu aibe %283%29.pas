{ Arunas Bendoraitis }
{ VU MIF I kursas, Informatika, V grup� }
{ U�duotis nr. 3}
{ Ivesti sveika skaiciu N. Ivesti N sveiku skaiciu a1, a2,�an. Jeigu tarp ju visi skaiciai yra neigiami arba neneigiami
� i�vesti prane�ima. Prie�ingu atveju apskaiciuoti rei�kini:S=x1*y1+x2*y2+xp*yp kur xi � neigiami sekos nariai,
einantys i� eiles, yi � neneigiami sekos nariai, einantys i� eiles, p � min(n,t) ,kur n- neigiamu sekos nariu skaicius,
o t- neneigiamu sekos nariu skaicius. }

program Program1; {programos antra�te }

var n, i, sk, a,b, min, suma: integer; { kintamieji }
    neigiami, teigiami: array[1..100] of integer; {neigiamu ir teigiamu skaiciu masyvai }
begin   {programos prad�ia }
  Writeln('Iveskite sveika skaiciu N.');  { papra�ome, kad ivestu skaiciu N }
  Readln(n); {Nuskaitome ta skaiciu }
  Writeln('Iveskite ',n,' sveikus skaicius.'); { Papra�ome, kad ivestu tuos N skaiciu }
   a:=0;  { a ir b kintamiegi skirti masyvo eili�kumui palaikyti, kad visi elementai eitu i� eiles }
   b:=0;
   for i:=1 to n do {ciklas nuskaityti tuos N skaiciu ir ivesti i masyva }
   begin  {ciklo prad�ia }
     Readln(sk);
     if sk > 0 then  { jei skaicius didesnis u� nuli, tai yra teigiamas, tada }
     begin
        a:=a+1; { a tai tarkim masyvo elemento numeris, tai i� prad�iu ji reikia padaryti 1, o po jis dideja 2 , 3 ir t.t. }
        teigiami[a]:=sk;  { i masyva idedame teigiama skaiciu }
     end
     else   { prie�ingu atveju (vadinasi skaicius buvo neigiamas}
     begin
        b:=b+1; {tas pats sh kas su a auk�ciau }
        neigiami[b]:=sk;  { tai ta skaiciu idedame i neigiamu skaiciu masyvu }
     end;
   end;  {ciklo pabaiga }
    { Svarbu! , mes laikomysime, kad nulis nei teigiamas, nei neigiamas. Jei Tumasonis pasakys, kad nulis yra teigiamas,
    gali viska i�trinti ir daryti i� naujo :D Ha ha }
    if(teigiami[1] = 0) then {Taigi, jeigu teigiamu skaiciu masyvo pirmas skaicius yra nulis (rei�kias jis neturi jokiu elementu) }
        Writeln('Visi ivesti skaiciai yra neigiami')  {tada para�ome, jog visi skaiciai buvo neigiami }
    else if(neigiami[1] = 0) then {O jeigu neigiamu skaiciu masyvo pirmas skaicius yra nulis (rei�kias jis neturi jokiu elementu) }
        Writeln('Visi ivesti skaiciai yra teigiami') {tada para�ome, jog visi skaiciai buvo teigiami }
    else  {prie�ingu atveju, jei tarp ju buvo ir teigiamu ir neigiamu }
    begin
    if a > b then {nustatome "min(n,t) ,kur n- neigiamu sekos nariu skaicius,o t- neneigiamu sekos nariu skaicius"  n ir t, pas mus yra a ir b }
        min:=b {na tai jei b buvo didesnis, tai ai�ku, kad ma�esnis bus a }
    else
        min:=a;  { o cia prie�ingu atveju, akivaizdu, jog ma�esnis a bus }

    suma:=0; {musu suma prad�iai lygi nuliui. }
    for i:=1 to min do {ciklas apskaiciu ta suma pagal ta formule i� salygos }
        suma:=suma + neigiami[i]*teigiami[i]; {tiesiog prie sumos pridedame neigiamo ir teigiamo skaiciaus sandauga (kaip formuleje) }

    Writeln('Suma pagal formule lygi: ',suma);   {para�ome, kad ta suma lygi }
    end;
   
Readln;
end.  {programos pabaiga :D }

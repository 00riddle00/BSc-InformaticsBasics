{ Arunas Bendoraitis }
{ VU MIF I kursas, Informatika, V grup� }
{ U�duotis nr. 4}
{ Ivesti sveika skaiciu W. Ivesti sveikus skaicius a1,a2,...aW.
Apskaiciuoti nelyginiu nariu a1,a3 ir t.t. Ir lyginiu nariu (a2,a4, ...)
minimuma ir maximuma. I�vesti lyginiu ir nelyginiu nariu minimumu skirtuma
ir nelyginiu ir lyginiu nariu maximumu skirtuma. }

program Program1; {programos antra�te }

var n, i, sk, a,b, l_min, l_max, n_min, n_max: integer; { kintamieji }
    lyginiai, nelyginiai: array[1..100] of integer; {lyginiu ir nelyginiu skaiciu masyvai }
begin   {programos prad�ia }
  Writeln('Iveskite sveika skaiciu N.');  { papra�ome, kad ivestu skaiciu N }
  Readln(n); {Nuskaitome ta skaiciu }
  Writeln('Iveskite ',n,' sveikus skaicius.'); { Papra�ome, kad ivestu tuos N skaiciu }
   a:=0;  { a ir b kintamiegi skirti masyvo eili�kumui palaikyti, kad visi elementai eitu i� eiles }
   b:=0;
   for i:=1 to n do {ciklas nuskaityti tuos N skaiciu ir ivesti i masyva }
   begin  {ciklo prad�ia }
     Readln(sk);
     if (sk mod 2 = 0) then  { jei skaicius lyginis, tada }
     begin
        a:=a+1; { a tai tarkim masyvo elemento numeris, tai i� prad�iu ji reikia padaryti 1, o po jis dideja 2 , 3 ir t.t. }
        lyginiai[a]:=sk;  { i masyva idedame lygini skaiciu }
     end
     else  { prie�ingu atveju (vadinasi skaicius buvo neigiamas}
     begin
        b:=b+1; {tas pats sh kas su a auk�ciau }
        nelyginiai[b]:=sk;  { tai ta skaiciu idedame i nelygini skaiciu masyvu }
     end;
   end;  {ciklo pabaiga }
    
    l_max:=lyginiai[1];
    l_min:=lyginiai[1];
    for i:=2 to a do
    begin
        if lyginiai[i] > l_max then l_max:=lyginiai[i]
        else if lyginiai[i] < l_min then l_min:=lyginiai[i];
    end;
    
    n_max:=nelyginiai[1];
    n_min:=nelyginiai[1];
    for i:=2 to b do
    begin
        if nelyginiai[i] > n_max then n_max:=nelyginiai[i]
        else if nelyginiai[i] < n_min then n_min:=nelyginiai[i];
    end;
    
    a:=l_min - n_min;
    b:=n_max - l_max;
    
    Writeln('Lyginiu ir nelyginiu nariu minimumu skirtumas: ',a);
    Writeln('Nelyginiu ir lyginiu ir nariu maximumu skirtumas: ',b);
    
Readln;
end.

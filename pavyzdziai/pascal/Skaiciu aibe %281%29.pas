{ Arunas Bendoraitis }
{ VU MIF I kursas, Informatika, V grupe }
{ Uzduotis nr. 3, variantas 10}
{ Ivesti sveika skaciu N. Ivesti N sveiku skaiciu. Tarp ivestu skaiciu rasti ir isvesti
du skaicius artimiausius ivestu skaiciu vidurkiui: viena mazesni uz vidurki, o kita didesni. }

program N_Masyvas;

var n, i, sk, suma, maz, did: integer;
    vid:real;
    skaiciai: array[1..100] of integer;
begin
  Writeln('Iveskite sveika skaiciu N.');
  Readln(n);
  Writeln('Iveskite pirmaji skaiciu.');
  Readln(sk);
  skaiciai[1]:= sk;
  
  did:=sk;
  maz:=sk;
  suma:=0;
  
  Writeln('Iveskite likusius ',n-1,' sveikus skaicius.');
  
   for i:=2 to n do
   begin
     Readln(sk);
     suma:= suma+sk;
     skaiciai[i]:= sk;
     if sk > did then
     did:=sk
     else if sk < maz then
     maz:=sk;
   end;
   
   vid:= suma / n;

   for i:=1 to n do
   begin
     if skaiciai[i] > vid then
        if skaiciai[i] < did then
            did:=skaiciai[i];
            
     if skaiciai[i] < vid then
        if skaiciai[i] > maz then
            maz:=skaiciai[i];
   end;
   
   Writeln('Vidurkis: ',vid:4:2);
   Writeln('Artimiausias vidurkiui (mazesnis): ',maz);
   Writeln('Artimiausias vidurkiui (didesnis): ',did);
   
Readln;
end.

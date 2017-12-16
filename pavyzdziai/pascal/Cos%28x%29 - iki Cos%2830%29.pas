{ Aivaras Bujauskas }
{ VU MIF Informatika, I kursas, V grupe }
{ Uzduotis nr. 5 }
{ Funkcija cos(x) apskaiciuojama taip: }
{ cos(x)=1-(x^2/2!)+(x^4/4!)-...+(-1)^n*((x^2n)/(2n!)+... }
{ Sudarykite jos apskaiciavimo programa. }
{ x iveskite klaviatura, o rezultata isveskite i ekrana. }
{ Skaiciuokite tikslumu e=0.00001. }
{ Palyginimui i ekrana isveskite ir reiksme, gauta  standartine funkcija cos(x).}

program Bevarde;
  const e=0.00001;
  var x, a, s, n, c : real;
begin
  Writeln('Iveskite x:');
  readln(x);
  a:=1;
  s:=1;
  n:=0;
  c:=cos(x);
  repeat
    a:=(-x*x*a)/((2*n+1)*(2*n+2));
    s:=s+a;
    n:=n+1;
  until abs(a) < e;
  
  writeln('s: ',s:2:5);
  writeln('cos: ',c:2:5);
  readln;
end.

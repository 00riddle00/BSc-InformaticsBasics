{ Arunas Bendoraitis }
{ VU MIF I kursas, Informatika, V grupe }
{ Uzduotis nr. 4}
{ Salyga}

program Saknis; {programos antrašte }

const e: real = 0.00001;
var a: integer; { kintamieji }
    xn, xn1, x2: real;
    
begin   {programos pradžia }
    Writeln('Iveskite tegiama skaiciu a');
    Readln(a);
    
    if (a <=0) then
        Writeln('Ivestas skaicius a nera teigiamas')
    else
    begin
        if(a <= 1) then
            xn:=0.95
        else if (a > 1) AND (a <= 25) then
            xn:=a/5
        else if (a > 25) then
            xn:=a/25;

        xn1:= (4/5)*xn+a/(5*(xn*xn*xn*xn));
        x2:=5/4*a*abs(xn1-xn);
    
        While (x2 > e) do
        begin
            xn:=xn1;
            xn1:=(4/5)*xn+a/(5*(xn*xn*xn*xn));
            x2:=5/4*a*abs(xn1-xn);
        end;

        Writeln('Penkto laipsnio saknis skaiciaus ',a,' yra lygi ',xn1:5:5,'...');
    end;
Readln;
end.  {programos pabaiga}

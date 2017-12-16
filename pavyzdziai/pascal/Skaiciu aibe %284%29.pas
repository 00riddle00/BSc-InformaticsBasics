{Arunas Bendoraitis}
{VU MIF Ik. Inf. 5gr. }
{Uþduotis. Nr. 4}
{Áveskite sveikà skaièiø N. Ávesti N sveikø skaièiø.}
{Jeigu tarp ávestø skaièiø neatsiras neigiamø arba neneigiamø, iðvesti praneðimà.}
{Prieðingu atvëju, rasti neigiamø skaièiø maksimumà (MAX) ir teigiamø skaièiø}
{minimumà (MIN) bei apskaièiuoti: K=max(|MAX|,|MIN|). Iðvesti tuos skaièius,}
{kurie didesni uþ K.}

program Program1;
 var n, i, sk, a,b,c, kmax, max, min: integer;
    neigiami, teigiami, didesni: array[1..100] of integer;
begin
  WriteLn('Iveskite sveikà skaièiø N.');
  Readln(n);
  Writeln('Iveskite ',n,' sveikus skaièius.');
   a:=0;
   b:=0;
   for i:=1 to n do
   begin
     Readln(sk);
     if sk > 0 then
     begin
        a:=a+1;
        teigiami[a]:=sk;
     end
     else
     begin
        b:=b+1;
        neigiami[b]:=sk;
     end;
   end;
   
    if (teigiami[1] = 0) then
        Writeln('Visi ivesti skaiciai yra neigiami')
    else if (neigiami[1] = 0) then
        Writeln('Visi ivesti skaiciai yra teigiami')
    else
    begin
        max:=neigiami[1];
        for i:=2 to b do
            if neigiami[i] > max then max:=neigiami[i];
        min:=teigiami[1];
        for i:=2 to a do
            if teigiami[i] < min then min:=teigiami[i];
            
        if abs(max)>abs(min) then
            kmax:=abs(max)
        else
            kmax:=abs(min);
            
        c:=0;
        for i:=1 to a do
        begin
            if teigiami[i] > kmax then
            begin
                c:=c+1;
                didesni[c]:=teigiami[i];
            end;
        end;
        
        if(didesni[1]=0) then
            Writeln('Didesniu skaiciu uz ',kmax,' nera')
        else
        begin
        Write('Didesni skaiciai uz ',kmax,' yra ');
        for i:=1 to c do
            Write(didesni[i],' ');
        end;

    end;
Readln;
end.

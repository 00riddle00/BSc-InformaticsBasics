{Arunas Bendoraitis}
{VU MIF Ik. Inf. 5gr. }
{U�duotis. Nr. 4}
{�veskite sveik� skai�i� N. �vesti N sveik� skai�i�.}
{Jeigu tarp �vest� skai�i� neatsiras neigiam� arba neneigiam�, i�vesti prane�im�.}
{Prie�ingu atv�ju, rasti neigiam� skai�i� maksimum� (MAX) ir teigiam� skai�i�}
{minimum� (MIN) bei apskai�iuoti: K=max(|MAX|,|MIN|). I�vesti tuos skai�ius,}
{kurie didesni u� K.}

program Program1;
 var n, i, sk, a,b,c, kmax, max, min: integer;
    neigiami, teigiami, didesni: array[1..100] of integer;
begin
  WriteLn('Iveskite sveik� skai�i� N.');
  Readln(n);
  Writeln('Iveskite ',n,' sveikus skai�ius.');
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

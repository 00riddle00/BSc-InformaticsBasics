{ Arunas Bendoraitis }
{ VU MIF Informatika, I kursas, V grupe }
{ Uzduotis nr. 4}
{ Sesioliktainis -> UTF-8 dvejetainis ir UTF-8 sesioliktainis + lentele }

program utf8;
var hexa, hexa2, binary, utf8_hexa, lk, pap : string;
    hexa3 : array[1..30] of integer;
    nuo,iki,j,y,x,i,variantas, desimal : integer;

{Procedura nustatyti is kurio intervalo yra sesioliktaine israiska ir pagal tai suskirtyti i tris skirtingus variantus }
procedure variant(hexa:string; var variantas:integer);
begin
         if(hexa[1]='0') then
            if(hexa[2]='0') then
                if(hexa[3]<='7') then
                    variantas:=3
                else
                    variantas:=2
            else if(hexa[2]<='7') then
                variantas:=2
            else variantas:=1
        else variantas:=1;
end;


{programos prasþia}
begin
      Write('Iveskite sesioliktainio intervalo pradzia: ');
      readln(hexa);
      Write('Iveskite sesioliktainio intervalo pabaiga: ');
      readln(hexa2);
      if (length(hexa)=4) AND (length(hexa2)=4) then
      begin
         Val('$' + hexa, nuo);
         Val('$' + hexa2, iki);
         
         Write('Unicode | ');
         Write('UTF-8 Dvejetainis | ');
         Write('UTF-8 Sesioliktainis | ');

         Writeln;
            
         for y:=nuo to iki do
         begin
            desimal:=y;
            i := 1;
            while desimal <> 0 do
                begin
                    hexa3[i] := desimal mod 16;
                    desimal := desimal div 16;
                    i := i + 1;
                end;
            hexa:='';
            
            for j := (i - 1) downto 1 do
            begin
                if hexa3[j] < 10 then
                begin
                Str(hexa3[j], pap);
                hexa:= hexa + pap;
                end
                else
                begin
                {patikrinam skaicius didesnius uz 10 ir jiems priskiriam raides}
                    case hexa3[j] of
                    10: hexa:= hexa + 'A';
                    11: hexa:= hexa + 'B';
                    12: hexa:= hexa + 'C';
                    13: hexa:= hexa + 'D';
                    14: hexa:= hexa + 'E';
                    15: hexa:= hexa + 'F';
                    end; {Case pabaiga}
                end; {Else pabaiga}
            end; {For ciklo pabaiga}
            
                 if(length(hexa) = 1) then Insert('000',hexa,1)
                 else if (length(hexa) = 2) then Insert('00',hexa,1)
                 else if (length(hexa) = 3) then Insert('0',hexa,1);
                                    
                        variant(hexa, variantas);
        
                        {ciklas pavercia sesioliktainius simbolius i dvejetaini }
                        binary:='';
                        for i:=variantas to 4 do
                        begin
                            case hexa[i] of
                        '0' : binary:= binary + '0000';
                        '1' : binary:= binary + '0001';
                        '2' : binary:= binary + '0010';
                        '3' : binary:= binary + '0011';
                        '4' : binary:= binary + '0100';
                        '5' : binary:= binary + '0101';
                        '6' : binary:= binary + '0110';
                        '7' : binary:= binary + '0111';
                        '8' : binary:= binary + '1000';
                        '9' : binary:= binary + '1001';
                        'A' : binary:= binary + '1010';
                        'B' : binary:= binary + '1011';
                        'C' : binary:= binary + '1100';
                        'D' : binary:= binary + '1101';
                        'E' : binary:= binary + '1110';
                        'F' : binary:= binary + '1111';
                            otherwise
                                begin
                                Readln;
                                exit;
                                end
                            end; {case pabaiga }
                        end; {for ciklo pabaiga }
                        
                        
                if(variantas=2) then
                begin
                    Delete(binary,1,1);
                    Insert('110',binary,1);
                    Insert('10',binary,9);
                end
                else if(variantas=1) then
                begin
                    Insert('1110',binary,1);
                    Insert('10',binary,9);
                    Insert('10',binary,17);
                end;

                    utf8_hexa:='';
                    x:=1;
                    lk := Copy(binary, x,4);
                    while lk <> '' do
                    begin
                        if lk='0000' then utf8_hexa:= utf8_hexa + '0'
                        else if lk='0001' then utf8_hexa:= utf8_hexa + '1'
                        else if lk='0010' then utf8_hexa:= utf8_hexa + '2'
                        else if lk='0011' then utf8_hexa:= utf8_hexa + '3'
                        else if lk='0100' then utf8_hexa:= utf8_hexa + '4'
                        else if lk='0101' then utf8_hexa:= utf8_hexa + '5'
                        else if lk='0110' then utf8_hexa:= utf8_hexa + '6'
                        else if lk='0111' then utf8_hexa:= utf8_hexa + '7'
                        else if lk='1000' then utf8_hexa:= utf8_hexa + '8'
                        else if lk='1001' then utf8_hexa:= utf8_hexa + '9'
                        else if lk='1010' then utf8_hexa:= utf8_hexa + 'A'
                        else if lk='1011' then utf8_hexa:= utf8_hexa + 'B'
                        else if lk='1100' then utf8_hexa:= utf8_hexa + 'C'
                        else if lk='1101' then utf8_hexa:= utf8_hexa + 'D'
                        else if lk='1110' then utf8_hexa:= utf8_hexa + 'E'
                        else if lk='1111' then utf8_hexa:= utf8_hexa + 'F';
                        x:=x+4;
                        lk := Copy(binary, x,4);
                    end;

                    Write(hexa:5,' ');
                    Write(binary:20);
                    Write(utf8_hexa:15);
                    Writeln;
            end; {ciklo pabaiga }
        end {salygos sakinio pabaiga }
      else
        begin
            Writeln('Sesioliktainis skaicius turi buti sudarytas is keturiu simboliu');
        end;

readln;
end.

{ Arunas Bendoraitis }
{ VU MIF I kursas, Informatika, V grupë }
{ Uþduotis nr. 4, variantas 10}
{ Šešioliktainis -> UTF-8 dvejetainis }

program utf;
var hexa : string;
    i,y,x,start,variantas,sub,desimal : integer;
    dvejetainis: array[1..16] of integer;

procedure hex2des(hexa:string; var desimal:integer);
begin
    if (hexa>='0') and (hexa<='9') then {jei ženklas yra skaicius}
        desimal:=ord(hexa[1])-ord('0') {ascii skaiciaus kodas - ascii '0' kodas}
    else if (hexa>='A') and (hexa<='F') then  {jei ženklas yra Didžioji raide}
        desimal:=ord(hexa[1])-ord('A')+10 {ascii raides kodas - ascii 'A'+10 kodas} {A atitinka 10 dešimtaineje}
    else if (hexa>='a') and (hexa<='f') then {jei ženklas yra mažoji raide}
        desimal:=ord(hexa[1])-ord('a')+10 {ascii raides kodas - ascii 'a'+10 kodas}
    else
        begin
            writeln('Blogai ivesti duomenys');
            readln;
            exit;  {iškarto užbaigiam programa }
        end;
end;

begin
      Write('Iveskite šešioliktaini skaiciu: ');
      readln(hexa);
      if (length(hexa)=4) then
      begin
      
      {Nustatome kuris variantas}
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
        
      start:=variantas;
      x:=0;

        for i:=start to 4 do
        begin
                hex2des(hexa[i], desimal);

                sub:=8;
                for y:=1 to 4 do
                begin
                    x:=x+1;
                    if (desimal>=sub) then
                    begin
                        dvejetainis[x]:=1;
                        desimal:=desimal-sub;
                    end
                    else
                        dvejetainis[x]:=0;
                        
                    sub:=sub div 2;   {decrement the power of subtractor by 1}
                end;
        end;
      end
      else
        begin
            Writeln('Šešioliktainis skaicius turi buti sudarytas iš keturiu simboliu');
            Readln;
            exit;
        end;
        
        Write('UTF-8 Dvejetainis: ');
        if(variantas=3) then
            for i:=1 to 8 do write(dvejetainis[i])
            
        else if(variantas=2) then
        begin
            Write(110);
            for i:=2 to 6 do
             write(dvejetainis[i]);
            Write(' ',10);
            for y:=7 to 12 do
             write(dvejetainis[y]);
        end
        else if(variantas=1) then
        begin
            Write(1110);
            for i:=1 to 4 do
             write(dvejetainis[i]);
            Write(' ',10);
            for y:=5 to 10 do
             write(dvejetainis[y]);
            Write(' ',10);
            for x:=11 to 16 do
             write(dvejetainis[x]);
        end;
        

        
readln;
end.

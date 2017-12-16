{ Arunas Bendoraitis }
{ VU MIF Informatika, I kursas, V grupe }
{ Uduotis nr. 4}
{ Šešioliktainis -> UTF-8 dvejetainis }

program utf8;
var hexa, binary : string;
    i,y,variantas,sub,desimal : integer;

{Procedura nustatyti iš kurio intervalo yra šešioliktaine israiska ir pagal tai suskirtyti i tris skirtingus variantus }
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

{Procedura šešioliktaini simboli (string tipo) pavercianti i dešimtaini (integer tipo) }
procedure hex2des(hexa:string; var desimal:integer);
begin
         if (hexa>='0') and (hexa<='9') then {jei enklas yra skaicius}
            desimal:=ord(hexa[1])-ord('0') {ascii skaiciaus kodas - ascii '0' kodas}
         else if (hexa>='A') and (hexa<='F') then  {jei enklas yra Didioji raide}
            desimal:=ord(hexa[1])-ord('A')+10 {ascii raides kodas - ascii 'A'+10 kodas} {A atitinka 10 dešimtaineje}
         else if (hexa>='a') and (hexa<='f') then {jei enklas yra maoji raide}
            desimal:=ord(hexa[1])-ord('a')+10 {ascii raides kodas - ascii 'a'+10 kodas}
         else
            begin
                writeln('Blogai ivesti duomenys');
                readln;
                exit;  {iškarto ubaigiam programa }
            end;
end;

{programos pradia}
begin
      Write('Iveskite šešioliktaine išraiška sudaryta iš 4 simbliu: ');
      readln(hexa);
      if (length(hexa)=4) then
      begin
      
        variant(hexa, variantas);
        
        {ciklas apdoroja šešioliktainius simbolius,
        1. Pavercia simboli i dešimtaini
        2. Dešimtaini pavercia i dvejetaini }
        
        for i:=variantas to 4 do
        begin
                hex2des(hexa[i], desimal);  { paverciam šešioliktaini simboli i dešimtaini }

                sub:=8;
                {ciklas iš dešimtainio skaiciaus paversti i dvejetaini,
                 ciklas atliekamas 4 kartus, nes dešimtainiai skaiciai nuo 1 iki 15 daugiau nei 4 vietu dvejetainiuose neuima}
                for y:=1 to 4 do
                begin
                    if (desimal>=sub) then
                    begin
                        binary:=binary + '1';
                        desimal:=desimal-sub;
                    end
                    else binary:=binary + '0';
                        
                    sub:=sub div 2;
                end;
        end; {pagrindinio ciklo pabaiga }
      end {salygos sakinio pabaiga }
      else
        begin
            Writeln('Šešioliktainis skaicius turi buti sudarytas iš keturiu simboliu');
            Readln;
            exit;
        end;

        if(variantas=2) then
        begin
            Delete(binary,1,1);
            Insert('110',binary,1);
            Insert(' 10',binary,9);
        end
        else if(variantas=1) then
        begin
            Insert('1110',binary,1);
            Insert(' 10',binary,9);
            Insert(' 10',binary,18);
        end;

        Writeln('UTF-8 Dvejetainis: ', binary);

readln;
end.

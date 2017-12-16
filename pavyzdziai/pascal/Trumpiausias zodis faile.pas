{ Arunas Bendoraitis }
{ VU MIF Informatika, I kursas, V grupe }
{ Uzduotis nr. 5}
{ Is tekstinio failo surasti trumpiausia zodi }

program priebalsesa;
{programos kintamieji}
 var failas: text;
     zodis, trum_zodis: string;
     ilgis, trum_ilgis: integer;
     p1, p2: char;  {pozicijos}
     abecele: set of char = ['a'..'z', 'A'..'Z'];
{programos pradzia}
begin
     
     Assign(failas, 'failas.txt');  {kintamajam 'failas' priskiriame faila }
     Reset(failas);                 {paruosiame faila skaitymui }

     trum_ilgis:=1000;                  {tarkime ilgiausias zodis gali buti iš 1000 raidziu, atskaitos taškas}
     
     while not eof(failas) do           {kol ne failo pabaiga }
     begin
        read(failas, p1);               {nuskaitome pirma eilutes simboli }
        
        if(p1 in abecele) then          {jei jis prasideda raide tada ziuresim to zodzio ilgi}
        begin
            zodis:='';                  {zodis pradziai lygus niekam}
            ilgis:=0;                   {zozio ilgis lygus nuliui pradziai}
            repeat
                ilgis:=ilgis+1;         {ilgi didiname vienetu}
                zodis:=zodis+p1;        {prie nieko pridedam po viena simboli }
                read(failas, p1);       {nuskaitome simbolius is eiles }
            until not(p1 in abecele);   {kol simbolis nebe abeceles raide }

            if(ilgis < trum_ilgis) then {jei zodzio ilgis mazesnis uz trumpiausio zodzio ilgi}
            begin
                trum_zodis:=zodis;      {laikome ta zodi trumpiausiu}
                trum_ilgis:=ilgis;      {ir sakome, kad trumpiausio zodzio ilgis lygus tam ilgiui}
            end;
            zodis:= '';                 {nuo siol zodis lygus niekam }
        end;                            {if'o end'as }
        
        while not eoln(failas) do       {kol ne eilutes pabaiga }
        begin
            read(failas, p2);           {nuskaitome kita simboli, kad turetume su kuo lyginti}
            if (p1 = ' ') AND (p2 in abecele) then                {jei p1 lygus tarpui ir p2 yra raide, tada reiskias zodzio pradzia}
                begin
                    zodis:= p2;                                   {taigi zodis pradziai lygus p2}
                    ilgis:=1;                                     {o jo ilgis 1}
                end;
            if zodis <> '' then                                   {jei zodis nera niekas, ta prasme jei jam jau priskyreme pirmaja raide}
                begin
                    if((p1 in abecele) AND (p2 in abecele)) then  {jei p1 ir p2 yra raides}
                        begin
                            zodis:=zodis+p2;                      {tai prie zodio pridedama p2, nes p1 sukantis pirma karta ciklui bus pirma raide, tai delto p2}
                            ilgis:=ilgis+1;                       {o ilgi didiname vienetu}
                        end
                    else if ((p1 in abecele) AND (p2 = ' ')) then {jei p1 yra raide, o p2 yra tarpas, reiskias turime zodzio pabaiga}
                     begin
                         if(ilgis < trum_ilgis) then              {jei zodzio ilgis mazesnis uz trumpiausio zodzio ilgi}
                            begin
                                trum_zodis:=zodis;                {tai trumpiausiu zodziu laikome ta zodi}
                                trum_ilgis:=ilgis;                {o trumpiausiu ilgiu jo ilgi}
                            end;
                         zodis:='';                               {nuo siol zodis vel lygus niekam}
                     end;
                end;
            p1:=p2;                                               {sukeiciam kintamuosiuos kitam ciklui}
            
        end;
        Readln(failas); { persokam prie kitos eilutes }
     end;
     
     Write('Trumpiausias žodis: ', trum_zodis, ', jo ilgis: ', trum_ilgis);  {atspauzdiname trumpiausia zodi ir jo ilgi}
     Close(failas);     {uzdarome faila }
     
Readln;
end.

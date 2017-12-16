{ Arunas Bendoraitis }
{ VU MIF Informatika, I kursas, V grupe }
{ Uzduotis nr. 5}
{ Is tekstinio failo išrinkti zodzius, prasidedancius d raide }

program priebalsesa;
{programos kintamieji}
 var failas: text;
     zodis: string;
     p1, p2: char;  {pozicijos}
     abecele: set of char = ['a'..'z', 'A'..'Z'];
{programos pradzia}
begin
     
     Assign(failas, 'failas.txt');      {kintamajam 'failas' priskiriame faila }
     Reset(failas);                     {paruosiame faila skaitymui }

     while not eof(failas) do           {kol ne failo pabaiga }
     begin
        read(failas, p1);               {nuskaitome pirma eilutes simboli }
        
        if(p1 = 'D') OR (p1 = 'd') then {jei jis prasideda d arba D tada zodis mums tinkamas}
        begin
            zodis:='';                  {zodis pradziai lygus niekam }
            repeat
                zodis:=zodis+p1;        {prie nieko pridedam po viena simboli }
                read(failas, p1);       {nuskaitome simbolius is eiles }
            until not(p1 in abecele);   {kol simbolis nebe abeceles raide }

            Write(zodis, ' ');          {parasome ta zodi i ekrana }
            zodis:= '';                 {nuo siol zodis lygus niekam }
        end;                            {if'o end'as }
        
        while not eoln(failas) do       {kol ne eilutes pabaiga }
        begin
            read(failas, p2);           {nuskaitome kita simboli, kad turetume su kuo lyginti}
            if (p1 = ' ') AND ((p2 = 'd') OR (p2 = 'D')) then     {jei p1 lygus tarpui ir p2 lygus d ar D tada reiskias turim zodi kuris prasideda d ar D}
                begin
                    zodis:= p2;                                   {taigi zodis pradziai lygus p2, o p2 cia bus d arba D}
                end;
            if zodis <> '' then                                   {jei zodis nera niekas, ta prasme jei jam jau priskyreme ta d ar D, tai reikia toliau ji sudaryneti}
                begin
                    if((p1 in abecele) AND (p2 in abecele)) then  {jei p1 ir p2 yra raides}
                        zodis:=zodis+p2                           {tai prie zodio pridedama p2, nes p1 sukantis pirma karta ciklui bus pirma raide D ar d, tai delto p2}
                    else if ((p1 in abecele) AND (p2 = ' ')) then {jei p1 yra raide, o p2 yra tarpas, reiskias turime zodzio pabaiga}
                     begin
                         Write(zodis, ' ');                       {tai atspauzdinam tada ta zodi}
                         zodis:='';                               {nuo siol zodis vel lygus niekam}
                     end;
                end;
            p1:=p2;                                               {sukeiciam kintamuosiuos kitam ciklui}
            
        end;
        Readln(failas); { persokam prie kitos eilutes }
        Writeln;        {tiesiog padedame eilutes pabaiga ekrane }
     end;
     
     Close(failas);     {uzdarome faila }
     
Readln;
end.

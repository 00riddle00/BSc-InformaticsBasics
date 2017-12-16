// 4.
Program Eilutes;
const max = 100;
var N, i:integer;
    zodis:string;
    raide: char;
    buvo: boolean;
    zodziai: array [1..max] of string;
    pozicija:integer;
Begin
Writeln ('Programa is zodziu istrins norima raide.');
Writeln ();
WriteLn('Iveskite norimu zodziu skaiciu');
Readln (N);
Writeln ();
Writeln ('Iveskite zodzius');
  for i:= 1 to N do
    Begin
    readln (zodis);
    zodziai[i] := zodis;
    End;
    
  Writeln ();
  Writeln ('Iveskite raide, kuria norite istrinti');
  readln (raide);
  Writeln ();
  
  buvo:=false;
  Writeln ();
  for i:= 1 to N do
    Begin
    zodis:= zodziai [i];
    pozicija:= pos(raide, zodis);   // randam pirma pozicija
    while (pozicija <> 0) do        // kol yra ta raide zodyje
    Begin
        buvo:=true;
        Delete( zodis, pozicija, 1 ); // istrinam ta raide
        zodziai[i] := zodis;          // irasom atgal i masyva
        pozicija:= pos(raide, zodis)  // tikrinam ar dar yra ta raide
    End;
    End;
    
if (buvo = false)then Writeln('Zodziu su jusu raide nebuvo')      // Ar buvo pakeistas bent vienas zodis?
else
Begin
    Writeln ('Jusu zodziai be pasirinktos raides yra:' );
    for i:= 1 to N do
    Begin
    Writeln(zodziai[i]);
    End;

End;

Writeln ();
Writeln ('Programa baige darba');
Readln;
End.


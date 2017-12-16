// 2.
Program Eilutes;
const max = 100;
var N, i:integer;
    zodis:string;
    ilgiausias, trumpiausias: integer;
    zodziai: array [1..max] of string;
    kiekis:integer;
Begin
Writeln ('Programa suskaiciuos ir isves zodzius kurie baigiasi a arba A.');
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
  kiekis:=0;
  Writeln ();
  Writeln ('Jusu zodziai yra' );
  for i:= 1 to N do
    Begin
    zodis:= zodziai [i];
    paskutine_raide:=  zodis[length (zodis)];
    if ( paskutine_raide = 'a') OR (paskutine_raide = 'A')
    Then
       Begin
       writeln (zodis);
       kiekis:=kiekis+1
       End;
    End;
Writeln ();
Writeln ('Rastu zodziu kiekis yra ', kiekis);
Writeln ();
Writeln ('Programa baige darba');
Readln;
End.


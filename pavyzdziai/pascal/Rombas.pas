{Božena Kostecka}
{VU MIF Ik. inf. 5gr}
{Pradinis duomuo - skaitmuo N. Sudarykite programą, kuri išspausdintų rombą, sudarytą iš skaitmenų 0..N}
program abc;
  var i,j,n,k,m,p:longint;
begin
  writeln ('įveskite skaitmenį N');
  readln (n);
  for i:=n downto 0 do
    begin
    for k:=n downto i do
      write (k);
    for p:=i+1 to n do
      write (p);
    writeln;
    end;
  for i:=1 to n do
    begin
    for k:=n downto i do
       write (k);
    for p:=i+1 to n do
      write (p);
    writeln;
    end;
  readln;
end.

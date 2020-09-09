program Info3;

var x, y, z : integer;

procedure Suma (c: integer; var b, a : integer);
    begin
      a := b+c; b:= a + c; c := a+ b;
    end;

begin
    x := 0; y := 3; z := 2;
    Suma(y, z, x);
    writeln(x, z, y);
end.

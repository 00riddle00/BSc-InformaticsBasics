var a,b,c: integer;
procedure p;
    var a,b: integer;
    procedure r;
        var a: integer;
    begin
        a := 7; b := 8; c := 9;
    end;

begin
    a := 1; b := 2; c := 3; r;
    writeln(a,b,c);
end;

begin
    a := 4; b:= 5; c := 6; p;
    writeln(a, b, c);
end.


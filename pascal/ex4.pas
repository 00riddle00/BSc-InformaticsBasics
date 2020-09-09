var i,j,k : integer;
begin
    i := maxint - 10; j := 0; k := 0;
    writeln(maxint);
    repeat
        j := j + 1 mod 10; k := k+1; i := i div 10
    until i=0;
writeln(i, j, k);
end.




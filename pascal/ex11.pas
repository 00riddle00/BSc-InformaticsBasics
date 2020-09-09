program PowersOfTwo;

var
    linecount, num : integer;

begin
    num := 1;
    write(num:6, ', ');
    linecount := 1;
    while num * 2 < 20000 do
        begin
            num := num * 2;
            if num > 10000 then
                write(num)
            else
                write(num, ', ');
                num := num;
                linecount := linecount + 1;
            if linecount mod 5 = 0 then
                writeln();
        end;
end.


program Fibonacci;

const
    fi1 = 1;
    fi2 = 1;

var
    count, previous, current, temp : integer;

begin
    previous := fi1;
    current := fi2;
    write(previous, ' ');
    write(current, ' ');

    count := 1;
    while count <> 11 do
        begin
            temp := current;
            current := previous + current;
            write(current, ' ');
            previous := temp;
            count := count + 1
        end
end.


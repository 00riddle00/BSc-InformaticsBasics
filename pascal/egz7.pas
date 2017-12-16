program Info7;

type
    arraytype = array[-10..10] of integer;

var 
    w : arraytype;
    count : integer;
    index : integer;
    is_negative : boolean;

function FindLastNegative(a : arraytype) : integer;

    begin
        for count := 1 to 10 do
            begin
                if a[count] < 0 then
                    index := count;
            end;
    FindLastNegative := index;
    end;

begin

    for count := 1 to 10 do
        begin
            read(w[count]);
            if w[count] < 0 then 
               is_negative := True;
        end;

    if is_negative = True then
        FindLastNegative(w);
        writeln('Last negative index: ', FindLastNegative(w))


end.

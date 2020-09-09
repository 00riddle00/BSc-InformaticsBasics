program Info9;

type
    arraytype = array of integer;
    

var 
    w : array of integer;
    count : integer;
    index : integer;
    is_negative : boolean;

function FindLastNegative(a : array of integer) : integer;
    var
        count : integer;
    begin

        count := High(a);
        while a[count] > 0 do
            count := count - 1;

    FindLastNegative := count;

    end;

function FindSum(var a : array of integer) : integer;
    var sum : integer;
    begin
        sum := 0; 
        for count := 1 to 10 do
            begin
                sum := sum + a[count];
            end;

    FindSum := sum;  
    end;

begin

    SetLength(w, 10);
    for count := 1 to 10 do
        begin
            read(w[count]);
            if w[count] < 0 then 
               is_negative := True;
        end;

    if is_negative = True then
        writeln('Last negative: ', FindLastNegative(w));

    writeln('The sum of elements in the list is: ', FindSum(w));


end.

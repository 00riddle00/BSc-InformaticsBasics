type list = ^elem;
    elem = record
        inf: integer;
        next: list;
    end;

var
    listas : elem;

function a ( p : list) : integer;
    var i : integer;
    begin
        i := 0;
        while p <> nil do
            begin
                i := i + p^.inf;
                p := p^.next;
            end;
        a := i;
    end;

begin

listas := 1..10;

end.

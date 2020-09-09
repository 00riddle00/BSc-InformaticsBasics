program Pointers;

var p,q : ^integer;

begin 
    new(p); new(q); q^ := 3; p^ := q^;
    if p = q then p := nil else if p^ = q^ then q := p;
    if p = q then q^ := p^ + 1;
    writeln(p^);
    writeln('div', 8 / 3)
end.


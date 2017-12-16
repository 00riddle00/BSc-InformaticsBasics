var
    f : integer;
    p : ^pointer;
    o : ^integer;

begin

new(o);
new(p);

p^ := o;
writeln(o^);
writeln(f);

end.

program Math;

const
    total_no = 5;
    no1 = 45;
    no2 = 7;
    no3 = 68;
    no4 = 2;
    no5 = 34;

var
    sum : integer;
    avg : real;
    
begin
   sum := no1 + no2 + no3 + no4 + no5;
   avg := sum / 5;
   writeln('Number of integers = ', total_no);
   writeln('Number1 = ', no1);
   writeln('Number2 = ', no2);
   writeln('Number3 = ', no3);
   writeln('Number4 = ', no4);
   writeln('Number5 = ', no5);
   writeln('Sum = ', sum);
   writeln('Average = ', avg);
end.

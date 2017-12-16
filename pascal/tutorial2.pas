(* Author: Tomas Giedraitis 
   Date: 2016 March 12
   Description:
       Find the sum and average of five predefined numbers
    Version:
        1.0 - original version
*)

program SumAverage;

const
    total_no = 5;

var
    no1, no2, no3, no4, no5 : integer;
    sum : integer;
    avg : real;

begin { Main }
    no1 := 45;
    no2 := 7;
    no3 := 68;
    no4 := 2;
    no5 := 34;
    sum := no1 + no2 + no3 + no4 + no5;
    avg := sum / total_no;
    writeln('Number of integers = ', total_no);
    writeln('Number1 = ', no1);
    writeln('Number2 = ', no2);
    writeln('Number3 = ', no3);
    writeln('Number4 = ', no4);
    writeln('Number5 = ', no5);
    writeln('Sum = ', sum);
    writeln('Average =', avg);
end. { Main }


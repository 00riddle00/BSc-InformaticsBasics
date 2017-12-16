program SumAndAverage;

const
    total_no = 5;

var
    no1, no2, no3, no4, no5 : integer;
    sum : integer;
    avg : real;
    fileout : text;

begin
    write('Enter the first number: ');
    readln(no1);
    write('Enter the second number: ');
    readln(no2);
    write('Enter the third number: ');
    readln(no3);
    write('Enter the fourth number: ');
    readln(no4);
    write('Enter the fifth number: ');
    readln(no5);

    sum := no1 + no2 + no3 + no4 + no5;
    avg := sum / total_no;
    writeln('Number of integers = ', total_no);
    writeln();
    writeln('Number 1:', no1:8);
    writeln('Number 2:', no2:8);
    writeln('Number 3:', no3:8);
    writeln('Number 4:', no4:8);
    writeln('Number 5:', no5:8);
    writeln('================');
    writeln('Sum:', sum:12);
    writeln('Average:', avg:10:1);

    assign(fileout, 'math3.txt');
    rewrite(fileout);

    writeln(fileout, 'Number of integers = ', total_no);
    writeln(fileout);
    writeln(fileout, 'Number 1:', no1:7);
    writeln(fileout, 'Number 2:', no2:7);
    writeln(fileout, 'Number 3:', no3:7);
    writeln(fileout, 'Number 4:', no4:7);
    writeln(fileout, 'Number 5:', no5:7);
    writeln(fileout, '================');
    writeln(fileout, 'Sum:', sum:12);
    writeln(fileout, 'Average:', avg:10:1);
    close(fileout)
 
end.


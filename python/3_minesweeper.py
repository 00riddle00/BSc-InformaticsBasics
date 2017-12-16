
def minesweeper(minefield, n, m, field):

    keys = []
    for x in range(1, n+1):
        for i in range(1,m+1):
            if i in range(1,10):
                keys.append(x+float("0.0%r" %(i)))
            else:
                keys.append(x+float("0.%r" %(i)))

    vertes = []
    for i in range(0,n):
        line = minefield.pop(0)
        for a in line:
            vertes.append(a)

    dictas = dict(zip(keys, vertes))

    for key in dictas:
        bombos = []
        if float(("%.2f" % (key - 1.01))) in dictas:
            bombos.append(dictas[float(("%.2f" % (key - 1.01)))])
        if float(("%.2f" % (key - 1.0))) in dictas:
            bombos.append(dictas[float(("%.2f" % (key - 1.0)))])
        if float(("%.2f" % (key - 0.99))) in dictas:
            bombos.append(dictas[float(("%.2f" % (key - 0.99)))])
        if float(("%.2f" % (key - 0.01))) in dictas:
            bombos.append(dictas[float(("%.2f" % (key - 0.01)))])
        if float(("%.2f" % (key + 0.01))) in dictas:
            bombos.append(dictas[float(("%.2f" % (key + 0.01)))])
        if float(("%.2f" % (key + 0.99))) in dictas:
            bombos.append(dictas[float(("%.2f" % (key + 0.99)))])
        if float(("%.2f" % (key + 1.0))) in dictas:
            bombos.append(dictas[float(("%.2f" % (key + 1.0)))])
        if float(("%.2f" % (key + 1.01))) in dictas:
            bombos.append(dictas[float(("%.2f" % (key + 1.01)))])

        nr = 0
        for b in bombos:
            if b == '*':
                nr += 1

        if dictas[key] != "*":
            dictas[key] = nr

    output = []
    for key in sorted(dictas.keys()):
        output.append(dictas[key])

    print("\nField #%r:" % (field))

    for i,item in enumerate(output):
        if (i+1)%m == 0:
            print(item)
        else:
            print(item,end='')


def main():

    minefield = []
    with open('input3.txt') as inputfile:
        for line in inputfile:
            minefield.append(line.strip())


    field = 1
    while minefield:
        nm = minefield.pop(0)
        nm = nm.split()

        n = int(nm[0])
        m = int(nm[1])

        blokas = []
        for i in range(0,n):
            blokas.append(minefield.pop(0))

        if n != 0 and m != 0:
            minesweeper(blokas, n, m, field)

        field += 1


main()


def list_palindromes(x, b):

    decimal = 1
    nr = 1

    while x:
        # m - temporary variable for converting a number
        m = decimal
        reverse = []

        while m > 1:
            reverse.append(m%b)
            m = int(m/b)

        reverse.append(m%b)
        result = reverse[::-1]

        # removing the first zero in the number
        if result[0] == 0:
            result.pop(0)

        if result == result[::-1] and len(result) > 1:
            # converting an array into an int for display
            result = int(''.join(map(str,result)))
            print(nr, "\b. ", decimal, "is", result)

            nr += 1
            x -= 1

        decimal += 1


def main():

    numbers = []
    with open('input2.txt') as inputfile:
        for line in inputfile:
            numbers.append(line.strip())

    x = int(numbers.pop())
    b = int(numbers.pop())

    list_palindromes(x, b)


main()

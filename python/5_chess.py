def char_range(c1, c2, reverse=False):
    if reverse == False:
        for c in range(ord(c1), ord(c2)+1):
            yield chr(c)
    else:
        for c in range(ord(c1), ord(c2)-1, -1):
            yield chr(c)

def above_right_fn(key): 
    letter, number = key[0], int(key[1])
    if letter == 'H' or number == 8:
        return letter
    else:
        letter = chr(ord(letter)+1)
        number += 1
        return above_right_fn(letter+str(number))

def above_left_fn(key): 
    letter, number = key[0], int(key[1])
    if letter == 'A' or number == 8:
        return letter
    else:
        letter = chr(ord(letter)-1)
        number += 1
        return above_left_fn(letter+str(number))

def below_right_fn(key): 
    letter, number = key[0], int(key[1])
    if letter == 'H' or number == 1:
        return letter
    else:
        letter = chr(ord(letter)+1)
        number -= 1
        return below_right_fn(letter+str(number))

def below_left_fn(key): 
    letter, number = key[0], int(key[1])
    if letter == 'A' or number == 1:
        return letter
    else:
        letter = chr(ord(letter)-1)
        number -= 1
        return below_left_fn(letter+str(number))

def pawn_above_right(key): 
    letter, number = key[0], int(key[1])
    if letter == 'H':
        return 'X'
    else:
        letter = chr(ord(letter)+1)
        number += 1
        return letter+str(number)


def pawn_above_left(key): 
    letter, number = key[0], int(key[1])
    if letter == 'A':
        return 'X'
    else:
        letter = chr(ord(letter)-1)
        number += 1
        return letter+str(number)


def pawn_below_right(key): 
    letter, number = key[0], int(key[1])
    if letter == 'H':
        return 'X'
    else:
        letter = chr(ord(letter)+1)
        number -= 1
        return letter+str(number)


def pawn_below_left(key): 
    letter, number = key[0], int(key[1])
    if letter == 'A':
        return 'X'
    else:
        letter = chr(ord(letter)-1)
        number -= 1
        return letter+str(number)


def play(board):

    black_king = list(board.keys())[list(board.values()).index('k')]
    white_king = list(board.keys())[list(board.values()).index('K')]

    final_board = board.copy()

    res = []

    for key, value in board.items():
        if value == 'r':

            # above
            above = [key[0] + str(x) if not board[key[0]+str(x)] or not board[key[0]+str(x)].islower() else 'X' for x in range(int(key[1])+1,9)]
            if 'X' in above:
                above = above[:above.index('X')]
            for pos in above:
                if board[pos] and board[pos].istitle():
                    if pos in above:
                        above = above[:above.index(pos)+1]

            res = res + above

            # below
            below = [key[0] + str(x) if not board[key[0]+str(x)] or not board[key[0]+str(x)].islower() else 'X' for x in range(int(key[1])-1,0,-1)]
            if 'X' in below:
                below = below[:below.index('X')]
            for pos in below:
                if board[pos] and board[pos].istitle():
                    if pos in below:
                        below = below[:below.index(pos)+1]

            res = res + below

            # right
            right = [x + str(key[1]) if not board[x + str(key[1])] or not board[x + str(key[1])].islower() else 'X' for x in char_range(chr(ord(key[0])+1), 'H')]
            if 'X' in right:
                right = right[:right.index('X')]
            for pos in right:
                if board[pos] and board[pos].istitle():
                    if pos in right:
                        right = right[:right.index(pos)+1]

            res = res + right

            # left
            left = [x + str(key[1]) if not board[x + str(key[1])] or not board[x + str(key[1])].islower() else 'X' for x in char_range(chr(ord(key[0])-1), 'A', reverse=True)]
            if 'X' in left:
                left = left[:left.index('X')]
            for pos in left:
                if board[pos] and board[pos].istitle():
                    if pos in left:
                        left = left[:left.index(pos)+1]

            res = res + left

            final_board[key] = [list(value), res]
            res = []

        if value == 'R':

            # above
            above = [key[0] + str(x) if not board[key[0]+str(x)] or not board[key[0]+str(x)].istitle() else 'X' for x in range(int(key[1])+1,9)]
            if 'X' in above:
                above = above[:above.index('X')]
            for pos in above:
                if board[pos] and board[pos].islower():
                    if pos in above:
                        above = above[:above.index(pos)+1]

            res = res + above

            # below
            below = [key[0] + str(x) if not board[key[0]+str(x)] or not board[key[0]+str(x)].istitle() else 'X' for x in range(int(key[1])-1,0,-1)]
            if 'X' in below:
                below = below[:below.index('X')]
            for pos in below:
                if board[pos] and board[pos].islower():
                    if pos in below:
                        below = below[:below.index(pos)+1]

            res = res + below

            # right
            right = [x + str(key[1]) if not board[x + str(key[1])] or not board[x + str(key[1])].istitle() else 'X' for x in char_range(chr(ord(key[0])+1), 'H')]
            if 'X' in right:
                right = right[:right.index('X')]
            for pos in right:
                if board[pos] and board[pos].islower():
                    if pos in right:
                        right = right[:right.index(pos)+1]

            res = res + right

            # left
            left = [x + str(key[1]) if not board[x + str(key[1])] or not board[x + str(key[1])].istitle() else 'X' for x in char_range(chr(ord(key[0])-1), 'A', reverse=True)]
            if 'X' in left:
                left = left[:left.index('X')]
            for pos in left:
                if board[pos] and board[pos].islower():
                    if pos in left:
                        left = left[:left.index(pos)+1]

            res = res + left

            final_board[key] = [list(value), res]
            res = []

        if value == 'b':

            #above_right
            y = ord(key[0])
            above_right = [x + str(int(key[1]) + ord(x)-y) if not board[x + str(int(key[1]) + ord(x)-y)] or not board[x + str(int(key[1]) + ord(x)-y)].islower() else 'X' for x in char_range(chr(ord(key[0])+1),above_right_fn(key))]
            if 'X' in above_right:
                above_right = above_right[:above_right.index('X')]
            for pos in above_right:
                if board[pos] and board[pos].istitle():
                    if pos in above_right:
                        above_right = above_right[:above_right.index(pos)+1]

            res = res + above_right

            #above_left
            y = ord(key[0])
            al = above_left_fn(key)
            above_left = [x + str(int(key[1]) + (y-ord(x))) if not board[x + str(int(key[1]) + (y-ord(x))) ] or not board[x + str(int(key[1]) + (y-ord(x)))].islower() else 'X' for x in char_range(chr(ord(key[0])-1), above_left_fn(key), reverse=True)]
            if 'X' in above_left:
                above_left = above_left[:above_left.index('X')]
            for pos in above_left:
                if board[pos] and board[pos].istitle():
                    if pos in above_left:
                        above_left = above_left[:above_left.index(pos)+1]

            res = res + above_left

            #below_right
            y = ord(key[0])
            ar = below_right_fn(key)
            below_right = [x + str(int(key[1]) - (ord(x)-y)) if not board[x + str(int(key[1]) - (ord(x)-y)) ] or not board[x + str(int(key[1]) - (ord(x)-y))].islower() else 'X' for x in char_range(chr(ord(key[0])+1), below_right_fn(key))]
            if 'X' in below_right:
                below_right = below_right[:below_right.index('X')]
            for pos in below_right:
                if board[pos] and board[pos].istitle():
                    if pos in below_right:
                        below_right = below_right[:below_right.index(pos)+1]

            res = res + below_right

            #below_left
            y = ord(key[0])
            bl = below_left_fn(key)
            below_left = [x + str(int(key[1]) - (y - ord(x))) if not board[x + str(int(key[1]) - (y - ord(x)))] or not board[x + str(int(key[1]) - (y - ord(x)))].islower() else 'X' for x in char_range(chr(ord(key[0])-1), below_left_fn(key), reverse=True)]
            if 'X' in below_left:
                below_left = below_left[:below_left.index('X')]
            for pos in below_left:
                if board[pos] and board[pos].istitle():
                    if pos in below_left:
                        below_left = below_left[:below_left.index(pos)+1]

            res = res + below_left

            final_board[key] = [list(value), res]
            res = []

        if value == 'B':

            #above_right
            y = ord(key[0])
            above_right = [x + str(int(key[1]) + ord(x)-y) if not board[x + str(int(key[1]) + ord(x)-y)] or not board[x + str(int(key[1]) + ord(x)-y)].istitle() else 'X' for x in char_range(chr(ord(key[0])+1),above_right_fn(key))]
            if 'X' in above_right:
                above_right = above_right[:above_right.index('X')]
            for pos in above_right:
                if board[pos] and board[pos].islower():
                    if pos in above_right:
                        above_right = above_right[:above_right.index(pos)+1]

            res = res + above_right

            #above_left
            y = ord(key[0])
            al = above_left_fn(key)
            above_left = [x + str(int(key[1]) + (y-ord(x))) if not board[x + str(int(key[1]) + (y-ord(x))) ] or not board[x + str(int(key[1]) + (y-ord(x)))].istitle() else 'X' for x in char_range(chr(ord(key[0])-1), above_left_fn(key), reverse=True)]
            if 'X' in above_left:
                above_left = above_left[:above_left.index('X')]
            for pos in above_left:
                if board[pos] and board[pos].islower():
                    if pos in above_left:
                        above_left = above_left[:above_left.index(pos)+1]

            res = res + above_left

            #below_right
            y = ord(key[0])
            ar = below_right_fn(key)
            below_right = [x + str(int(key[1]) - (ord(x)-y)) if not board[x + str(int(key[1]) - (ord(x)-y)) ] or not board[x + str(int(key[1]) - (ord(x)-y))].istitle() else 'X' for x in char_range(chr(ord(key[0])+1), below_right_fn(key))]
            if 'X' in below_right:
                below_right = below_right[:below_right.index('X')]
            for pos in below_right:
                if board[pos] and board[pos].islower():
                    if pos in below_right:
                        below_right = below_right[:below_right.index(pos)+1]

            res = res + below_right

            #below_left
            y = ord(key[0])
            bl = below_left_fn(key)
            below_left = [x + str(int(key[1]) - (y - ord(x))) if not board[x + str(int(key[1]) - (y - ord(x)))] or not board[x + str(int(key[1]) - (y - ord(x)))].istitle() else 'X' for x in char_range(chr(ord(key[0])-1), below_left_fn(key), reverse=True)]
            if 'X' in below_left:
                below_left = below_left[:below_left.index('X')]
            for pos in below_left:
                if board[pos] and board[pos].islower():
                    if pos in below_left:
                        below_left = below_left[:below_left.index(pos)+1]

            res = res + below_left

            final_board[key] = [list(value), res]
            res = []


        if value == 'q':

            #above_right
            y = ord(key[0])
            above_right = [x + str(int(key[1]) + ord(x)-y) if not board[x + str(int(key[1]) + ord(x)-y)] or not board[x + str(int(key[1]) + ord(x)-y)].islower() else 'X' for x in char_range(chr(ord(key[0])+1),above_right_fn(key))]
            if 'X' in above_right:
                above_right = above_right[:above_right.index('X')]
            for pos in above_right:
                if board[pos] and board[pos].istitle():
                    if pos in above_right:
                        above_right = above_right[:above_right.index(pos)+1]

            res = res + above_right

            #above_left
            y = ord(key[0])
            al = above_left_fn(key)
            above_left = [x + str(int(key[1]) + (y-ord(x))) if not board[x + str(int(key[1]) + (y-ord(x))) ] or not board[x + str(int(key[1]) + (y-ord(x)))].islower() else 'X' for x in char_range(chr(ord(key[0])-1), above_left_fn(key), reverse=True)]
            if 'X' in above_left:
                above_left = above_left[:above_left.index('X')]
            for pos in above_left:
                if board[pos] and board[pos].istitle():
                    if pos in above_left:
                        above_left = above_left[:above_left.index(pos)+1]

            res = res + above_left

            #below_right
            y = ord(key[0])
            ar = below_right_fn(key)
            below_right = [x + str(int(key[1]) - (ord(x)-y)) if not board[x + str(int(key[1]) - (ord(x)-y)) ] or not board[x + str(int(key[1]) - (ord(x)-y))].islower() else 'X' for x in char_range(chr(ord(key[0])+1), below_right_fn(key))]
            if 'X' in below_right:
                below_right = below_right[:below_right.index('X')]
            for pos in below_right:
                if board[pos] and board[pos].istitle():
                    if pos in below_right:
                        below_right = below_right[:below_right.index(pos)+1]

            res = res + below_right

            #below_left
            y = ord(key[0])
            bl = below_left_fn(key)
            below_left = [x + str(int(key[1]) - (y - ord(x))) if not board[x + str(int(key[1]) - (y - ord(x)))] or not board[x + str(int(key[1]) - (y - ord(x)))].islower() else 'X' for x in char_range(chr(ord(key[0])-1), below_left_fn(key), reverse=True)]
            if 'X' in below_left:
                below_left = below_left[:below_left.index('X')]
            for pos in below_left:
                if board[pos] and board[pos].istitle():
                    if pos in below_left:
                        below_left = below_left[:below_left.index(pos)+1]

            res = res + below_left



            # above
            above = [key[0] + str(x) if not board[key[0]+str(x)] or not board[key[0]+str(x)].islower() else 'X' for x in range(int(key[1])+1,9)]
            if 'X' in above:
                above = above[:above.index('X')]
            for pos in above:
                if board[pos] and board[pos].istitle():
                    if pos in above:
                        above = above[:above.index(pos)+1]

            res = res + above

            # below
            below = [key[0] + str(x) if not board[key[0]+str(x)] or not board[key[0]+str(x)].islower() else 'X' for x in range(int(key[1])-1,0,-1)]
            if 'X' in below:
                below = below[:below.index('X')]
            for pos in below:
                if board[pos] and board[pos].istitle():
                    if pos in below:
                        below = below[:below.index(pos)+1]

            res = res + below

            # right
            right = [x + str(key[1]) if not board[x + str(key[1])] or not board[x + str(key[1])].islower() else 'X' for x in char_range(chr(ord(key[0])+1), 'H')]
            if 'X' in right:
                right = right[:right.index('X')]
            for pos in right:
                if board[pos] and board[pos].istitle():
                    if pos in right:
                        right = right[:right.index(pos)+1]

            res = res + right

            # left
            left = [x + str(key[1]) if not board[x + str(key[1])] or not board[x + str(key[1])].islower() else 'X' for x in char_range(chr(ord(key[0])-1), 'A', reverse=True)]
            if 'X' in left:
                left = left[:left.index('X')]
            for pos in left:
                if board[pos] and board[pos].istitle():
                    if pos in left:
                        left = left[:left.index(pos)+1]

            res = res + left

            final_board[key] = [list(value), res]
            res = []


        if value == 'Q':

            #above_right
            y = ord(key[0])
            above_right = [x + str(int(key[1]) + ord(x)-y) if not board[x + str(int(key[1]) + ord(x)-y)] or not board[x + str(int(key[1]) + ord(x)-y)].istitle() else 'X' for x in char_range(chr(ord(key[0])+1),above_right_fn(key))]
            if 'X' in above_right:
                above_right = above_right[:above_right.index('X')]
            for pos in above_right:
                if board[pos] and board[pos].islower():
                    if pos in above_right:
                        above_right = above_right[:above_right.index(pos)+1]

            res = res + above_right

            #above_left
            y = ord(key[0])
            al = above_left_fn(key)
            above_left = [x + str(int(key[1]) + (y-ord(x))) if not board[x + str(int(key[1]) + (y-ord(x))) ] or not board[x + str(int(key[1]) + (y-ord(x)))].istitle() else 'X' for x in char_range(chr(ord(key[0])-1), above_left_fn(key), reverse=True)]
            if 'X' in above_left:
                above_left = above_left[:above_left.index('X')]
            for pos in above_left:
                if board[pos] and board[pos].islower():
                    if pos in above_left:
                        above_left = above_left[:above_left.index(pos)+1]

            res = res + above_left

            #below_right
            y = ord(key[0])
            ar = below_right_fn(key)
            below_right = [x + str(int(key[1]) - (ord(x)-y)) if not board[x + str(int(key[1]) - (ord(x)-y)) ] or not board[x + str(int(key[1]) - (ord(x)-y))].istitle() else 'X' for x in char_range(chr(ord(key[0])+1), below_right_fn(key))]
            if 'X' in below_right:
                below_right = below_right[:below_right.index('X')]
            for pos in below_right:
                if board[pos] and board[pos].islower():
                    if pos in below_right:
                        below_right = below_right[:below_right.index(pos)+1]

            res = res + below_right

            #below_left
            y = ord(key[0])
            bl = below_left_fn(key)
            below_left = [x + str(int(key[1]) - (y - ord(x))) if not board[x + str(int(key[1]) - (y - ord(x)))] or not board[x + str(int(key[1]) - (y - ord(x)))].istitle() else 'X' for x in char_range(chr(ord(key[0])-1), below_left_fn(key), reverse=True)]
            if 'X' in below_left:
                below_left = below_left[:below_left.index('X')]
            for pos in below_left:
                if board[pos] and board[pos].islower():
                    if pos in below_left:
                        below_left = below_left[:below_left.index(pos)+1]

            res = res + below_left



            # above
            above = [key[0] + str(x) if not board[key[0]+str(x)] or not board[key[0]+str(x)].istitle() else 'X' for x in range(int(key[1])+1,9)]
            if 'X' in above:
                above = above[:above.index('X')]
            for pos in above:
                if board[pos] and board[pos].islower():
                    if pos in above:
                        above = above[:above.index(pos)+1]

            res = res + above

            # below
            below = [key[0] + str(x) if not board[key[0]+str(x)] or not board[key[0]+str(x)].istitle() else 'X' for x in range(int(key[1])-1,0,-1)]
            if 'X' in below:
                below = below[:below.index('X')]
            for pos in below:
                if board[pos] and board[pos].islower():
                    if pos in below:
                        below = below[:below.index(pos)+1]

            res = res + below

            # right
            right = [x + str(key[1]) if not board[x + str(key[1])] or not board[x + str(key[1])].istitle() else 'X' for x in char_range(chr(ord(key[0])+1), 'H')]
            if 'X' in right:
                right = right[:right.index('X')]
            for pos in right:
                if board[pos] and board[pos].islower():
                    if pos in right:
                        right = right[:right.index(pos)+1]

            res = res + right

            # left
            left = [x + str(key[1]) if not board[x + str(key[1])] or not board[x + str(key[1])].istitle() else 'X' for x in char_range(chr(ord(key[0])-1), 'A', reverse=True)]
            if 'X' in left:
                left = left[:left.index('X')]
            for pos in left:
                if board[pos] and board[pos].islower():
                    if pos in left:
                        left = left[:left.index(pos)+1]

            res = res + left

            final_board[key] = [list(value), res]
            res = []


        if value == 'p':

            # pawn moves
            pawn_moves = [pawn_below_right(key), pawn_below_left(key)]
            pawn_moves = [x for x in pawn_moves if x != 'X']
            pawn_moves = [x for x in pawn_moves if board[x]]
            pawn_moves = [x for x in pawn_moves if not board[x].islower()]

            final_board[key] = [list(value), pawn_moves]
            pawn_moves = []

        if value == 'P':

            # pawn moves
            pawn_moves = [pawn_above_right(key), pawn_above_left(key)]
            pawn_moves = [x for x in pawn_moves if x != 'X']
            pawn_moves = [x for x in pawn_moves if board[x]]
            pawn_moves = [x for x in pawn_moves if not board[x].istitle()]

            final_board[key] = [list(value), pawn_moves]
            pawn_moves = []

        if value == 'n':
            let = key[0] 
            num = int(key[1])
            first = chr(ord(let)+1)+str(num+2)
            second = chr(ord(let)+2)+str(num+1)
            third = chr(ord(let)+2)+str(num-1)
            fourth = chr(ord(let)+1)+str(num-2)
            fifth = chr(ord(let)-1)+str(num-2)
            sixth = chr(ord(let)-2)+str(num-1)
            seventh = chr(ord(let)-2)+str(num+1)
            eighth = chr(ord(let)-1)+str(num+2)

            horse_moves = [first, second, third, fourth, fifth, sixth, seventh, eighth]
            horse_moves = [x for x in horse_moves if x[1] != '-']
            horse_moves = [x for x in horse_moves if x[0] in char_range('A', 'H') and int(x[1]) in range(1,9)]

            delete = []
            for pos in horse_moves:
                if board[pos] and board[pos].islower():
                    delete.append(pos)

            for elem in delete:
                horse_moves.remove(elem)

            final_board[key] = [list(value), horse_moves]
            horse_moves = []

        if value == 'N':
            let = key[0] 
            num = int(key[1])
            first = chr(ord(let)+1)+str(num+2)
            second = chr(ord(let)+2)+str(num+1)
            third = chr(ord(let)+2)+str(num-1)
            fourth = chr(ord(let)+1)+str(num-2)
            fifth = chr(ord(let)-1)+str(num-2)
            sixth = chr(ord(let)-2)+str(num-1)
            seventh = chr(ord(let)-2)+str(num+1)
            eighth = chr(ord(let)-1)+str(num+2)

            horse_moves = [first, second, third, fourth, fifth, sixth, seventh, eighth]
            horse_moves = [x for x in horse_moves if x[1] != '-']
            horse_moves = [x for x in horse_moves if x[0] in char_range('A', 'H') and int(x[1]) in range(1,9)]

            delete = []
            for pos in horse_moves:
                if board[pos] and board[pos].istitle():
                    delete.append(pos)

            for elem in delete:
                horse_moves.remove(elem)

            final_board[key] = [list(value), horse_moves]
            horse_moves = []


    black_moves = []
    white_moves = []

    for key, value in final_board.items():
        if value and value not in ['k','K']:
            if value[0][0].islower():
                for move in value[1]:
                    black_moves.append(move)
            elif value[0][0].istitle():
                for move in value[1]:
                    white_moves.append(move)

    if white_king in black_moves:
        print("White king is in check")
    elif black_king in white_moves:
        print("Black king is in check")
    else:
        print("No check")


def main():

    positions = [x + str(y) for y in [x for x in range(8, 0, -1)] for x in [chr(x) for x in range(65, 73)]]

    figures = []
    with open('input5.txt') as inputfile:
        for line in inputfile:
            if '#' not in line:
                for fig in line.split():
                    figures.append(fig)
            else:
                board = dict(zip(positions, [None if x == '.' else x for x in figures]))
                play(board)
                figures = []


main()

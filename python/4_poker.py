from collections import Counter

def convert(hand):
    hand_new = []
    for v in hand:
        if v == "T":
            v = 10
        elif v == "J":
            v = 11
        elif v == "Q":
            v = 12
        elif v == "K":
            v = 13
        elif v == "A":
            v = 14
        elif v.isdigit():
            v = int(v)
        elif v == "S":
            v = 4
        elif v == "H":
            v = 3
        elif v == "D":
            v = 2
        elif v == "C":
            v = 1
        else:
            v = "invalid"

        hand_new.append(v)

    return(hand_new)


def convert2(hand):
    new_hand = []
    suit_values = hand[1::2]
    for n in hand[::2]:
        new_hand.append(float(n) + suit_values.pop(0) / 10)
    return(new_hand)


def evaluation(hand):

    hand_int = [int(i) for i in hand]

    l = (len(set(hand_int)))

    I = int(hand[0])
    II = int(hand[1])
    III = int(hand[2])
    IV = int(hand[3])
    V = int(hand[4])

    one = hand[0] - int(hand[0])
    two = hand[1] - int(hand[1])
    three = hand[2] - int(hand[2])
    four = hand[3] - int(hand[3])
    five = hand[4] - int(hand[4])

    one = "%.1f" % one
    two = "%.1f" % two
    three = "%.1f" % three
    four = "%.1f" % four
    five = "%.1f" % five

    if l == 5:

        if V-IV == IV-III == IV-III == III - II == III - II == II - I:

            if one == two == three == four == five:
                hand.append(8)
                hand.append(int(hand[4]))
                hand.append(0)
                hand.append(0)
                hand.append(0)
                hand.append(0)
                hand.append("Straight Flush")
            else:
                hand.append(4)
                hand.append(int(hand[4]))
                hand.append("Straight")

        elif one == two == three == four == five:
            hand.append(5)
            hand.append(int(hand[4]))
            hand.append(int(hand[3]))
            hand.append(int(hand[2]))
            hand.append(int(hand[1]))
            hand.append(int(hand[0]))
            hand.append("Flush")
        else:
            hand.append(0)
            hand.append(int(hand[4]))
            hand.append(int(hand[3]))
            hand.append(int(hand[2]))
            hand.append(int(hand[1]))
            hand.append(int(hand[0]))
            hand.append("High Card")

    elif l == 2:
        if int(hand[2]) == int(hand[3]):
            hand.append(7)
            hand.append(int(hand[0]))
            hand.append(int(hand[4]))
            hand.append(0)
            hand.append(0)
            hand.append(0)
            hand.append("Four of a kind")
        else:
            hand.append(6)
            hand.append(int(hand[0]))
            hand.append(int(hand[4]))
            hand.append(0)
            hand.append(0)
            hand.append(0)
            hand.append("Full house")

    elif l == 3:
        if int(hand[1]) == int(hand[2]):
            hand.append(3)
            hand.append(int(hand[0]))
            hand.append(int(hand[4]))
            hand.append(int(hand[3]))
            hand.append(0)
            hand.append(0)
            hand.append("Three of a kind")
        else:
            hand.append(2)
            hand.append(int(hand[2]))
            hand.append(int(hand[0]))
            hand.append(int(hand[4]))
            hand.append(0)
            hand.append(0)
            hand.append("Two pairs")

    else:
        hand.append(1)
        hand.append(int(hand[1]))
        hand.append(int(hand[4]))
        hand.append(int(hand[3]))
        hand.append(int(hand[2]))
        hand.append(0)
        hand.append("One pair")

    return(hand)


def game(hand):

    hand = hand.pop()

    hand = [x.strip() for x in hand if x.strip()]

    player1_hand = hand[:10]
    player2_hand = hand[10:]

    player1_hand = convert(player1_hand)
    player2_hand = convert(player2_hand)

    player1_hand = convert2(player1_hand)
    player2_hand = convert2(player2_hand)

    integer_counts = Counter(int(num) for num in player1_hand)
    player1_hand = sorted(player1_hand, key=lambda n: (integer_counts[int(n)] == 1, n))

    integer_counts = Counter(int(num) for num in player2_hand)
    player2_hand = sorted(player2_hand, key=lambda n: (integer_counts[int(n)] == 1, n))

    player1_hand = evaluation(player1_hand)
    player2_hand = evaluation(player2_hand)

    # print("\nplayer1 hand: ", player1_hand[11], "\nplayer2 hand: ", player2_hand[11], "\n")

    if player1_hand[5] > player2_hand[5]:
        print("Player 1 wins.")
    elif player2_hand[5] > player1_hand[5]:
        print("Player 2 wins.")
    elif player1_hand[6] > player2_hand[6]:
        print("Player 1 wins.")
    elif player2_hand[6] > player1_hand[6]:
        print("Player 2 wins.")
    elif player1_hand[7] > player2_hand[7]:
        print("Player 1 wins.")
    elif player2_hand[7] > player1_hand[7]:
        print("Player 2 wins.")
    elif player1_hand[8] > player2_hand[8]:
        print("Player 1 wins.")
    elif player2_hand[8] > player1_hand[8]:
        print("Player 2 wins.")
    elif player1_hand[9] > player2_hand[8]:
        print("player 1 wins.")
    elif player2_hand[9] > player1_hand[9]:
        print("Player 2 wins.")
    elif player1_hand[10] > player2_hand[10]:
        print("Player 1 wins.")
    elif player2_hand[10] > player1_hand[10]:
        print("Player 2 wins.")
    else:
        print("Tie.")


def main():

    hand = []
    with open('input4.txt') as inputfile:
        for line in inputfile:
            hand.append(line.strip())
            game(hand)


main()

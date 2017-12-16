#include <iostream>
#include <fstream>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */
using namespace std;
struct hand{
		char suite[5];
		char value[5];
		short score;
/*
score
-------------------------
Hand rank			int	|
Straight flush		0	|
Four of a kind		1	|
Full house			2	|
Flush				3	|
Straight			4	|
Three of a kind		5	|
Two pair			6	|
One pair			7	|
No pair/High card	8	|
-------------------------
*/
	};
void calculate(hand &h);
int compare(hand h1, hand h2);
int HighCard (hand h1, hand h2, int i /*i kelinta korta rankoje, jei 0 tai visos*/);

int main() {
	short int rezultatas;
	ifstream in("input.txt");
	ofstream out("output.txt");
	while(!in.eof())
	{
		hand h1, h2;
		//read
		for(int i=0; i<5; i++)
		{
			in.get (h1.value[i]);
			in.get (h1.suite[i]);
			in.ignore (1,' ');
		}
		//cout<<"\n";
		for(int i=0; i<5; i++)
		{
			in.get (h2.value[i]);
			in.get (h2.suite[i]);
			in.ignore (1,' ');
		}
		calculate(h1);
		calculate(h2);
		rezultatas = compare(h1 , h2);
		//write			
		switch (rezultatas)
			{
				case 0 :
					out << "Lygiosios\n";
					break;
				case 1 :
					out << "Laimi pirmas zaidejas\n";
					break;
				case 2 :
					out << "Laimi antras zaidejas\n";
			}
	}
	in.close();
	out.close();
	return 0;
}
void calculate(hand &h){
	//keitimas value
	for(int i = 0; i < 5; i++)
	{
		switch (h.value[i])
		{
			case 'T' :
				h.value[i] = 10;
				break;
			case 'J' :
				h.value[i] = 11;
				break;
			case 'Q' :
				h.value[i] = 12;
				break;
			case 'K' :
				h.value[i] = 13;
				break;
			case 'A' :
				h.value[i] = 14;
				break;
			default :
				h.value[i] = h.value[i] - '0';
		}
	}
	//rikiavimas
	for(int i=0; i < 5; i++)
	{
		for(int j=0; j<i; j++)
		{
			if(h.value[i]<h.value[j])
			{
				char temp1=h.value[i], temp2=h.suite[i];
				h.value[i]=h.value[j];
				h.suite[i]=h.suite[j];
				h.value[j]=temp1;
				h.suite[j]=temp2;
			}
		}
	}
	h.score = 10;
	bool fl = false, st = false;
	//patikrina ar flush
	if(h.suite[0] == h.suite[1] && h.suite[0] == h.suite[2] && h.suite[0] == h.suite[3] && h.suite[0] == h.suite[4])
	{
		fl = true;
	}
	//patikrina ar straight
	if(h.value[1] == h.value[0]+1 && h.value[2] == h.value[0]+2 && h.value[3] == h.value[0]+3 && h.value[4] == h.value[0]+4)
	{
		st = true;
	}
	//jeigu rank yra A2345
	if(h.value[1] == 14 && h.value[2] == 2 && h.value[3] == 3 && h.value[4] == 4)
	{
		char temp=h.value[4];
		h.value[4] = h.value[3];
		h.value[3] = h.value[2];
		h.value[2] = h.value[1];
		h.value[1] = h.value[0];
		h.value[1] = temp;
		temp = h.suite[4];
		h.suite[4] = h.suite[3];
		h.suite[3] = h.suite[2];
		h.suite[2] = h.suite[1];
		h.suite[1] = h.suite[0];
		h.suite[1] = temp;
		st = true;
	}
	//Straight flush
	if((st == true) && (fl == true))
	{
		h.score = 0;
	}
	//Four of a kind
	if(h.score == 10)
	if((h.value[0] == h.value[1] && h.value[0] == h.value[2] && h.value[0] == h.value[3]) || (h.value[1] == h.value[2] && h.value[1] == h.value[3] && h.value[1] == h.value[4]))
	{
		if(h.value[0] != h.value[1])
		{
			char temp = h.value[0];
			h.value[0] = h.value[4];
			h.value[4] = temp;
			temp = h.suite[0];
			h.suite[0] = h.suite[4];
			h.suite[4] = temp;
		}
		h.score = 1;
	}
	//Full House
	if(h.score == 10)
	{
		if(h.value[0] == h.value[1] && h.value[0] == h.value[2] && h.value[3] == h.value[4])
		{
			char temp = h.value[0];
			h.value[0] = h.value[4];
			h.value[4] = temp;
			temp = h.suite[0];
			h.suite[0] = h.suite[4];
			h.suite[4] = temp;
			
			temp = h.value[1];
			h.value[1] = h.value[3];
			h.value[3] = temp;
			temp = h.suite[1];
			h.suite[1] = h.suite[3];
			h.suite[3] = temp;
			h.score = 2;
		}
		else
		{
			if(h.value[0] == h.value[1] && h.value[2] == h.value[3] && h.value[2] == h.value[4])
			{
				h.score = 2;
			}
		}
	}
	//Flush
	if(h.score == 10)
	if(fl) h.score = 3;
	//Straight
	if(h.score == 10)
	if(st) h.score = 4;
	//Three of a kind
	if(h.score == 10)
	{
	 	if((h.value[2] == h.value[3]) && (h.value[2] == h.value[4]))// **aaa
	 	{
	 		h.score = 5;
	 	}
	 	else
	 	{
	 		if((h.value[2] == h.value[3]) && (h.value[2] == h.value[1]))// *aaa*
	 		{
				char temp = h.value[1];
				h.value[1] = h.value[4];
				h.value[4] = temp;
				temp = h.suite[1];
				h.suite[1] = h.suite[4];
				h.suite[4] = temp;
				h.score = 5;
	 		}
	 		else // aaa**
	 		{
	 			if((h.value[0] == h.value[1]) && (h.value[0] == h.value[2]))
	 			{
					char temp = h.value[1];
					h.value[1] = h.value[4];
					h.value[4] = temp;
					temp = h.suite[1];
					h.suite[1] = h.suite[4];
					h.suite[4] = temp;
					temp = h.value[0];
					h.value[0] = h.value[3];
					h.value[3] = temp;
					temp = h.suite[0];
					h.suite[0] = h.suite[3];
					h.suite[3] = temp;
					h.score = 5;
				}
				
	 		}
	 	}
	}
	// 2 pairs
	if(h.score == 10)
	{
		if((h.value[1] == h.value[2]) && (h.value[3] == h.value[4]))// *aabb
		{
			h.score = 6;
		}
		else
		{
			if((h.value[0] == h.value[1]) && (h.value[3] == h.value[4]))// aa*bb
			{
				char temp = h.value[0];
				h.value[0] = h.value[3];
				h.value[3] = temp;
				h.score = 6;
				
			}
			else// aabb*
			{
				char temp = h.value[0];
				h.value[0] = h.value[4];
				h.value[4] = temp;
				temp = h.value[2];
				h.value[2] = h.value[4];
				h.value[4] = temp;
				h.score =6;
			}
		}
	}
	if(h.score == 10)
	{
		if(h.value[3] == h.value[4])// ***aa
		{
			h.score = 7;
		}
		else
		{
			if(h.value[2] == h.value[3])// **aa*
			{
				char temp = h.value[2];
				h.value[2] = h.value[4];
				h.value[4] = temp;
				h.score = 7;
			}
			else
			{
				if(h.value[1] == h.value[2])// *aa**
				{
					char temp = h.value[2];
					h.value[2] = h.value[4];
					h.value[4] = temp;
					temp = h.value[1];
					h.value[1] = h.value[3];
					h.value[3] = temp;
					h.score = 7;
				}
				else// aa***
				{
					char temp = h.value[1];
					h.value[1] = h.value[4];
					h.value[4] = temp;
					temp = h.value[0];
					h.value[0] = h.value[3];
					h.value[3] = temp;
					h.score = 7;
				}
			}
		}
	}
	if(h.score == 10) h.score = 8;
}
int compare (hand h1, hand h2)
{
	switch (h1.score)
	{
		case 0:
			if (h2.score == 0)
			{
				return HighCard (h1, h2, 5);
			}
			else
			{
				return 1;
			}
		case 1:
			if (h2.score == 1)
			{
				return HighCard (h1, h2, 3);
			}
			else
			{
				if (h2.score < 1) return 2;
				else return 1;
			}
		case 2:
			if(h2.score == 2)
			{
				if (HighCard(h1, h2, 5) == 0)
				{
					return HighCard(h1, h2, 1);
				}
				else
				{
					return HighCard(h1, h2, 5);
				}
			}
			else
			{
				if(h2.score < 2) return 2;
				else return 1;
			}
		case 3:
			if(h2.score == 3)
			{
				return HighCard (h1, h2, 0);
			}
			else
			{
				if(h2.score < 3) return 2;
				else return 1;
			}
		case 4:
			if(h2.score == 4)
			{
				return HighCard (h1, h2, 5);
			}
			else
			{
				if(h2.score < 4) return 2;
				else return 1;
			}
		case 5:
			if(h2.score == 5)
			{
				if( HighCard(h1, h2, 5) == 0)
				{
					if(HighCard(h1, h2, 2) == 0)
					{
						return HighCard(h1, h2, 1);
					}
					else return HighCard(h1, h2, 2);
				}
				else return HighCard(h1, h2, 5);
			}
			else
			{
				if(h2.score < 5) return 2;
				else return 1;
			}
		case 6:
			if(h2.score == 6)
			{
				if( HighCard(h1, h2, 5) == 0)
				{
					if( HighCard(h1, h2, 3) == 0)
					{
						return HighCard(h1, h2, 1);
					}
					else return HighCard(h1, h2, 3);
				}
				else return HighCard(h1, h2, 5);
			}
			else 
			{
				if(h2.score < 6) return 2;
				else return 1;
			}
		case 7:
			if(h2.score == 7)
			{
				if( HighCard(h1, h2, 5) == 0)
				{
					if( HighCard(h1, h2, 3) == 0)
					{
						if( HighCard(h1, h2, 2) == 0)
						{
							return HighCard(h1, h2, 1);
						}
						else return HighCard(h1, h2, 2);
					}
					else return HighCard(h1, h2, 3);
				}
				else return HighCard(h1, h2, 5);
			}
			else 
			{
				if(h2.score < 7) return 2;
				else return 1;
			}
		case 8:
			return HighCard(h1, h2, 0);
	}
	return 0;
}
int HighCard (hand h1, hand h2, int i)
{
	if(i == 0)
	{
		for(int j = 5; j > 0; j--)
		{
			if(h1.value[j] > h2.value[j]) return 1;
			if(h1.value[j] < h2.value[j]) return 2;
		}
		return 0;
	}
	else
	{
		if(h1.value[i-1] == h2.value[i-1]) return 0;
		if(h1.value[i-1] > h2.value[i-1]) return 1;
		if(h1.value[i-1] < h2.value[i-1]) return 2;
	}
}

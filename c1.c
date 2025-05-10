/*
  
  Simple encryption demonstration.

  Author   : Keith Rehm
  Editor   : GNU Emacs 30.1
  Compiler : gcc --version = Apple clang version 15.0.0 (clang-1500.3.9.4)...

 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

char alpha[] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
		'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
		'w', 'x', 'y', 'z', ' '};
char cyph1[] = {'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
		' ', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
		'k', 'l', 'm', 'n', 'o'}; 

char *s0 = "keith h rehm";
char *s1 = "hello world";

int main(int argc, char *argv[])
{

  for (int i = 0; s1[i] != '\0'; i++)
    for (int j = 0; j < 27; j++)
      if ( s1[i] == alpha[j] )
	printf("%c",cyph1[j]);
  
  printf("\n");

  for (int i = 0; s0[i] != '\0'; i++)
    for (int j = 0; j < 27; j++)
      if ( s0[i] == alpha[j] )
	printf("%c",cyph1[j]);

  printf("\n");

      
  return 0;

}

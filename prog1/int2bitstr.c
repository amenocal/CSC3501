#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <math.h>
#include <string.h>

void int2bitstr(unsigned int I, char *str)
{
     int i,j;
     char temp;

     for(i = 0; i < 32; i++)
     {
        j = I >> i;
	if(j & 1)
	  *(str+i) = '1';
	else
	  *(str+i) = '0';
     }
     *(str+i) = '\0';
     for(i = 0; i < strlen(str)/2; i++)
     {
	temp = str[i];
	str[i] = str[strlen(str) - i - 1];
	str[strlen(str) - i -1] = temp;
     }

}

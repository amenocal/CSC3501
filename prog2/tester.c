#include <stdio.h>
#include <string.h>
#include <assert.h>
int main(void)
{
   int iv = 5, ires;
   char alph[28];
   #ifndef IGNORE_STR
      char *exp = "abcdefghijklmnopqrstuvwxyz";
   #endif
   int istr(int i1, int i2, int *i3, char *alp);

   ires = istr(4, 5,  &iv, alph);
   if (ires != 9)
   {
      printf("ires should be=%d; got=%d\n", 9, ires);
      assert(0);
   }
   #ifndef IGNORE_IV
      if (iv != 25)
      {
         printf("IV: expected=25, got=%d\n", iv);
         assert(0);
      }
   #endif
   #ifndef IGNORE_STR
      if (strcmp(alph, exp))
      {
         printf("STR: expected='%s'\n", exp);
         printf("STR:      got='%s'\n", alph);
         assert(0);
      }
   #endif

   ires = istr(11, 17,  &iv, alph);
   if (ires != 28)
   {
      printf("ires should be=%d; got=%d\n", 28, ires);
      assert(0);
   }
   #ifndef IGNORE_IV
      if (iv != 5*5*5)
      {
         printf("IV: expected=%d, got=%d\n", 5*5*5, ires);
         assert(0);
      }
   #endif
   #ifndef IGNORE_STR
      if (strcmp(alph, exp))
      {
         printf("STR: expected='%s'\n", exp);
         printf("STR:      got='%s'\n", alph);
         assert(0);
      }
   #endif
   #if defined(IGNORE_STR) && defined(IGNORE_IV)
      printf("Throw a party, you can add two integers.  How about pointers?\n");
   #elif defined(IGNORE_STR)
      printf("OK, integers work, but what about strings?\n");
   #else
      printf("Flawless victory!\n");
   #endif
   return(0);
}

#include <stdio.h>
#include <stdlib.h>

FILE *fr;

int main()
{
	int n;
	char line[80];
	char letter[20];
	unsigned int hex[20];


	if ((fr = fopen("trace.in", "r")) == NULL)
	{
		printf("No file");
		exit(1);
	}
	
	/*while(fscanf(fr,"%s %x", &letter,&hex) == 2)
	{
		fscanf(fr, "%[R|W]s:%x", &letter, &hex);
		//printf( "%s\n", &letter);
		
	}*/
		//fscanf(fr, "%s:%x", &letter, &hex);
	/*int i = 0;
	while(fscanf(fr, "%c:%x\n", &letter, &hex[i]) != EOF)
	{
		//fscanf(fr, "%c:%x", &letter, &hex[i]);
        printf("%c:%x\n", letter, hex[i]);
        i++;
    }*/
    int i = 0;
    while(fscanf(fr, "%c:%x\n", &letter[i], &hex[i]) != EOF)
	{
		//fscanf(fr, "%c:%x", &letter, &hex[i]);
        printf("%c:%x\n", letter[i], hex[i]);
        i++;
    }
	 /*while(fgets(line, 80, fr) != NULL)
    {
    	printf("%c:%x\n", letter, hex);
 
    }*/

	fclose(fr);
	
}
//created by: Alejandro Menocal cs350128

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <math.h>
#include <string.h>
#define NBITS 24
char letter;
unsigned int hex;

 
//void ReadGraph();
//void GetFlags(nargs, args, &B, &S, &A, &W);

void PrintUsage(char *name, int iarg, char *arg)
{
	fprintf(stderr, "\n Errror unknown \n");
	fprintf(stderr, "You have to use %s this flags:\n", name);
	fprintf(stderr, "-b <blksz>: set B to blksize \n");
	fprintf(stderr, "-s <nsets>: set N to nsets\n");
	fprintf(stderr, "-a <assoc>: sets A to association\n");
	fprintf(stderr, "-W <t/b>: sets Write through or write back policy\n");
	exit(iarg ? iarg : -1);
}


void GetFlags(int nargs, char **args, int *B, int *S, int *A, char *W)
{
	int i;
	*B = 32;
	*S = 64;
	*A = 1;
	*W = 't';
	for (i=1; i < nargs; i++)
	{
		if(args[i][0] != '-')
			PrintUsage(args[0],i, args[i]);
		switch(args[i][1])
		{
		case 'b':
			if (++i >= nargs)
				PrintUsage(args[0],i, "out of arguments");
			/*if ((args[i] != 1) && (args[i] & (args[i] -1)))
			 	fprintf(stderr, "Number is not a power of two\n");*/
			*B = atoi(args[i]);
			break;
		case 's':
			if (++i >=nargs)
				PrintUsage(args[0],i, "out of arguments");
			/*if ((args[i] != 1 && args[i] & (args[i]-1)))
				fprintf(stderr, "Number is not a power of two\n");*/
			*S = atoi(args[i]);
			break;
		case 'a':
			if(++i >= nargs)
				PrintUsage(args[0],i, "out of arguments");
			*A = atoi(args[i]);
			break;
		case 'W':
			if(++i >= nargs)
				PrintUsage(args[0],i, "outof arguments");
			*W = *args[i];
			break;
		default:
			PrintUsage(args[0], i, args[i]);
		}
	}
}
unsigned int GetMask(int nset)
/*
* RETURNS: int with nset least significant bits set to 1, others to 0
*/
{
	unsigned int mask, i;
	assert(nset <= 32); /* otherwise default int won't work */
/*
* Following two implementations are equivalent, but loop-based one may
* be easier to understand at first
*/
	#ifdef FAST
		mask = (((long long)1))<<nset) - 1;
	#else
		for (mask=i=0; i < nset; i++)
			mask |= (1<<i);
	#endif
	return(mask);
}

char *Int2Bits(unsigned int bits)
/*
* RETURNS: string indicating binary bit pattern in integer bits
*/
{
	static char cbits[NBITS+1];/* NBITS macro defined elsewhere */
	int i,j;

	cbits[NBITS] = '\0';
	for (i=0; i < NBITS; i++){
		cbits[NBITS-1-i] = (bits == ((1<<i) | bits)) ? '1' : '0';
			
	}
	for (i = 0; i < NBITS; i++){
		printf("%c", cbits[i]);
		if ( i == 6-1)
			printf(" ");
		if ( i == (6+5-1))
			printf(" ");

	}

	return(cbits);
}




/*void ReadGraph()
{	
	
	
}*/

int Log2(int n)
{
	int count = 0;
	while (n != 1)
	{
		n = n >> 1;
		count++;
		//printf("n = %d count = %d\n", n, count);
	}
	
	return count;
}

int main(int nargs, char **args)
{
	FILE *fr;
	int n;
	char line[80];
	char letter[30];
	unsigned int hex[30];
	int i = 0;

	if ((fr = fopen("trace.in", "r")) == NULL)
	{
		printf("No file");
		exit(1);
	}
    while(fscanf(fr, "%c:%x\n", &letter[i], &hex[i]) != EOF)
	{
		//fscanf(fr, "%c:%x", &letter, &hex[i]);
        //printf("%c:%x\n", letter[i], hex[i]);
        i++;
    }
	
	fclose(fr);

	int B,S, A;
	int bitaddsp = 24;
	int j = 0;
	char W;
	char *cbits;
	char *p;
	//ReadGraph();
	GetFlags(nargs, args, &B, &S, &A, &W);
	int tagbits = ((bitaddsp-Log2(S)-Log2(B)));
	int nblocks = S*A;
	int indexbits = Log2(S);
	int offsetbits = Log2(B);
	int k;
	double percentage = (((((tagbits)*nblocks))/8)*100)/2048;
	printf("2KB %d-way associative cache\n", A); 
	printf("   Block size = %d bytes\n", B);
	printf("   Number of [sets, blocks] = [%d,%d]\n", S, nblocks);
	printf("  Set bit: %d", Log2(S));
	printf("  Block bit %d\n", Log2(B));
	printf("   Extra space for tag storage =  %d bytes ( %3.2f %%)\n", ((tagbits)*nblocks)/8, percentage);
	printf("   Bits for [tag, index, offset] = [%d, %d, %d] = %d\n", tagbits, indexbits, offsetbits, bitaddsp);
	printf("   Write policy = "); if (W == 't'){ printf(" Write-through\n");} else printf("Write-back");
	printf("Hex     Binary Address                       Set  Blk               Memory\n");
	printf("Address (tag/index/offset)              Tag Index off  Way UWay  Read Writ\n");
	printf("======= ========================== ======== ===== === ==== ====  ==== ====\n");
	for(j = 0; j < i; j++)
	{
		
		printf("%6x%c ", hex[j], letter[j]);
		Int2Bits(hex[j]);
		printf("\n");
		//printf("%.*s\n", 5, tempInt + 5)
		//printf("");
	}

	//Int2Bits(hex[j]);
	//printf("Int2Bits: %s\n", Int2Bits(10));
	//printf(hex);
	//printf("B:%d, S:%d, A:%d, W:%c\n", B, S, A, W);

}



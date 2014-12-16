#include <stdlib.h>
#include <stdio.h>



int Log2(int n)
{
	int count = 0;
	while (n != 1)
	{
		n = n >> 1;
		count++;
		printf("n = %d count = %d\n", n, count);
	}
	
	return count;
}

int main()
{
	printf("Block bits %d\n", Log2(32));
}
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <math.h>
/*
 * dumb_rand uses rand to return a float between -0.5 and 0.5
 */
#define dumb_seed(iseed_) srand(iseed_)
#define dumb_rand() ( 0.5 - ((double)rand())/(2147483648.0) )


/*
 * Performs y = alpha * A*x + beta*y
 */
void tstgemv
(
   const int M,         // # of rows in A
   const int N,         // # of cols in A
   const double alpha,  // scalar for A*x
   const double *A,     // row-major MxN array
   const int lda,       // gap between successive rows: lda >= N
   const double *X,     // N-length vector X
   const double beta,   // scalar for Y
   double *Y            // M-length output vector
)
{
   int i, j;

   for (i=0; i < M; i++, A += lda)
   {
      double dot=0.0;
      for (j=0; j < N; j++)
      {
         dot += A[j] * X[j];
      }
      Y[i] = alpha * dot + beta * Y[i];
   }
}


void PrintUsage(char *name, int iarg, char *arg)
{
   fprintf(stderr, "\nERROR around arg %d (%s).\n", iarg, arg ? arg:"unknown");
   fprintf(stderr, "USAGE: %s [flags], where flags are:\n", name);
   fprintf(stderr, "   -m <#> : set M to #\n");
   fprintf(stderr, "   -n <#> : set N to #\n");
   fprintf(stderr, "   -l <#> : set lda to #\n");
   fprintf(stderr, "   -a <#> : set alpha to #\n");
   fprintf(stderr, "   -b <#> : set beta to #\n");
   exit(iarg ? iarg : -1);
}

void GetFlags(int nargs, char **args, int *M, int *N, int *lda, 
              double *alpha, double *beta)
{
   int i;
   *M = 211;
   *N = 117;
   *lda = 0;
   *alpha = 0.25;
   *beta = 1.1;
   for (i=1; i < nargs; i++)
   {
      if (args[i][0] != '-')
         PrintUsage(args[0], i, args[i]);
      switch(args[i][1])
      {
      case 'm':
         if (++i >= nargs)
	    PrintUsage(args[0], i, "out of arguments");
         *M = atoi(args[i]);
	 break;
      case 'n':
         if (++i >= nargs)
	    PrintUsage(args[0], i, "out of arguments");
         *N = atoi(args[i]);
	 break;
      case 'l':
         if (++i >= nargs)
	    PrintUsage(args[0], i, "out of arguments");
         *lda = atoi(args[i]);
	 break;
      case 'a':
         if (++i >= nargs)
	    PrintUsage(args[0], i, "out of arguments");
         *alpha = atof(args[i]);
	 break;
      case 'b':
         if (++i >= nargs)
	    PrintUsage(args[0], i, "out of arguments");
         *beta = atof(args[i]);
	 break;
      default:
	 PrintUsage(args[0], i, args[i]);
      }
   }
   if (*lda < *N)
      *lda = *N + 8;
}

int main(int nargs, char **args)
{
   int N, M, lda;
   int i, j, nerr=0;
   double alpha, beta;
   double *Y, *y, *X, *A, *a;

   GetFlags(nargs, args, &M, &N, &lda, &alpha, &beta);
   void dgemv(const int M, const int N, const double alpha, const double *A,
              const int lda, const double *X, const double beta, double *Y);

/*
 * Get space for matrix, X, and two copies of Y
 */
   Y = malloc((M*lda + M+M + N)*sizeof(double));
   assert(Y);
   y = Y + M;
   X = y + M;
   a = A = X + N;
   dumb_seed(M*lda+N);
/*
 * Initialize operands
 */
   for (i=0; i < M; i++)
      y[i] = Y[i] = dumb_rand();
   for (i=0; i < N; i++)
      X[i] = dumb_rand();
   for (i=0; i < M; i++, a += lda)
      for (j=0; j < N; j++)
        a[j] = dumb_rand();

/*
 * Get known-good answer, then call user's DGEMV
 */
   tstgemv(M, N, alpha, A, lda, X, beta, Y);
   dgemv(M, N, alpha, A, lda, X, beta, y);
/*
 * Check user's answer is close enough for floating point
 */
   for (i=0; i < M; i++)
   {
      double err = fabs(Y[i] - y[i]);
      if (err >= 4.0*N*1e-16)
      {
         printf("Y[%d], exp=%e, got=%e, diff=%e\n", i, Y[i], y[i], err);
         nerr++;
      }
   }
   free(Y);
   printf("M=%d, N=%d, lda=%d, alpha=%e, beta=%e: ", M, N, lda, alpha, beta);
   if (!nerr)
      printf("PASSED!\n");
   else
      printf("FAILED for %d Y elements!\n", nerr);
   return(nerr);
}

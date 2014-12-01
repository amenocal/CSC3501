/* cs350128 Made by Menocal, Alejandro */

#define M %ecx
#define Y %edx
#define X %eax
#define N %ebx
#define A %esi
#define II %ebp
#define lda %edi
#define FSIZE 4*4

/*		     4            8                   12               20
void dgemv(const int M, const int N, const double alpha, const double *A 
          const int lda, const double *X, const double beta, double *Y)
		      24               28                32          40
*/

/*Prologue*/
.text
.global dgemv
dgemv:
	finit
	subl $FSIZE, %esp //allocate FSIZE to the stack
    	movl %edi, (%esp) //lda reg 
	movl %esi, 4(%esp) //A reg
	movl %ebx, 8(%esp) //N reg
	movl %ebp, 12(%esp) //II reg

	movl FSIZE+4(%esp), M
	movl FSIZE+8(%esp), N
	fldl FSIZE+12(%esp) //ST = {alpha}
	movl FSIZE+20(%esp), A
	movl FSIZE+24(%esp), lda	
	movl FSIZE+28(%esp), X
	fldl FSIZE+32(%esp) //ST = {beta, alpha}
	movl FSIZE+40(%esp), Y
	
	//Commented part out, worked the point 3 of the project
	/*xor II, II	//II = 0
	fxch		//ST = {alpha, beta}
	fldl (A,II,8)   //ST = {A[0],alpha, beta}
	fmul %st(1), %st // ST = {A[0]*alpha, alpha, beta}
	fldl (X,II,8)    //ST = {X[0],A[0]*alpha, alpha, beta}
	fmul %st(1), %st   //ST = {X[0]*A[0]*alpha, A[0]*alpha, alpha, beta}
	fxch %st(3)		//ST = {beta, A[0}*alpha, alpha, X[0]*A[0]*alpha}
	fldl (Y,II,8)	  //ST = {Y[0], beta, A[0}*alpha, alpha, X[0]*A[0]*alpha}
	fmul %st(1), %st //ST = {Y[0]*beta, beta, A[0}*alpha, alpha, X[0]*A[0]*alpha}
	fadd %st(4), %st  //ST = {Y[0]*beta + X[0]*A[0]*alpha,beta, A[0}*alpha, alpha, X[0]*A[0]*alpha} 
	fstpl (Y,II,8)  //Y[0] = Y[0]*beta+X[0]*A[0]*alpha  ST = {beta, A[0}*alpha, alpha, X[0]*A[0]*alpha}}*/
		
	//ST = {beta,alpha}
	//for (i = 0; i < N; i++)
	//Looking for Y[0] = alpha*A[0]*X[0]
	

	//Final code project! Finally works!
	fxch	//ST = {alpha, beta}
	xor II, II   //II = 0
	
	LOOP1:
		fmul %st(2), %st   //ST = {alpha*X[i]*A[i],A[i],alpha, beta}
		fxch %st(3)        //ST = {beta, A[i], alpha, alpha*X[i]*A[i]}
              	fldl (Y,II,8)       //ST = {Y[i], beta, A[i], alpha , alpha*X[i]*A[i]}
              	fmul %st(1), %st   //ST = (Y[i]*beta, beta,A[i], alpha, alpha*X[i]*A[i]}
 	      	fadd %st(4), %st   //ST = Y[i]*beta+alpha*X[i]*A[i], beta, A[i],alpha, alpha*X[i]*A[i]}
 	      	fstpl (Y,II,8)    //ST = {beta, A[i],alpha, alpha*X[i]*A[i]}

	LOOP2:	
		fldl (A,M,8)  //ST = {A[i],alpha, beta}
		fldl (X,M,8)  //ST = {X[i],A[i],alpha, beta}
		fmul %st(1), %st   //ST = {X[i]*A[i],A[i],alpha, beta}
	
	dec M
	cmp $0, M
	jg LOOP2
	
	LOOP1Done:	
		inc II
		cmp II, N
		jne LOOP1
		
DONE:
	fstp %st(0)  
	fstp %st(1)
	fstp %st(2)
	fstp %st(3)	//ST = {}
	movl (%esp), %edi
	movl 4(%esp),%esi
	movl 8(%esp), %ebx
	movl 12(%esp), %ebp
	addl $FSIZE, %esp
	ret	

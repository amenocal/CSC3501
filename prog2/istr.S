#define i1 %eax
#define i2 %edx
#define i3 %ecx
#define alp %ebx
#define v %esi
#define II %edi
#define x %ah
#define FSIZE 4*4

/*		4	8	12	   16
* int istr(int i1, int i2, int *i3, char *alp)
*/

/* Prologue */
.text
.global istr
istr:
    subl $FSIZE, %esp   /* allocate FSIZE bytes on stack */
    movl %ebx, (%esp)    // save ebx to esp */
    movl %edi, 4(%esp)   // save edi to 4+esp 
    movl %esi, 8(%esp)   # save esi to 8+esp

    movl FSIZE+4(%esp), i1
    movl FSIZE+8(%esp), i2
    movl FSIZE+12(%esp), i3 
    movl FSIZE+16(%esp), alp

/* Function Body */
    addl i2, i1      #i2 = i1 + i2
    movl (i3), v     #v = i3
    lea (v, v, 4), v #v = 5*i3
    movl v, (i3)     #i3 = 5*i3

    xor II, II  #i=0

    LOOP1:
        movb (alp, II, 1), i2  #i2, pointing to array] 
	    lea 97(II), i2         #i2 = 97,98,99
        movb i2, (alp, II, 1)  #alp[i] = i2
	    inc II                 #i++
        cmp $26, II            #if i = 26, continue
    jl LOOP1
   
/* Epilogue */
    
DONE:
    xor x, x
    movb x, (alp, II, 1)
    movl (%esp), %ebx    // restore original value of ebx
    movl 4(%esp), %edi   // restore original value of edi
    movl 8(%esp), %esi   //restore original value of esi
    movl 12(%esp), %ebp  //restore original value of ebp
    addl $FSIZE, %esp   //restore stack ptr
 ret


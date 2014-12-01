#
# It's good practice to use make macros for compiler and flags, so when you
# need to change, you change at one place, not throughout makefile
#
CC = gcc
CCFLAGS = -Wall -g -m32

#
# Use macros to give paths that might change
#
EXEd = /classes/cs3501/cs3501_wha/bin/
#SRCd = ./
SRCd = /classes/cs3501/cs3501_wha/classes/cs3501_S14/p3_dgemv
#
# Macros can also help with commonly referenced filenames
#
OBJs = mvtst.o dgemv.o

xmvtest : $(OBJs)
	$(CC) $(CCFLAGS) -o xmvtest $(OBJs) -lm

#
# This rules remove object and executables when they are no longer needed
#
clean :
	- rm -f $(OBJs) 
kill :
	- rm -f $(OBJs) xmvtest
#
# This is an example of a specific rule for building tester.o given tester.c
#
mvtst.o : $(SRCd)/mvtst.c
	$(CC) $(CCFLAGS) -c $(SRCd)/mvtst.c
dgemv.o : dgemv.S
	$(CC) $(CCFLAGS) -c dgemv.S
#
# This rule uses our submission program to submit code that works!
#
submit:
	make kill
	$(EXEd)/p_copy 3


PROC=proc
GCC=gcc 

BINDIR=$(HOME)/bin

# oracle include path 
ORAIFLAG=-I$(ORACLE_HOME)/rdbms/public -I$(ORACLE_HOME)/precomp/public -I$(ORACLE_HOME)/plsql/public 

#oracle lib path 
ORALFLAG=-L$(ORACLE_HOME)/lib -L$(ORACLE_HOME)/precomp/lib -L$(ORACLE_HOME)/rdbms/lib -L$(ORACLE_HOME)/sqlplus/lib -L$(ORACLE_HOME)/network/lib -L$(ORACLE_HOME)/plsql/lib 

IFLAG=$(ORAIFLAG)
LFLAG=$(ORALFLAG) -lclntsh

PROCFLAGS=char_map=string parse=none

.SUFFIXES: .pc .c .o 
.pc.c:
	$(PROC) $(PROCFLAGS) iname=$*
	rm *.lis
.pc.o: 
	$(PROC) $(PROCFLAGS) iname=$*
	rm *.lis
	$(GCC) $(IFLAG) -c $*.c 
.c.o: 
	$(GCC) $(IFLAG) -c $*.c 


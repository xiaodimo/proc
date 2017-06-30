
include $(HOME)/workspace/proc.mk 

all:test
test:test.o
	$(GCC)  $? -o $@ $(IFLAG) $(LFLAG) 
	rm ./tp* ./*.c ./*.o 





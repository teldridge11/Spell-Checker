CC = gcc
CFLAGS = -g -Wall -std=c99

all : prog

prog : main.c hashMap.o
	$(CC) $(CFLAGS) -o $@ $^

spellChecker : spellChecker.o hashMap.o
	$(CC) $(CFLAGS) -o $@ $^

hashMap.o : hashMap.h hashMap.c

spellChecker.o : main.c hashMap.h

.PHONY : clean memCheckTests memCheckProg

memCheckTests :
	valgrind --tool=memcheck --leak-check=yes tests

memCheckProg :
	valgrind --tool=memcheck --leak-check=yes prog

memCheckSpellChecker :
	valgrind --tool=memcheck --leak-check=yes spellChecker

clean :
	-rm *.o
	-rm tests
	-rm prog
	-rm spellChecker

#! /usr/bin/make -f

# To disable symbol table dumps, swap the comment in the next two lines
# and rebuild (including make clean)
CXXFLAGS=-g -DDEBUG_SYMBOL_TABLE
# CXXFLAGS=-g

all: calc3a_exe

calc3a_exe: calc3 symbol_table.o calc3a_o
	g++ $(CXXFLAGS) y.tab.o lex.yy.o symbol_table.o calc3a.o -o pass2i

calc3: calc3_bison calc3_flex
	gcc -c y.tab.c lex.yy.c

calc3a_o:
	gcc -g -c -o calc3a.o calc3a.c

calc3_bison:
	bison -y -d calc3.y

calc3_flex:
	flex calc3.l


symbol_table.o:
	g++ $(CXXFLAGS) -c -o symbol_table.o symbol_table.cc

clean:
	rm -rf *.o
	rm -rf lex.yy.*
	rm -rf y.tab.*
	rm -rf calc3a

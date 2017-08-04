# Modify these variables to add more files

CPP_SRC = src/main.cpp
FLEX_SRC = src/tokens.l
BISON_SRC = src/grammar.y

HEADERS = # Add your header files

#########################################

TARGET = bin/parser # Modify this to change the name of the program

# Don't modify these unless you know what you're doing

TOKENS = src/bison/tokens.h

FLEX_TARGET  = src/flex/lexer.c
BISON_TARGET = src/bison/parser.c

OBJ_FILES = $(OBJ_CPP_TARGET) $(OBJ_BISON_TARGET) $(OBJ_FLEX_TARGET)

OBJ_CPP_TARGET = ${CPP_SRC:src/%.cpp=obj/%.o}
OBJ_FLEX_TARGET = obj/lexer.o
OBJ_BISON_TARGET = obj/parser.o

#########################################

.PHONY: clean

$(TARGET): $(OBJ_FILES)
	g++ -w -g -o $@ $^

$(FLEX_TARGET): $(FLEX_SRC)
	flex -o $@ $^

$(BISON_TARGET): $(BISON_SRC)
	bison --defines=$(TOKENS) -o $@ $^

$(OBJ_BISON_TARGET): $(BISON_TARGET)
	g++ -w -g -c -o $@ $<

$(OBJ_FLEX_TARGET): $(FLEX_TARGET)
	g++ -w -g -c -o $@ $<

$(OBJ_CPP_TARGET): $(CPP_SRC) $(HEADERS)
	g++ -w -g -c -o $@ $(CPP_SRC)

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f bin/*
	rm -f obj/*
	rm -f src/bison/*
	rm -f src/flex/*
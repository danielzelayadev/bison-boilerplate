# Modify these variables to add more files

CPP_SRC = src/main.cpp
FLEX_SRC = src/tokens.l
BISON_SRC = src/grammar.y

HEADERS = # Add your header files

#########################################

TARGET = bin/parser # Modify this to change the name of the program

ENTRY = samples/sample.txt # Modify this to change the entry sample

# Don't modify these unless you know what you're doing

TOKENS = $(FBDST)/tokens.h

FBDST = dst

GENERATED_DIRS = bin obj $(FBDST)

FLEX_TARGET  = $(FBDST)/lexer.c
BISON_TARGET = $(FBDST)/parser.c

OBJ_FILES = $(OBJ_CPP_TARGET) $(OBJ_BISON_TARGET) $(OBJ_FLEX_TARGET)

OBJ_CPP_TARGET = ${CPP_SRC:src/%.cpp=obj/%.o}
OBJ_FLEX_TARGET = obj/lexer.o
OBJ_BISON_TARGET = obj/parser.o

#########################################

.PHONY: clean

build: dirs $(TARGET)

dirs:
	mkdir -p $(GENERATED_DIRS)

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

obj/%.o: src/%.cpp $(HEADERS)
	g++ -w -g -c -o $@ $<

run: build
	./$(TARGET) $(ENTRY)

clean:
	rm -f bin/*
	rm -f obj/*
	rm -f $(FBDST)/*

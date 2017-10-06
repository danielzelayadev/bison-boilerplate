CPP_SRC = $(PARSER) $(LEXER) $(shell find . -name "*.cpp" -not -path "./src/flexson/*")

LEXER = src/flexson/lexer.cpp
PARSER = src/flexson/parser.cpp

TOKENS = src/flexson/tokens.h

REPORT = debug/state.out

FLEX_SRC = src/flexson/tokens.l

BISON_SRC = src/flexson/grammar.y

OBJ_FILES = $(patsubst ./src/%.cpp, obj/%.o, $(CPP_SRC))

CXXFLAGS=-std=c++11

TARGET = bin/parser

.PHONY: clean

build: $(TARGET)

$(LEXER): $(FLEX_SRC)
	flex -o $@ $<

$(PARSER): $(BISON_SRC)
	mkdir -p debug
	bison --defines=$(TOKENS) -v --report-file=$(REPORT) -o $@ $<

obj/%.o: src/%.cpp
	mkdir -p $(@D)
	g++ -std=c++11 -w -g -c -o $@ $<

$(TARGET): $(OBJ_FILES)
	mkdir -p bin
	g++ -std=c++11 -w -g -o $@ $^

clean:
	rm -rf obj/**/
	rm -f bin/* obj/* debug/*
	rm -f $(LEXER) $(PARSER) $(TOKENS) $(OUTPUT)
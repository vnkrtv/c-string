CC=cc
GCC=gcc

CFLAGS=-Wall -Wextra -Werror -pedantic -I.
CFLAGS_DEBUG=$(CFLAGS) -O0 -fno-builtin -ggdb
CFLAGS_RELEASE=$(CFLAGS) -DSOMETHING_RELEASE -O3 -ggdb

TESTS_FOLDER=tests
TESTS_PATH=test_string_t.c
TESTS_BIN=test_string_t

EXAMPLES_FOLDER=examples
EXAMPLES_PATH=example.c
EXAMPLES_BIN=example


.PHONY: test.build
test.build:
	$(CC) $(CFLAGS) $(TESTS_FOLDER)/$(TESTS_PATH) -o $(TESTS_FOLDER)/$(TESTS_BIN)

.PHONY: test.run
test.run:
	./$(TESTS_FOLDER)/$(TESTS_BIN)

.PHONY: test
test: test.build test.run


.PHONY: example.build
example.build:
	$(CC) $(CFLAGS) $(EXAMPLES_FOLDER)/$(EXAMPLES_PATH) -o $(EXAMPLES_FOLDER)/$(EXAMPLES_BIN)

.PHONY: example.run
example.run:
	./$(EXAMPLES_FOLDER)/$(EXAMPLES_BIN)

.PHONY: example
example: example.build example.run

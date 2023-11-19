CC=cc
GCC=gcc

CFLAGS=-Wall -Wextra -Werror -pedantic -I.
CFLAGS_DEBUG=$(CFLAGS) -O0 -fno-builtin -ggdb
CFLAGS_RELEASE=$(CFLAGS) -DSOMETHING_RELEASE -O3 -ggdb

TESTS_FOLDER=tests
TESTS_PATH=test_string_t.c
TESTS_BIN=test_string_t

.PHONY: test.build
test.build:
	$(CC) $(TESTS_FOLDER)/$(TESTS_PATH) -o $(TESTS_FOLDER)/$(TESTS_BIN)

.PHONY: test.run
test.run:
	./$(TESTS_FOLDER)/$(TESTS_BIN)

.PHONY: test
test: test.build test.run

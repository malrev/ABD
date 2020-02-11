CLANG=../obfuscator/build/bin/clang

.PHONY: all
all: test-hello test-mod2 test-add test-mod2-add

test-hello:
	${CLANG} -m32 -O0 ./src/test-hello.c -o test-hello

test-mod2:
	${CLANG} -m32 -O0 ./src/test-mod2.c -o test-mod2

test-mod2-add:
	${CLANG} -m32 -O0 ./src/test-mod2-add.c -o test-mod2-add

test-add:
	${CLANG} -m32 -O0 ./src/test-add.c -o test-add

clean:
	rm -Rf test-mod2
	rm -Rf test-hello
	rm -Rf test-add
	rm -Rf test-mod2-add
	rm -Rf *.bin *.c *.bc *.idb


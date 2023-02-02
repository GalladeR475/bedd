exec = bedd.out
srcs = $(wildcard src/*.c)
objs = $(srcs:.c=.o)
flags = -g

$(exec): $(objs)
	gcc $(objs) $(flags) -o $(exec)

%.o: %.c include/%.h
	gcc -c $(flags) $< -o $@

install:
	make
	cp ./bedd.out /usr/local/bin/bedd

clean:
	-rm *.out
	-rm src/*.o
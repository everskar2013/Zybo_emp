DEBUG := -g
CC = g++
CXX = g++
EXECUTABLE = server client client_demo
LIB     =
CFLAG   = -c -Wall $(DEBUG)
CPPFLAG = $(CFLAG)
LDFLAG = $(LIB)
#LOC    = ./

all: $(EXECUTABLE)
	chmod +x gnugo.gtp

server: mmap.o GTPClient.o 
	$(CXX) -o $@ $^

client: client.o
	$(CXX) -o $@ $^ 

client_demo: client_demo.o
	$(CXX) -o $@ $^

.c.o:
	$(CC) ${CFLAG} -c -o $@ $< $(LIBS)

.cpp.o:
	$(CXX) ${CPPFLAG} -c -o $@ $< $(LIBS)

clean:
	rm *.o
	rm $(EXECUTABLE)
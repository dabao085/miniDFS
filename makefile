CXX=g++
CXXFLAGS= -std=c++11 -g -Wall -Wextra -fstack-protector-strong
ifeq ($(DEBUG), y)
	CXXFLAGS += -O0 -DDEBUG
else
	CXXFLAGS += -O3 -DNDEBUG
endif

OBJS = $(patsubst %.cpp,%.o,$(shell ls *.cpp))

LIBS = -lpthread

PROGRAMS = miniDFS

all:miniDFS
miniDFS:$(OBJS)
	$(CXX) $(CXXLDFLAGS) -o miniDFS $(OBJS) $(LIBS)

%.o: %.cpp
	$(CXX) -c $(CXXFLAGS) $(INCLUDE) -o $@ $<

clean:
	rm -f $(PROGRAMS)
	rm -f $(OBJS)

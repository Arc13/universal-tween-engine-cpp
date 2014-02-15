PROJECT = libtween.a
CXX = arm-none-eabi-g++
AR = arm-none-eabi-ar
CXXFLAGS = -g -Wall -pedantic -std=c++11

INCLUDES = -Iinclude/
SOURCES = $(wildcard src/*.cpp) $(wildcard src/*/*.cpp)
OBJECTS = $(SOURCES:src/%.cpp=build/%.o)

.PHONY: all dir clean

all: dir $(PROJECT)

dir:
	@mkdir -p build/equations
	@mkdir -p build/paths
	@mkdir -p lib

$(PROJECT): $(OBJECTS)
	$(AR) rvs lib/$@ $^

clean:
	@rm -rf build
	@rm -rf lib
	@echo "Successfully cleaned."

build/%.o: src/%.cpp
	$(CXX) $(INCLUDES) $(CXXFLAGS) -c $< -o $@
	$(CXX) -MM $< > build/$*.d

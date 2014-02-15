PROJECT = libtween.a
CXX = arm-none-eabi-g++
AR = arm-none-eabi-ar
CXXFLAGS = -g -Wall -pedantic -std=c++11 -fno-rtti -fno-exceptions

TEST_CXX = g++
TEST_AR = ar
TEST_CXXFLAGS = -g -Wall -pedantic -std=c++11 -fno-rtti -fno-exceptions -DTESTING

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

testvars:
	$(eval CXX := $(TEST_CXX))
	$(eval AR := $(TEST_AR))
	$(eval CXXFLAGS := $(TEST_CXXFLAGS))

test: clean testvars all

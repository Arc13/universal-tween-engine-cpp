cmake_minimum_required(VERSION 3.6)
add_definitions(-D__wiiu__)
set(CMAKE_TOOLCHAIN_FILE $ENV{WUT_ROOT}/share/wut.toolchain.cmake)

project(tween)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -Wall -pedantic -std=c++11 -fno-rtti -fno-exceptions")

include_directories(include)

set(SOURCE_FILES
	src/BaseTween.cpp
	src/Tween.cpp
	src/TweenEquations.cpp
	src/TweenManager.cpp
	src/TweenPaths.cpp
	src/TweenPool.cpp
	src/equations/Back.cpp
	src/equations/Bounce.cpp
	src/equations/Circ.cpp
	src/equations/Cubic.cpp
	src/equations/Elastic.cpp
	src/equations/Expo.cpp
	src/equations/Linear.cpp
	src/equations/Quad.cpp
	src/equations/Quart.cpp
	src/equations/Quint.cpp
	src/equations/Sine.cpp
	src/paths/CatmullRom.cpp
	src/paths/LinearPath.cpp)
add_library(tween STATIC ${SOURCE_FILES})
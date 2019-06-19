cmake_minimum_required(VERSION 3.14)
project(aula12e13 C)

set(CMAKE_C_STANDARD 99)

add_executable(aula12e13 digraph.c testdigraph.c simdigraph.c queue.c queue.h digraph.h)
cmake_minimum_required(VERSION 3.13)
project(aula9 C)

set(CMAKE_C_STANDARD 99)

add_executable(aula9 fraction.h fraction.c testfraction.c queue.c queue.h stack.h stack.c abp.h abp.c testabp.c simabp.c)
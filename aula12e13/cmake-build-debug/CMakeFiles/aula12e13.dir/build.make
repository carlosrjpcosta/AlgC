# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /cygdrive/c/Users/carlo/.CLion2019.1/system/cygwin_cmake/bin/cmake.exe

# The command to remove a file.
RM = /cygdrive/c/Users/carlo/.CLion2019.1/system/cygwin_cmake/bin/cmake.exe -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/cmake-build-debug"

# Include any dependencies generated for this target.
include CMakeFiles/aula12e13.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/aula12e13.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/aula12e13.dir/flags.make

CMakeFiles/aula12e13.dir/digraph.c.o: CMakeFiles/aula12e13.dir/flags.make
CMakeFiles/aula12e13.dir/digraph.c.o: ../digraph.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/aula12e13.dir/digraph.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/aula12e13.dir/digraph.c.o   -c "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/digraph.c"

CMakeFiles/aula12e13.dir/digraph.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/aula12e13.dir/digraph.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/digraph.c" > CMakeFiles/aula12e13.dir/digraph.c.i

CMakeFiles/aula12e13.dir/digraph.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/aula12e13.dir/digraph.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/digraph.c" -o CMakeFiles/aula12e13.dir/digraph.c.s

CMakeFiles/aula12e13.dir/testdigraph.c.o: CMakeFiles/aula12e13.dir/flags.make
CMakeFiles/aula12e13.dir/testdigraph.c.o: ../testdigraph.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/aula12e13.dir/testdigraph.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/aula12e13.dir/testdigraph.c.o   -c "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/testdigraph.c"

CMakeFiles/aula12e13.dir/testdigraph.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/aula12e13.dir/testdigraph.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/testdigraph.c" > CMakeFiles/aula12e13.dir/testdigraph.c.i

CMakeFiles/aula12e13.dir/testdigraph.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/aula12e13.dir/testdigraph.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/testdigraph.c" -o CMakeFiles/aula12e13.dir/testdigraph.c.s

CMakeFiles/aula12e13.dir/simdigraph.c.o: CMakeFiles/aula12e13.dir/flags.make
CMakeFiles/aula12e13.dir/simdigraph.c.o: ../simdigraph.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/aula12e13.dir/simdigraph.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/aula12e13.dir/simdigraph.c.o   -c "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/simdigraph.c"

CMakeFiles/aula12e13.dir/simdigraph.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/aula12e13.dir/simdigraph.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/simdigraph.c" > CMakeFiles/aula12e13.dir/simdigraph.c.i

CMakeFiles/aula12e13.dir/simdigraph.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/aula12e13.dir/simdigraph.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/simdigraph.c" -o CMakeFiles/aula12e13.dir/simdigraph.c.s

CMakeFiles/aula12e13.dir/queue.c.o: CMakeFiles/aula12e13.dir/flags.make
CMakeFiles/aula12e13.dir/queue.c.o: ../queue.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/aula12e13.dir/queue.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/aula12e13.dir/queue.c.o   -c "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/queue.c"

CMakeFiles/aula12e13.dir/queue.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/aula12e13.dir/queue.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/queue.c" > CMakeFiles/aula12e13.dir/queue.c.i

CMakeFiles/aula12e13.dir/queue.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/aula12e13.dir/queue.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/queue.c" -o CMakeFiles/aula12e13.dir/queue.c.s

# Object files for target aula12e13
aula12e13_OBJECTS = \
"CMakeFiles/aula12e13.dir/digraph.c.o" \
"CMakeFiles/aula12e13.dir/testdigraph.c.o" \
"CMakeFiles/aula12e13.dir/simdigraph.c.o" \
"CMakeFiles/aula12e13.dir/queue.c.o"

# External object files for target aula12e13
aula12e13_EXTERNAL_OBJECTS =

aula12e13.exe: CMakeFiles/aula12e13.dir/digraph.c.o
aula12e13.exe: CMakeFiles/aula12e13.dir/testdigraph.c.o
aula12e13.exe: CMakeFiles/aula12e13.dir/simdigraph.c.o
aula12e13.exe: CMakeFiles/aula12e13.dir/queue.c.o
aula12e13.exe: CMakeFiles/aula12e13.dir/build.make
aula12e13.exe: CMakeFiles/aula12e13.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_5) "Linking C executable aula12e13.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/aula12e13.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/aula12e13.dir/build: aula12e13.exe

.PHONY : CMakeFiles/aula12e13.dir/build

CMakeFiles/aula12e13.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/aula12e13.dir/cmake_clean.cmake
.PHONY : CMakeFiles/aula12e13.dir/clean

CMakeFiles/aula12e13.dir/depend:
	cd "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/cmake-build-debug" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13" "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13" "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/cmake-build-debug" "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/cmake-build-debug" "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula12e13/cmake-build-debug/CMakeFiles/aula12e13.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/aula12e13.dir/depend


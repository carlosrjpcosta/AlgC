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
CMAKE_SOURCE_DIR = "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/cmake-build-debug"

# Include any dependencies generated for this target.
include CMakeFiles/aula9.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/aula9.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/aula9.dir/flags.make

CMakeFiles/aula9.dir/fraction.c.o: CMakeFiles/aula9.dir/flags.make
CMakeFiles/aula9.dir/fraction.c.o: ../fraction.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/aula9.dir/fraction.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/aula9.dir/fraction.c.o   -c "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/fraction.c"

CMakeFiles/aula9.dir/fraction.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/aula9.dir/fraction.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/fraction.c" > CMakeFiles/aula9.dir/fraction.c.i

CMakeFiles/aula9.dir/fraction.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/aula9.dir/fraction.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/fraction.c" -o CMakeFiles/aula9.dir/fraction.c.s

CMakeFiles/aula9.dir/testfraction.c.o: CMakeFiles/aula9.dir/flags.make
CMakeFiles/aula9.dir/testfraction.c.o: ../testfraction.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/aula9.dir/testfraction.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/aula9.dir/testfraction.c.o   -c "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/testfraction.c"

CMakeFiles/aula9.dir/testfraction.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/aula9.dir/testfraction.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/testfraction.c" > CMakeFiles/aula9.dir/testfraction.c.i

CMakeFiles/aula9.dir/testfraction.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/aula9.dir/testfraction.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/testfraction.c" -o CMakeFiles/aula9.dir/testfraction.c.s

CMakeFiles/aula9.dir/queue.c.o: CMakeFiles/aula9.dir/flags.make
CMakeFiles/aula9.dir/queue.c.o: ../queue.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/aula9.dir/queue.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/aula9.dir/queue.c.o   -c "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/queue.c"

CMakeFiles/aula9.dir/queue.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/aula9.dir/queue.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/queue.c" > CMakeFiles/aula9.dir/queue.c.i

CMakeFiles/aula9.dir/queue.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/aula9.dir/queue.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/queue.c" -o CMakeFiles/aula9.dir/queue.c.s

CMakeFiles/aula9.dir/stack.c.o: CMakeFiles/aula9.dir/flags.make
CMakeFiles/aula9.dir/stack.c.o: ../stack.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/aula9.dir/stack.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/aula9.dir/stack.c.o   -c "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/stack.c"

CMakeFiles/aula9.dir/stack.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/aula9.dir/stack.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/stack.c" > CMakeFiles/aula9.dir/stack.c.i

CMakeFiles/aula9.dir/stack.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/aula9.dir/stack.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/stack.c" -o CMakeFiles/aula9.dir/stack.c.s

CMakeFiles/aula9.dir/abp.c.o: CMakeFiles/aula9.dir/flags.make
CMakeFiles/aula9.dir/abp.c.o: ../abp.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/aula9.dir/abp.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/aula9.dir/abp.c.o   -c "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/abp.c"

CMakeFiles/aula9.dir/abp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/aula9.dir/abp.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/abp.c" > CMakeFiles/aula9.dir/abp.c.i

CMakeFiles/aula9.dir/abp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/aula9.dir/abp.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/abp.c" -o CMakeFiles/aula9.dir/abp.c.s

CMakeFiles/aula9.dir/testabp.c.o: CMakeFiles/aula9.dir/flags.make
CMakeFiles/aula9.dir/testabp.c.o: ../testabp.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/aula9.dir/testabp.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/aula9.dir/testabp.c.o   -c "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/testabp.c"

CMakeFiles/aula9.dir/testabp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/aula9.dir/testabp.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/testabp.c" > CMakeFiles/aula9.dir/testabp.c.i

CMakeFiles/aula9.dir/testabp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/aula9.dir/testabp.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/testabp.c" -o CMakeFiles/aula9.dir/testabp.c.s

CMakeFiles/aula9.dir/simabp.c.o: CMakeFiles/aula9.dir/flags.make
CMakeFiles/aula9.dir/simabp.c.o: ../simabp.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/aula9.dir/simabp.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/aula9.dir/simabp.c.o   -c "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/simabp.c"

CMakeFiles/aula9.dir/simabp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/aula9.dir/simabp.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/simabp.c" > CMakeFiles/aula9.dir/simabp.c.i

CMakeFiles/aula9.dir/simabp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/aula9.dir/simabp.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/simabp.c" -o CMakeFiles/aula9.dir/simabp.c.s

# Object files for target aula9
aula9_OBJECTS = \
"CMakeFiles/aula9.dir/fraction.c.o" \
"CMakeFiles/aula9.dir/testfraction.c.o" \
"CMakeFiles/aula9.dir/queue.c.o" \
"CMakeFiles/aula9.dir/stack.c.o" \
"CMakeFiles/aula9.dir/abp.c.o" \
"CMakeFiles/aula9.dir/testabp.c.o" \
"CMakeFiles/aula9.dir/simabp.c.o"

# External object files for target aula9
aula9_EXTERNAL_OBJECTS =

aula9.exe: CMakeFiles/aula9.dir/fraction.c.o
aula9.exe: CMakeFiles/aula9.dir/testfraction.c.o
aula9.exe: CMakeFiles/aula9.dir/queue.c.o
aula9.exe: CMakeFiles/aula9.dir/stack.c.o
aula9.exe: CMakeFiles/aula9.dir/abp.c.o
aula9.exe: CMakeFiles/aula9.dir/testabp.c.o
aula9.exe: CMakeFiles/aula9.dir/simabp.c.o
aula9.exe: CMakeFiles/aula9.dir/build.make
aula9.exe: CMakeFiles/aula9.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_8) "Linking C executable aula9.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/aula9.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/aula9.dir/build: aula9.exe

.PHONY : CMakeFiles/aula9.dir/build

CMakeFiles/aula9.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/aula9.dir/cmake_clean.cmake
.PHONY : CMakeFiles/aula9.dir/clean

CMakeFiles/aula9.dir/depend:
	cd "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/cmake-build-debug" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9" "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9" "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/cmake-build-debug" "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/cmake-build-debug" "/cygdrive/c/Users/carlo/OneDrive/Ambiente de Trabalho/AlC/aula9/cmake-build-debug/CMakeFiles/aula9.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/aula9.dir/depend


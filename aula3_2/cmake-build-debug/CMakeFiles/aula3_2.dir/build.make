# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.13

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

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2018.3.4\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2018.3.4\bin\cmake\win\bin\cmake.exe" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "C:\Users\carlo\OneDrive\Ambiente de Trabalho\AlC\aula3_2"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "C:\Users\carlo\OneDrive\Ambiente de Trabalho\AlC\aula3_2\cmake-build-debug"

# Include any dependencies generated for this target.
include CMakeFiles/aula3_2.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/aula3_2.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/aula3_2.dir/flags.make

CMakeFiles/aula3_2.dir/main.c.obj: CMakeFiles/aula3_2.dir/flags.make
CMakeFiles/aula3_2.dir/main.c.obj: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="C:\Users\carlo\OneDrive\Ambiente de Trabalho\AlC\aula3_2\cmake-build-debug\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/aula3_2.dir/main.c.obj"
	C:\MinGW\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\aula3_2.dir\main.c.obj   -c "C:\Users\carlo\OneDrive\Ambiente de Trabalho\AlC\aula3_2\main.c"

CMakeFiles/aula3_2.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/aula3_2.dir/main.c.i"
	C:\MinGW\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "C:\Users\carlo\OneDrive\Ambiente de Trabalho\AlC\aula3_2\main.c" > CMakeFiles\aula3_2.dir\main.c.i

CMakeFiles/aula3_2.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/aula3_2.dir/main.c.s"
	C:\MinGW\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "C:\Users\carlo\OneDrive\Ambiente de Trabalho\AlC\aula3_2\main.c" -o CMakeFiles\aula3_2.dir\main.c.s

# Object files for target aula3_2
aula3_2_OBJECTS = \
"CMakeFiles/aula3_2.dir/main.c.obj"

# External object files for target aula3_2
aula3_2_EXTERNAL_OBJECTS =

aula3_2.exe: CMakeFiles/aula3_2.dir/main.c.obj
aula3_2.exe: CMakeFiles/aula3_2.dir/build.make
aula3_2.exe: CMakeFiles/aula3_2.dir/linklibs.rsp
aula3_2.exe: CMakeFiles/aula3_2.dir/objects1.rsp
aula3_2.exe: CMakeFiles/aula3_2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="C:\Users\carlo\OneDrive\Ambiente de Trabalho\AlC\aula3_2\cmake-build-debug\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable aula3_2.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\aula3_2.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/aula3_2.dir/build: aula3_2.exe

.PHONY : CMakeFiles/aula3_2.dir/build

CMakeFiles/aula3_2.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\aula3_2.dir\cmake_clean.cmake
.PHONY : CMakeFiles/aula3_2.dir/clean

CMakeFiles/aula3_2.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" "C:\Users\carlo\OneDrive\Ambiente de Trabalho\AlC\aula3_2" "C:\Users\carlo\OneDrive\Ambiente de Trabalho\AlC\aula3_2" "C:\Users\carlo\OneDrive\Ambiente de Trabalho\AlC\aula3_2\cmake-build-debug" "C:\Users\carlo\OneDrive\Ambiente de Trabalho\AlC\aula3_2\cmake-build-debug" "C:\Users\carlo\OneDrive\Ambiente de Trabalho\AlC\aula3_2\cmake-build-debug\CMakeFiles\aula3_2.dir\DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/aula3_2.dir/depend


# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /snap/clion/206/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/206/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pedro/CLionProjects/MC404

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pedro/CLionProjects/MC404/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/MC404.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/MC404.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/MC404.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/MC404.dir/flags.make

CMakeFiles/MC404.dir/trabalho1/desmontador.c.o: CMakeFiles/MC404.dir/flags.make
CMakeFiles/MC404.dir/trabalho1/desmontador.c.o: ../trabalho1/desmontador.c
CMakeFiles/MC404.dir/trabalho1/desmontador.c.o: CMakeFiles/MC404.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pedro/CLionProjects/MC404/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/MC404.dir/trabalho1/desmontador.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/MC404.dir/trabalho1/desmontador.c.o -MF CMakeFiles/MC404.dir/trabalho1/desmontador.c.o.d -o CMakeFiles/MC404.dir/trabalho1/desmontador.c.o -c /home/pedro/CLionProjects/MC404/trabalho1/desmontador.c

CMakeFiles/MC404.dir/trabalho1/desmontador.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/MC404.dir/trabalho1/desmontador.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pedro/CLionProjects/MC404/trabalho1/desmontador.c > CMakeFiles/MC404.dir/trabalho1/desmontador.c.i

CMakeFiles/MC404.dir/trabalho1/desmontador.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/MC404.dir/trabalho1/desmontador.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pedro/CLionProjects/MC404/trabalho1/desmontador.c -o CMakeFiles/MC404.dir/trabalho1/desmontador.c.s

# Object files for target MC404
MC404_OBJECTS = \
"CMakeFiles/MC404.dir/trabalho1/desmontador.c.o"

# External object files for target MC404
MC404_EXTERNAL_OBJECTS =

MC404: CMakeFiles/MC404.dir/trabalho1/desmontador.c.o
MC404: CMakeFiles/MC404.dir/build.make
MC404: CMakeFiles/MC404.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pedro/CLionProjects/MC404/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable MC404"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MC404.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/MC404.dir/build: MC404
.PHONY : CMakeFiles/MC404.dir/build

CMakeFiles/MC404.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/MC404.dir/cmake_clean.cmake
.PHONY : CMakeFiles/MC404.dir/clean

CMakeFiles/MC404.dir/depend:
	cd /home/pedro/CLionProjects/MC404/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pedro/CLionProjects/MC404 /home/pedro/CLionProjects/MC404 /home/pedro/CLionProjects/MC404/cmake-build-debug /home/pedro/CLionProjects/MC404/cmake-build-debug /home/pedro/CLionProjects/MC404/cmake-build-debug/CMakeFiles/MC404.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/MC404.dir/depend


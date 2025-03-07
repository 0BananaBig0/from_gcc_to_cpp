# ############################################################################ #
# #                        File Name: CMakeLists.txt                         # #
# #                          Author: Huaxiao Liang                           # #
# #                         Mail: hxliang666@qq.com                          # #
# #                         03/06/2025-Thu-23:18:40                          # #
# ############################################################################ #

cmake_minimum_required(VERSION 3.10)
project(SortingProject)
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

# Define the compiler
set(CMAKE_CXX_COMPILER "g++")
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
# Show the full compilation commands
set(CMAKE_VERBOSE_MAKEFILE ON)

# List all source files
file(GLOB SRCS CONFIGURE_DEPENDS *.cpp *.h)
# Define object files (excluding Fun.cpp and FunN.cpp)
set(OBJ_SRCS ${SRCS})
list(REMOVE_ITEM OBJ_SRCS "${CMAKE_CURRENT_SOURCE_DIR}/Fun.cpp"
     "${CMAKE_CURRENT_SOURCE_DIR}/Fun.cpp")

# Define static and shared libraries
set(STATIC_LIBS Fun)
set(SHARED_LIBS FunN)

# Define the target executable
set(TARGET Main.exe)

# Add compiler flags
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g")
string(REPLACE "-O3" "-Ofast" CMAKE_CXX_FLAGS_RELEASE
               "${CMAKE_CXX_FLAGS_RELEASE}")
# Add a marco, define TEST to enable something
option(TEST "Enable TEST feature" OFF)
if(TEST)
  message(STATUS "TEST is enabled")
  add_definitions(-DTEST_SORT)
endif()
# Create static library from Fun.cpp
add_library(Fun STATIC Fun.cpp)

# Create shared library from FunN.cpp
add_library(FunN SHARED FunN.cpp)

# Create the main executable
add_executable(${TARGET} ${OBJ_SRCS})
target_link_options(${TARGET} PRIVATE -Wl,--as-needed)
target_link_libraries(${TARGET} Fun FunN)

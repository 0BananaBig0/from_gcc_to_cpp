cmake_minimum_required(VERSION 3.16)

project(
  main
  VERSION 1.0
  LANGUAGES CXX)

# Find required Qt packages
find_package(Qt6 REQUIRED COMPONENTS Widgets Core)

# Define the source files
set(SOURCES main.cpp basic.cpp)

# Define the header files
set(HEADERS basic.h)

# Automatically handle the MOC process for Qt classes with Q_OBJECT macro
qt_wrap_cpp(MOC_SOURCES ${HEADERS})

# Create the executable
add_executable(${PROJECT_NAME} ${SOURCES} ${MOC_SOURCES})

# Link to the required Qt libraries
target_link_libraries(${PROJECT_NAME} PRIVATE Qt6::Widgets Qt6::Core)

# Set include directories
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

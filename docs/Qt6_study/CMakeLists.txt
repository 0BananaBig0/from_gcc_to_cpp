cmake_minimum_required(VERSION 3.16)

project(
  Qt6_study
  VERSION 1.0
  LANGUAGES CXX)

# Find required Qt packages
find_package(Qt6 REQUIRED COMPONENTS Widgets Core Gui)

# Define the target name
set(Target Main.exe)
# Define the source files
set(SOURCES Main.cpp ObserveEventsAndSignals.cpp MainWindow.cpp)
# Define the header files
set(HEADERS ObserveEventsAndSignals.h MainWindow.h)

# Automatically handle the MOC process for Qt classes with Q_OBJECT macro
qt_wrap_cpp(MOC_SOURCES ${HEADERS})

# Create the executable
add_executable(${Target} ${SOURCES} ${MOC_SOURCES})

# Link to the required Qt libraries
target_link_libraries(${Target} PRIVATE Qt6::Widgets Qt6::Core Qt6::Gui)

# Set include directories
target_include_directories(${Target} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

cmake_minimum_required(VERSION 3.16)

project(
  Qt6_study
  VERSION 1.0
  LANGUAGES CXX)
# Enable Qt features
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
# Define the compiler
set(CMAKE_CXX_COMPILER "g++")
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Show the full compilation commands
set(CMAKE_VERBOSE_MAKEFILE ON)

# Find required Qt packages
find_package(Qt6 REQUIRED COMPONENTS Widgets Core Gui Quick)

# Define the target name
set(Target Main.exe)
# Define the source files
file(GLOB SOURCES CONFIGURE_DEPENDS *.cpp *.h)
# Define the header files
set(HEADERS ObserveEventsAndSignals.h MainWindow.h Pro.h)

# Automatically handle the MOC process for Qt classes with Q_OBJECT macro
qt_wrap_cpp(MOC_SOURCES ${HEADERS})

# Create the executable
add_executable(${Target} ${SOURCES} ${MOC_SOURCES})

# Link to the required Qt libraries
target_link_libraries(${Target} PRIVATE Qt6::Widgets Qt6::Core Qt6::Gui
                                        Qt6::Quick)

# Set include directories
target_include_directories(${Target} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
# Enable the use of the Q_OBJECT macro in .cpp files
set_target_properties(${Target} PROPERTIES AUTOMOC ON)
# Add marcos
option(PRO "Enable property observation." OFF)
option(BEH "Enable the event transfer feature." OFF)
if(PRO)
  message(STATUS "PROperty observation is enabled")
  add_definitions(-DPRO_OBS)
elseif(BEH)
  message(STATUS "BEH, the event transfer is enabled")
  add_definitions(-DBEH_OBS)
else()
  message(STATUS "WIN is enabled")
  add_definitions(-DMAI_WIN)
endif()

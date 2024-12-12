<!-- vim-markdown-toc GFM -->

- [`g++` Compiler and Linker](#g-compiler-and-linker)
  - [Header File (Preprocess Statement)](#header-file-preprocess-statement)
  - [CPP File](#cpp-file)
  - [OBJ File (Machine Code File, `.obj` in Windows, `.o` in Linux)](#obj-file-machine-code-file-obj-in-windows-o-in-linux)
  - [Linking (Static Linking and Dynamic Linking)](#linking-static-linking-and-dynamic-linking)
    - [Libraries](#libraries)
    - [Static Linking](#static-linking)
      - [Explanation](#explanation)
      - [Characteristics](#characteristics)
      - [How It Works](#how-it-works)
    - [Dynamic Linking (Implicit Linking and Explicit Linking)](#dynamic-linking-implicit-linking-and-explicit-linking)
      - [Explanation](#explanation-1)
      - [Characteristics](#characteristics-1)
      - [Implicit Linking (Load-time Dynamic Linking) (Default Dynamic Linking) (Standard Dynamic Linking)](#implicit-linking-load-time-dynamic-linking-default-dynamic-linking-standard-dynamic-linking)
        - [Explanation](#explanation-2)
        - [Characteristics](#characteristics-2)
        - [How It Works in **Windows**](#how-it-works-in-windows)
        - [How It Works in **Linux**](#how-it-works-in-linux)
      - [Explicit Linking (Run-time Dynamic Linking)](#explicit-linking-run-time-dynamic-linking)
        - [Explanation](#explanation-3)
        - [Characteristics](#characteristics-3)
        - [How It Works in **Windows**](#how-it-works-in-windows-1)
        - [How It Works in **Linux**](#how-it-works-in-linux-1)
- [Differences Between `gcc` and `g++`](#differences-between-gcc-and-g)
  - [Language](#language)
    - [1. `gcc`](#1-gcc)
    - [2. `g++`](#2-g)
  - [Linking](#linking)
    - [1. `gcc`](#1-gcc-1)
    - [2. `g++`](#2-g-1)
  - [Header File Handling](#header-file-handling)
    - [1. `gcc`](#1-gcc-2)
    - [2. `g++`](#2-g-2)
- [How to Compile One CPP File](#how-to-compile-one-cpp-file)
  - [Source files](#source-files)
  - [`g++ Main.cpp`](#g-maincpp)
    - [1. Usage](#1-usage)
    - [2. Output](#2-output)
  - [`g++ Main.cpp -o Main.exe`](#g-maincpp--o-mainexe)
    - [1. Usage](#1-usage-1)
    - [2. Output](#2-output-1)
  - [`g++ -E Main.cpp -o Main.i`](#g--e-maincpp--o-maini)
    - [1. Usage](#1-usage-2)
    - [2. Output](#2-output-2)
  - [`g++ -S Main.i`](#g--s-maini)
    - [1. Usage](#1-usage-3)
    - [2. Output](#2-output-3)
  - [`g++ -S Main.cpp`](#g--s-maincpp)
    - [1. Usage](#1-usage-4)
    - [2. Output](#2-output-4)
  - [`g++ -c Main.s`](#g--c-mains)
    - [1. Usage](#1-usage-5)
    - [2. Output](#2-output-5)
  - [`g++ -c Main.cpp`](#g--c-maincpp)
    - [1. Usage](#1-usage-6)
    - [2. Output](#2-output-6)
  - [`g++ Main.o -o Main.exe`](#g-maino--o-mainexe)
    - [1. Usage](#1-usage-7)
    - [2. Output](#2-output-7)
  - [`g++ -On Main.cpp -o Main.exe`](#g--on-maincpp--o-mainexe)
    - [1. Usage](#1-usage-8)
    - [2. Output](#2-output-8)
  - [`g++ -DMACRO_NAME1 -DMACRO_NAME2 ... Main.cpp -o Main.exe`](#g--dmacro_name1--dmacro_name2--maincpp--o-mainexe)
    - [1. Usage](#1-usage-9)
    - [2. Output](#2-output-9)
- [How to Compile Multiple CPP Files](#how-to-compile-multiple-cpp-files)
  - [Source files](#source-files-1)
  - [Compile all files in one command](#compile-all-files-in-one-command)
    - [1. Code](#1-code)
    - [2. Usage](#2-usage)
    - [3. Output](#3-output)
    - [4. Alternative: If All Files Are in One Folder](#4-alternative-if-all-files-are-in-one-folder)
  - [Compile All Files Separately and Then Link Them Together](#compile-all-files-separately-and-then-link-them-together)
    - [1. Code](#1-code-1)
    - [2. Usage](#2-usage-1)
    - [3. Output](#3-output-1)
- [How to Compile and Link a Library](#how-to-compile-and-link-a-library)
  - [Source files](#source-files-2)
  - [Setup Paths of Header Files](#setup-paths-of-header-files)
    - [1. Code](#1-code-2)
  - [How to Link Multiple Static Libraries](#how-to-link-multiple-static-libraries)
    - [1. Code](#1-code-3)
  - [How to Create a Static Library](#how-to-create-a-static-library)
    - [1. Code](#1-code-4)
    - [2. Usage](#2-usage-2)
    - [3. Output](#3-output-2)
  - [How to Link Multiple Dynamic Libraries](#how-to-link-multiple-dynamic-libraries)
    - [1. Code](#1-code-5)
  - [How to Create a Dynamic Library](#how-to-create-a-dynamic-library)
    - [1. Code](#1-code-6)
    - [2. Usage](#2-usage-3)
    - [3. Output](#3-output-3)
  - [How to Create and Link a Static Library](#how-to-create-and-link-a-static-library)
    - [1. Code](#1-code-7)
    - [2. -Wl,-Bstatic](#2--wl-bstatic)
    - [3. -Wl,-Bdynamic](#3--wl-bdynamic)
    - [4. Situation](#4-situation)
    - [5. Usage](#5-usage)
    - [6. Output](#6-output)
  - [How to Create and Link a Dynamic Library](#how-to-create-and-link-a-dynamic-library)
    - [1. Code](#1-code-8)
    - [2. Situation](#2-situation)
    - [3. Usage](#3-usage)
    - [4. Output](#4-output)
    - [5. Special Notes](#5-special-notes)
- [`g++`, `clang++` and `mscv++`](#g-clang-and-mscv)
  - [Explanation](#explanation-4)
  - [Code Examples](#code-examples)

<!-- vim-markdown-toc -->

## `g++` Compiler and Linker

### Header File (Preprocess Statement)

1. The compiler will **copy and paste them** into the object CPP file.

### CPP File

1. The compiler translates **the CPP files into assembly code** and **then into machine code**
   **without** performing any **linking** operations.
2. Typically, there is **one OBJ file per CPP file**, but **sometimes multiple CPP files may result
   in a single OBJ file**.
3. During the compilation phase, the compiler also optimizes your code.

### OBJ File (Machine Code File, `.obj` in Windows, `.o` in Linux)

1. **All OBJ files** will be **combined into a single file** by the linker.
2. The C++ **linker** can **perform certain optimizations**, although its primary role is focused on
   linking object files and libraries rather than optimizing code.

### Linking (Static Linking and Dynamic Linking)

#### Libraries

1. Static (`.lib` or `.a`) vs dynamic libraries (`.dll` or `.so`):
   - Linking with static libraries is **faster** than dynamic libraries because the C++ linker
     performs optimizations during static linking.
2. Import libraries (`xxxdll.lib` files):
   - These files **contain references to functions and symbols** defined in the `xxx.dll` files,
     facilitating linking at compile time.
   - This process ensures that the correct function signatures and addresses are utilized, allowing
     the linker to ascertain their locations at runtime.
   - Import libraries are **specific to Windows**, while **Linux integrates this functionality
     directly into dynamic libraries**.

#### Static Linking

##### Explanation

1. Static linking refers to the process of combining all necessary library code into the final
   executable **at compile time**.
2. This results in a standalone binary that does **not rely on external libraries at runtime**.

##### Characteristics

1. Self-contained:
   - The executable includes all the library code it needs.
2. No runtime dependencies:
   - Once compiled, it doesn't require the presence of shared libraries on the target system.
3. Larger executable size:
   - The resulting binary is typically larger due to the inclusion of library code.
4. No versioning issues:
   - The code is fixed at compile time, reducing concerns about library version compatibility.

##### How It Works

1. Compilation:
   - The developer compiles the source code and links it against static library files (usually
     `.lib` in windows, `.a` files in linux).
2. Linking:
   - The linker combines the object files with the static library code, resolving all symbol
     references.
3. Executable creation:
   - The final output is a single executable file that includes all necessary code.

#### Dynamic Linking (Implicit Linking and Explicit Linking)

##### Explanation

1. Dynamic linking allows a program to **link to libraries at runtime** rather than at compile time.
2. This can **improve modularity** and **reduce executable size**.

##### Characteristics

1. Reduced executable size:
   - Only references to shared libraries are included, keeping the executable smaller.
2. Shared code:
   - Multiple programs can share the same library code in memory, saving resources.
3. Version flexibility:
   - Libraries can be updated independently of the applications that use them, allowing for easier
     updates and bug fixes.
4. Runtime dependencies:
   - The executable requires the appropriate shared libraries to be present at runtime.

##### Implicit Linking (Load-time Dynamic Linking) (Default Dynamic Linking) (Standard Dynamic Linking)

###### Explanation

1. Implicit linking, also referred to as **load-time dynamic linking** is a form of dynamic linking
   where **required libraries** are **automatically loaded at application startup**.
2. It is **a process** whereby an executable is linked to shared libraries **at compile time**.
3. This method allows the program to **utilize functions and variables** defined in those libraries
   **without incorporating their code directly** into the executable.

###### Characteristics

1. Automatic resolution:
   - The operating system **automatically loads all required shared libraries** **when the
     application starts**, even if they are not used.
2. Simplified development:
   - Developers include the DLL's import library (`.lib` file) in Windows or the shared library
     (`.so` file) in Linux during compilation, simplifying the linking process.
3. Single entry point:
   - The operating system resolves function calls from the shared libraries automatically, allowing
     the application to use them seamlessly.
4. Version dependency:
   - If the required version of a shared library is missing or incompatible, the application may
     fail to start.

###### How It Works in **Windows**

1. Linking with **import libraries**:
   - When compiling the application, the developer links against the DLL's import library, which
     provides necessary metadata for the linker.
2. Creating the executable:
   - The resulting executable contains references to the required DLLs but does not embed their
     code, reducing the executable's size.
3. Loading the DLLs:
   - Upon execution, the Windows loader reads the executable's headers to identify the required DLLs
     and loads them into memory.
4. Resolving symbols:
   - The loader resolves function calls to the appropriate addresses in the loaded DLLs, ensuring
     that the application can access the necessary functions and variables.
5. Execution:
   - Control is then passed to the application's entry point, allowing it to call functions from the
     linked DLLs, enabling shared access to the library's functionality.

###### How It Works in **Linux**

1. Linking with **shared libraries**:
   - When compiling the application, the developer specifies shared libraries using flags (e.g.,
     `-l` for linking) in the compilation command, allowing the linker to record these dependencies
     in the executable.
2. Creating the executable:
   - The resulting executable contains references to the shared libraries but does not include their
     code.
   - This reduces the executable's size and enables shared access to the libraries.
3. Loading the libraries:
   - Upon execution, the dynamic linker/loader (typically ld.so or ld-linux.so) reads the
     executable's metadata to identify the required shared libraries and loads them into memory.
4. Resolving symbols:
   - The linker resolves the function calls and variable references to the appropriate addresses in
     the loaded shared libraries, allowing the executable to use their functionality.
5. Execution:
   - Control is passed to the application's entry point, enabling it to call functions and access
     data from the linked shared libraries.

##### Explicit Linking (Run-time Dynamic Linking)

###### Explanation

1. Explicit linking, also known as **run-time dynamic linking**, is a dynamic linking form where the
   application manually loads libraries during execution.
2. It gives the programmer more control, allowing applications to **dynamically load shared
   libraries** and **access their functions** during execution, rather than linking them at compile
   time.
3. The programmers will **use some specific functions to manage the dynamic linking explicitly**.

###### Characteristics

1. Dynamic control:
   - Developers can load libraries based on runtime conditions, providing flexibility.
2. Lazy loading:
   - Libraries can be loaded only when needed, which can improve startup performance.
3. Error handling:
   - Applications can handle scenarios where a library fails to load or is not found.

###### How It Works in **Windows**

1. Load the DLL:
   - Use `LoadLibrary( "library.dll" )` to load the desired DLL into the process's address space.
2. Get function pointers:
   - Use `GetProcAddress( handle, "function_name" )` to obtain pointers to the functions within the
     loaded DLL.
3. Use the functions:
   - Call the functions using the retrieved pointers.
4. Unload the DLL:
   - Optionally, use `FreeLibrary( handle )` to unload the DLL when it’s no longer needed.

###### How It Works in **Linux**

1. Load the library:
   - Use `dlopen( "library.so", RTLD_LAZY )` to load the desired shared library into the process's
     address space.
2. Get function pointers:
   - Use `dlsym( handle, "function_name" )` to obtain pointers to the functions within the loaded
     library.
3. Use the functions:
   - Call the functions using the retrieved pointers.
4. Unload the library:
   - Optionally, use `dlclose( handle )` to unload the library when it’s no longer needed.

## Differences Between `gcc` and `g++`

### Language

#### 1. `gcc`

1. Primarily the GNU C Compiler, but it can also compile C++ files if passed the appropriate flags.
2. It defaults to treating source files as C code unless you specify C++.

#### 2. `g++`

1. A specialized driver for C++ compilation.
2. It automatically links the C++ standard library and handles C++-specific extensions.

### Linking

#### 1. `gcc`

1. When compiling C++ files with `gcc`, you must manually link the C++ standard library (e.g.,
   -lstdc++).

#### 2. `g++`

1. Automatically links the C++ standard library without needing extra flags.

### Header File Handling

#### 1. `gcc`

1. When used with C, `gcc` processes headers as C-specific (using `.h` headers for the most part).

#### 2. `g++`

1. Treats headers as C++ files and supports C++ header files (like `<iostream>` instead of
   `<stdio.h>`).

## How to Compile One CPP File

### Source files

1. Main.cpp

### `g++ Main.cpp`

#### 1. Usage

1. Preprocess, compile, and link Main.cpp to generate the executable file a.out.

#### 2. Output

1. a.out

### `g++ Main.cpp -o Main.exe`

#### 1. Usage

1. Preprocess, compile, and link Main.cpp to generate an executable file.
2. The option `-o` specifies the name of the executable file.

#### 2. Output

1. Main.exe

### `g++ -E Main.cpp -o Main.i`

#### 1. Usage

1. Preprocess Main.cpp to generate a preprocessed file.
2. The option `-o` specifies the name of the preprocessed file.

#### 2. Output

1. Main.i

### `g++ -S Main.i`

#### 1. Usage

1. Compile the preprocessed file to generate an assembly file.

#### 2. Output

1. Main.s

### `g++ -S Main.cpp`

#### 1. Usage

1. Preprocess and compile the source file to generate an assembly file.

#### 2. Output

1. Main.s

### `g++ -c Main.s`

#### 1. Usage

1. Translate the assembly file into an object file.

#### 2. Output

1. Main.o

### `g++ -c Main.cpp`

#### 1. Usage

1. Preprocess and compile the source file to generate an object file.

#### 2. Output

1. Main.o

### `g++ Main.o -o Main.exe`

#### 1. Usage

1. Link the object file to generate an executable file.

#### 2. Output

1. Main.exe

### `g++ -On Main.cpp -o Main.exe`

#### 1. Usage

1. Compile Main.cpp with optimization level `n` (where `0 ≤ n ≤ 3`). Higher values of `n` result in
   longer compile times and more aggressive optimizations.
2. Compiler optimization levels adjust the types of optimizations applied during compilation to
   balance speed, size, and behavior.
3. **No optimization (`-O0`)**:
   - Keeps debugging information intact, with no optimizations.
   - Best for development and debugging.
4. **Basic optimization (`-O1`)**:
   - Minor optimizations like dead code elimination improve speed slightly.
   - Suitable for builds needing small improvements without large compile times.
5. **Moderate optimization (`-O2`)**:
   - Balances speed and code size with optimizations like loop unrolling and better register usage.
   - Ideal for production builds.
6. **Aggressive optimization (`-O3`)**:
   - Adds further optimizations like vectorization, yielding higher speed but potentially increasing
     code size and instability.
   - Best for performance-critical applications, though requires careful testing.
7. **Optimize for size (`-Os`)**:
   - Prioritizes a smaller binary, omitting some space-costly optimizations.
   - Useful for memory-constrained environments.
8. **Fastest optimization (`-Ofast`)**:
   - Maximizes speed with non-standard optimizations, such as unsafe math operations, reducing
     standard compliance.
   - Suitable for performance-critical applications that can relax stability or portability
     requirements.
9. Generally, `-O2` and `-Os` are widely used for balanced builds, while `-O3` and `-Ofast` cater to
   performance-intensive needs where behavior can be less predictable.

#### 2. Output

1. Main.exe

### `g++ -DMACRO_NAME1 -DMACRO_NAME2 ... Main.cpp -o Main.exe`

#### 1. Usage

1. Define a series of `MACRO` for `Main.cpp`.
2. Used to select which parts of the code should be compiled.

#### 2. Output

1. Main.exe

## How to Compile Multiple CPP Files

### Source files

1. Main.cpp
2. Fun.cpp

### Compile all files in one command

#### 1. Code

```sh
g++ Main.cpp Fun.cpp -o Main.exe
```

#### 2. Usage

1. Compile Main.cpp and Fun.cpp into Main.o and Fun.o separately.
2. Link them to generate an executable file.

#### 3. Output

1. Main.o
2. Fun.o
3. Main.exe

#### 4. Alternative: If All Files Are in One Folder

```sh
g++ *.cpp -o Main.exe
```

### Compile All Files Separately and Then Link Them Together

#### 1. Code

```sh
g++ -c Main.cpp
g++ -c Fun.cpp
g++ -o Main.o Fun.o -o Main.exe
```

#### 2. Usage

1. Compile Main.cpp and Fun.cpp into Main.o and Fun.o with separate commands.
2. Link them to generate an executable file.

#### 3. Output

1. Main.o
2. Fun.o
3. Main.exe

## How to Compile and Link a Library

### Source files

1. Main.cpp
2. Fun.cpp

### Setup Paths of Header Files

#### 1. Code

```sh
g++ Main.cpp Fun.cpp -o Main.exe -I/the/first/path/of/header/files \
    -I/the/second/path/of/header/files ...;
```

### How to Link Multiple Static Libraries

#### 1. Code

```sh
g++ Main.cpp -L/the/first/path/of/static/libraries \
    -L/the/second/path/of/static/libraries ... \
    -Wl,-Bstatic -lxxx -lyyy ... -Wl,-Bdynamic -o Main.exe
```

### How to Create a Static Library

#### 1. Code

```sh
g++ -c Fun.cpp
ar rcs libFun.a Fun.o
g++ Main.cpp -L. -lFun -o Main.exe
```

#### 2. Usage

1. Use `g++` to compile Fun.cpp into an object file.
2. Use `ar` to create a static library from the object file.
3. Compile Main.cpp and link it with libFun.a to generate an executable file.

#### 3. Output

1. Fun.o
2. libFun.a
3. Main.exe

### How to Link Multiple Dynamic Libraries

#### 1. Code

```sh
g++ Main.cpp -L/the/first/path/of/dynamic/libraries -L/the/second/path/of/dynamic/libraries ... \
    -lxxx -lyyy ... -o Main.exe
```

### How to Create a Dynamic Library

#### 1. Code

```sh
g++ -c -fPIC Fun.cpp -o Fun.o
g++ -shared -o libFun.so Fun.o
g++ Main.cpp -L. -lFun -o Main.exe
```

#### 2. Usage

1. Use `g++ -c -fPIC` to compile Fun.cpp into an object file.
2. Use `g++ -shared` to create a dynamic library from the object file.
3. Compile Main.cpp and link it with libFun.so to generate an executable file.

#### 3. Output

1. Fun.o
2. libFun.so
3. Main.exe

### How to Create and Link a Static Library

#### 1. Code

```sh
g++ -c Fun.cpp
ar rcs libFun.a Fun.o
g++ Main.cpp -L. -Wl,-Bstatic -lFun -Wl,-Bdynamic -o Main.exe
```

#### 2. -Wl,-Bstatic

1. Instructs the linker (`ld`) to search for static libraries (`.a` files).

#### 3. -Wl,-Bdynamic

1. Reverts the linker back to dynamic libraries, in case you are linking other dynamic libraries
   afterward.

#### 4. Situation

1. A static library has the same name as a dynamic library in the same folder.

#### 5. Usage

1. Create both a static library and a dynamic library. They have the same name. Link the static
   library explicitly.

#### 6. Output

1. Fun.o
2. libFun.a
3. libFun.so
4. Main.exe

### How to Create and Link a Dynamic Library

#### 1. Code

```sh
g++ -c Fun.cpp
g++ -c -fPIC Fun.cpp -o Fun.o
g++ -shared -o libFun.so Fun.o
g++ Main.cpp -L. -lFun -o Main.exe
```

#### 2. Situation

1. A dynamic library has the same name as a static library in the same folder.

#### 3. Usage

1. Create both a static library and a dynamic library.
2. They have the same name.
3. Link the dynamic library explicitly.

#### 4. Output

1. Fun.o
2. libFun.a
3. libFun.so
4. Main.exe

#### 5. Special Notes

1. `g++` links a dynamic library by default.

## `g++`, `clang++` and `mscv++`

### Explanation

1. There are various compilers available. Which compiler is the best? The choice of compiler depends
   on the library and system being used. Most libraries are optimized for specific compilers. Even
   when libraries serve the same purpose, their implementations are often tailored to a particular
   compiler.
2. For example, `libstdc++` and `libc++` are both implementations of the C++ Standard Template
   Library (STL). However, when `clang++` is used with `libstdc++` to compile, the execution
   performance can be very slow. In contrast, using `libc++` with `clang++` often results in
   significantly faster execution. An example code snippet is shown below.
3. Additionally, different systems configure different default libraries. For instance, Linux
   systems typically configure `libstdc++` as the default library, whereas Apple systems set
   `libc++` as the default. Modifying these default settings can be complex and may lead to errors.
4. Therefore, when choosing a compiler, first check which system you are using. Then, if possible,
   verify the library requirements for your project.
5. Tips:
   - Linux - `g++`
   - Macos - `clang++`
   - Win - `mscv++`

### Code Examples

```CPP
#include <iostream>
#include <random>
using namespace std;
mt19937::result_type seed = 0;
mt19937 gen( seed );
uniform_real_distribution< double > distr( 0, 1 );

int main() {
   double s = 0;
   for( auto i = 1; i <= 100000000; ++i ) {
      s += distr( gen );
   }
   std::cout << s;
   return 0;
}
```

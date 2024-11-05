<!-- vim-markdown-toc GFM -->

- [Some Small Knowledge](#some-small-knowledge)
- [Type Puning](#type-puning)
  - [Explanation](#explanation)
  - [Common Methods of Type Punning](#common-methods-of-type-punning)
    - [Using Unions](#using-unions)
    - [Using Casting](#using-casting)
    - [Using `std::variant`](#using-stdvariant)
    - [Using `std::any`](#using-stdany)
- [The Usage of Automatic Scope-based Destruction](#the-usage-of-automatic-scope-based-destruction)
- [How to Return Multiple Values](#how-to-return-multiple-values)
- [Breakpoints](#breakpoints)
- [Precompiled Headers (PCH)](#precompiled-headers-pch)
- [How to Measure How Many Memory Allocations Ocur or Track Memory Allocations](#how-to-measure-how-many-memory-allocations-ocur-or-track-memory-allocations)
- [Benchmark and How to Visualize Benchmark Results](#benchmark-and-how-to-visualize-benchmark-results)
- [Singleton](#singleton)
- [Continuous Integration (CI) in C++](#continuous-integration-ci-in-c)
  - [Explanation](#explanation-1)
  - [Why CI is important for C++](#why-ci-is-important-for-c)
  - [CI Workflow for C++](#ci-workflow-for-c)
  - [Tools for CI in C++](#tools-for-ci-in-c)
    - [CI Platforms](#ci-platforms)
    - [Build Tools](#build-tools)
    - [Code Quality and Static Analysis Tools](#code-quality-and-static-analysis-tools)
    - [Best Practices for C++ CI](#best-practices-for-c-ci)
    - [**What We Can Do in Our Project**](#what-we-can-do-in-our-project)

<!-- vim-markdown-toc -->

## Some Small Knowledge

1. The **performance** of `<` is better than `<=`.
2. `std::endl` is a little **slower** than `"\n"` in **debug mode**. Otherwise, `std::endl` is
   **faster**.
3. **Function argument evaluation order** is **undefined** in C++. Differenct compilers with
   different flags have different evaluation orders, until C++17, an uncomplete definiton of the
   function argument evaluation order comes.
4. **All variables, objects, references, and pointers** should be **initialized explicitly and
   immediately** after they are declared or created. This can avoid many unpredictable issues

## Type Puning

### Explanation

1. It is a programming technique used to **treat a data type as** if it were **a different data
   type**, usually without explicit type conversion.
2. This often involves **using pointers, unions, or other low-level mechanisms** to **reinterpret
   the bits of a value as a different type**.
3. It is often **recommended to avoid type punning** unless absolutely necessary, and **to use safer
   alternatives** like: standard conversions, `std::bit_cast` and serialization.
4. It can **achieve specific goals** like **low-level optimization**, treating a struct or a class
   as an array, treating `Type1` memory as `Type2` memory at the same memory address or interfacing
   with hardware.
5. However, developers must be aware of the **risks**, including **undefined behavior** and
   **portability issues**, and **use safer alternatives whenever possible**.

### Common Methods of Type Punning

#### Using Unions

```CPP
struct Vector2 {
      float x, y;
};

struct Vector4 {
      union {
            struct {
                  float x, y, z, w;
            };

            struct {
                  Vector2 a, b;
            };
      };
};
```

```CPP
struct Vector3 {
      union {
            struct {
                  float x, y, z;
            };

            struct {
                  float r, g, b;
            };
      };
};
```

#### Using Casting

1. [Conversion And Casting](./ConversionAndCasting.md#stdvariant-multiple-types-of-data-in-single-variable)

#### Using `std::variant`

1. [`std::variant`](./UnionStdAnyStdVariantStdOptional.md)

#### Using `std::any`

1. [`std:any`](./UnionStdAnyStdVariantStdOptional.md#stdany)

## The Usage of Automatic Scope-based Destruction

1. **Smart pointers or scope pointers**:
   - Create an object on the heap, and automatically destroy it without using delete when it goes
     out of scope or when certain conditions are met.
   - A smart pointer is a wrapper around a real raw pointer.
2. **Timer**:
   - Measure the execution time of a scope, print the result, and automatically destroy the timer
     object when it goes out of scope.
3. **Lock**:
   - Lock a function so that **multiple threads cannot access it simultaneously**, and
     **automatically unlock** it at the end of the function.

## How to Return Multiple Values

1. A structure: **Recommend**, know the information about the internal variables or objects of the
   structure.
2. Multiple references.
3. Multiple pointers.
4. An array.
5. A `std::array`: **Faster** than a `std::vector` because it can be stored on the stack, while the
   `std::vector` is stored on the heap.
6. A `std::vector`:
7. A `std::tuple`, `std::make_pair` and `std::get`: **Not recommend**, can't know the information
   about the internal variables or objects of the `std::tuple`, like their names.
8. A `std::pair`, `std::make_pair`: **Not recommend**, can't know the information about the internal
   variables or objects of the `std::pair`, like their names.

## Breakpoints

1. Normal breakpoints:
   - A normal breakpoint is a point in the code where the execution will pause when the debugger
     reaches it.
   - This allows you to inspect the current state of the program, including variable values, the
     call stack, and other context.
2. **Conditional** breakpoints:
   - A conditional breakpoint is similar to a normal breakpoint but includes a condition that must
     be met for the breakpoint to trigger.
   - This allows you to pause execution only when certain criteria are satisfied.
3. **Action** breakpoints:
   - An action breakpoint (sometimes called a "tracepoint" or "logging breakpoint") allows you to
     **specify actions that occur when the breakpoint is hit**, **without necessarily pausing the
     execution of the program**.
   - This can include **logging messages** or **modifying variables**.

## Precompiled Headers (PCH)

1. Precompiled headers (PCH) are a feature designed to accelerate the compilation process,
   particularly in **large projects**.
2. By **precompiling frequently used header files**, PCHs eliminate the need to recompile these
   files every time a source file is processed.
3. While precompiled headers can significantly reduce compilation times, they require careful setup
   and management to be effective.
4. It's vitally used for code that isn't yours, for example, STL library and OpenCL library.
5. However, it may make your code harder to read.

## How to Measure How Many Memory Allocations Ocur or Track Memory Allocations

1. Overload the new operator to print some information:
   ```CPP
   void* operator new( size_t size ) {
      // Do something
      return malloc( size );
   }
   ```

## Benchmark and How to Visualize Benchmark Results

1. There is **no universally accepted method for measuring performance**.
2. Different techniques have their own drawbacks, resulting in **less than 100% accurate** outcomes.
3. Cheron, a game developer, utilizes `std::chrono` to **implement a scoped timer** for assessing
   the performance of their game engine.
4. Use macros to wrap our print functions and timer objcets so that we can determine whether we
   should compile them.
5. Use `__FUNCTION__` or `__FUNSIG__` instead of using a string to print a function name.
6. Visualization Method One:
   - Store all result into a txt file.
   - Use perl to extract all data from the txt files and store them into a excel file.
   - Use Excel to visualize all data.
7. Visualization Method Two:
   - Store all data into a json file in the format that the tracing tool expects.
   - Open your chrome kernel browser.
   - Type `chrome://tracing or edge://tracing or ...` depending on your which browser you use into
     the URL line of the browser and press the enter key to open the tracing tool.
   - Drop the json file into the tracing tool or use the tracing tool to load the json file. V
   - Visulaize data and the relationship among different functions like on a stack.

## Singleton

1. It's a strategy used to organize a bunch of global variables and static functions in C++.
2. To **avoid copying the signleton**, **adding the delete keyword to the copy constructor**.
3. We can use **multiple `static` functions** to **return a non-static member by calling a
   non-static function**.
4. Because these functions are simple enough, the inline operation will expand them and **no
   performance** is **wasted**.
5. Also, **initializing the singleton in a static function** which **returns this signleton** can
   make our code cleaner.
6. It exists until the application is closed.
7. Using `namespace` instead of a `class` or a structure to implement the singleton is also ok.

## Continuous Integration (CI) in C++

### Explanation

1. Continuous Integration (CI) is **a software development practice** that **ensures code changes**
   are **integrated frequently**, with **each integration verified** through **automated builds and
   tests**.
2. In C++ projects, CI helps **maintain code quality** and **detect issues early** by **automating
   compilation, linking, and testing** **across** multiple **platforms** and environments.

### Why CI is important for C++

1. **Frequent integration**:
   - Ensures new code integrates seamlessly with the existing codebase, preventing compatibility and
     integration issues.
2. **Early bug detection**:
   - **Automated tests** detect issues early in the development cycle.
3. **Multi-platform support**:
   - C++ applications often target multiple platforms (e.g., Windows, Linux, macOS), and CI ensures
     builds succeed across all.
4. **Performance testing**:
   - CI can run benchmarks to track performance regressions.
5. **Consistency**:
   - Enforces coding standards and ensures dependencies are properly managed.

### CI Workflow for C++

1. **Code changes**:
   - Developers push changes to a repository (e.g., GitHub, GitLab).
2. **CI pipeline trigger**:
   - Each commit triggers the CI pipeline.
3. **Build**:
   - The code is compiled and linked for different target platforms.
4. **Testing**:
   - Automated unit tests, integration tests, and performance tests run.
5. **Code quality** checks:
   - Tools like clang-tidy and cppcheck ensure the code follows best practices.
6. **Deployment (Optional)**:
   - The CI system can deploy artifacts if required.
7. **Reporting**:
   - Results are reported back to developers, and any issues are highlighted for resolution.

### Tools for CI in C++

#### CI Platforms

1. GitHub actions.
2. GitLab CI/CD.
3. Jenkins: Provides custom pipelines using Groovy. Suitable for complex CI needs and large
   projects.

#### Build Tools

1. CMake: A cross-platform tool to manage the build process.
2. Make: Automates the compilation and linking process using a Makefile.

#### Code Quality and Static Analysis Tools

1. clang-tidy: Checks code style and detects potential bugs.
   - It's **a static analysis tool** that helps you analyze your code to find some issues that
     compiler can't detect, for example inifinite loops, name style and some undefined behaviors.
   - It requires a `compile_commands.json` file compilation options.
   - Therefore, if there is no `compile_commands.json` in your project, it may not function.
   - If you want to disable clang-tidy check for some code, you can know more about `NOLINT`,
     `NOLINTNEXTLINE`, and `NOLINTBEGIN` … `NOLINTEND` comments.
   - `Gcc/G++` also provides static analysis. However, few tools use it to detect code when
     programmers are writing code. It's only used during compiling code.
   - In addition, there are other static analysis tools, for example, `cppcheck`, `coverit` and
     `PVS studio`. We can ask chatgpt to know more about their difference.
2. Valgrind: **Detects memory leaks and profiling issues**

#### Best Practices for C++ CI

1. Use CMake for cross-platform builds:
   - Ensure the project builds across all targeted operating systems.
2. Run static analysis as part of the pipeline:
   - Identify code quality issues early.
3. Parallel testing:
   - Use tools like GoogleTest and catch2 to run unit tests efficiently.
4. Dockerize builds:
   - For consistent build environments, use Docker images with all dependencies pre-installed.
5. Monitor performance metrics:
   - Integrate performance benchmarks into the pipeline to detect regressions.

#### **What We Can Do in Our Project**

1. Write some perl scripts to extract data.
2. Write some make/cmake scripts to build your project.
3. Write some shell scripts to test your project.
4. Write some shell scripts to manage your project and execute these scripts you write on previous
   three steps.
5. Use some tools to visualize these steps, for example, Jenkins. (**Optional**)

<!-- vim-markdown-toc GFM -->

- [Some Small Knowledge](#some-small-knowledge)
- [Common Compiler Optimization Techniques](#common-compiler-optimization-techniques)
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
- [RAII (Resource Acquisition Is Initialization)](#raii-resource-acquisition-is-initialization)
  - [Explanation](#explanation-2)
  - [Usage](#usage)
  - [Advantages](#advantages)
  - [Disadvantages](#disadvantages)
- [How to Process Unused Variables](#how-to-process-unused-variables)
  - [Attribute `[[maybe_unused]]` (C++17)](#attribute-maybe_unused-c17)
  - [Syntax](#syntax)
- [What Causes Undefined Behavior (UB)](#what-causes-undefined-behavior-ub)

<!-- vim-markdown-toc -->

## Some Small Knowledge

1. The **performance** of `<` is better than `<=`.
2. **Function argument evaluation order** is **undefined** in C++. Differenct
   compilers with different flags have different evaluation orders, until C++17,
   an uncomplete definiton of the function argument evaluation order comes.
3. **All variables, objects, references, and pointers** should be **initialized
   explicitly and immediately** after they are declared or created. This can
   avoid many unpredictable issues
4. **Float:** Be very careful. Both `float` and `double` type variables **have
   precision limitations**. You should **never use `==` or `!=` to compare
   them** with any number, except for both of them are initialized with literal
   values or constants. Instead, you should try to **convert the comparison into
   `>=` or `<=` forms**. **Rounding errors** make floating point comparisons
   tricky. Performing mathematical operations on these values will cause the
   rounding errors to grow larger.

   ```CPP
   // Our own constexpr implementation of std::abs (for use in C++14/17/20)
   // In C++23, use std::abs
   // constAbs() can be called like a normal function, but can handle different
   // types of values (e.g. int, double, etc...)
   template< typename T > constexpr T constAbs( T x ) {
      return ( x < 0 ? -x : x );
   }

   // Return true if the difference between a and b is within epsilon percent of
   // the larger of a and b
   constexpr bool approximatelyEqualRel( double a, double b, double relEpsilon ) {
      return ( constAbs( a - b )
               <= ( std::max( constAbs( a ), constAbs( b ) ) * relEpsilon ) );
   }

   // Return true if the difference between a and b is less than or equal to
   // absEpsilon, or within relEpsilon percent of the larger of a and b
   constexpr bool approximatelyEqualAbsRel( double a,
                                            double b,
                                            double absEpsilon,
                                            double relEpsilon ) {
      // Check if the numbers are really close -- needed when comparing numbers
      // near zero.
      if( constAbs( a - b ) <= absEpsilon )
         return true;

      // Otherwise fall back to Knuth's algorithm
      return approximatelyEqualRel( a, b, relEpsilon );
   }
   ```

5. You might assume that types that use less memory would be faster than types
   that use more memory. This is not always true. **CPUs are often optimized to
   process data of a certain size (e.g. 32 bits)**, and **types that match that
   size may be processed quicker**. On such a machine, a 32-bit int could be
   faster than a 16-bit short or an 8-bit char.
6. Using unsigned integers is not recommended because their wrap-around action
   can result in numerous bugs (but sometimes, have to). Favor signed numbers
   over unsigned numbers for holding quantities (even quantities that should be
   non-negative) and mathematical operations. Avoid mixing signed and unsigned
   numbers.
7. Some compilers limit the largest creatable object to half the maximum value
   of `std::size_t` (an explanation for this can be found
   [here](https://stackoverflow.com/questions/42428003/largest-possible-object-on-size-t-explanations/42428240#42428240)).
8. The C++ standard only defines the minimum size of integral types but does not
   specify their exact sizes. Furthermore, the standard does not define any size
   requirements for `float`, `double`, and `long double`. As a result, different
   compilers and systems implement these types with varying sizes. However, most
   compilers and systems follow the IEEE 754 floating-point standard, so the
   size of `float` is typically 32 bits, and `double` is 64 bits. It is
   advisable to avoid using `long double` because its size varies significantly
   across systems.
9. Always make sure the type of your literals match the type of the variables
   they’re being assigned to or used to initialize. Otherwise an unnecessary
   conversion will result, possibly with a loss of precision.
10. Favor `double` over `float` unless space is at a premium, as the lack of
    precision in a float will often lead to inaccuracies.
11. C++ does not define the order of evaluation for function arguments or the
    operands of operators.
12. The C++ standard says that C++ compilers should support 256 levels of
    nesting -- however not all do (e.g. as of the time of writing, Visual Studio
    supports fewer).

## Common Compiler Optimization Techniques

0. Compilers optimize code for performance, but the specific optimization
   techniques applied may vary depending on the implementation, system, and
   configuration.
1. Constant folding and constant propagation. (`constexpr` enforces this
   optimization at compile time.)
2. Dead code elimination.

## Type Puning

### Explanation

1. It is a programming technique used to **treat a data type as** if it were **a
   different data type**, usually without explicit type conversion.
2. This often involves **using pointers, unions, or other low-level mechanisms**
   to **reinterpret the bits of a value as a different type**.
3. It is often **recommended to avoid type punning** unless absolutely
   necessary, and **to use safer alternatives** like: standard conversions,
   `std::bit_cast` and serialization.
4. It can **achieve specific goals** like **low-level optimization**, treating a
   struct or a class as an array, treating `Type1` memory as `Type2` memory at
   the same memory address or interfacing with hardware.
5. However, developers must be aware of the **risks**, including **undefined
   behavior** and **portability issues**, and **use safer alternatives whenever
   possible**.

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
   - Create an object on the heap, and automatically destroy it without using
     delete when it goes out of scope or when certain conditions are met.
   - A smart pointer is a wrapper around a real raw pointer.
2. **Timer**:
   - Measure the execution time of a scope, print the result, and automatically
     destroy the timer object when it goes out of scope.
3. **Lock**:
   - Lock a function so that **multiple threads cannot access it
     simultaneously**, and **automatically unlock** it at the end of the
     function.

## How to Return Multiple Values

1. A structure: **Recommend**, know the information about the internal variables
   or objects of the structure.
2. Multiple references.
3. Multiple pointers.
4. An array.
5. A `std::array`: **Faster** than a `std::vector` because it can be stored on
   the stack, while the `std::vector` is stored on the heap.
6. A `std::vector`:
7. A `std::tuple`, `std::make_pair` and `std::get`: **Not recommend**, can't
   know the information about the internal variables or objects of the
   `std::tuple`, like their names.
8. A `std::pair`, `std::make_pair`: **Not recommend**, can't know the
   information about the internal variables or objects of the `std::pair`, like
   their names.

## Breakpoints

1. Normal breakpoints:
   - A normal breakpoint is a point in the code where the execution will pause
     when the debugger reaches it.
   - This allows you to inspect the current state of the program, including
     variable values, the call stack, and other context.
2. **Conditional** breakpoints:
   - A conditional breakpoint is similar to a normal breakpoint but includes a
     condition that must be met for the breakpoint to trigger.
   - This allows you to pause execution only when certain criteria are
     satisfied.
3. **Action** breakpoints:
   - An action breakpoint (sometimes called a "tracepoint" or "logging
     breakpoint") allows you to **specify actions that occur when the breakpoint
     is hit**, **without necessarily pausing the execution of the program**.
   - This can include **logging messages** or **modifying variables**.

## Precompiled Headers (PCH)

1. Precompiled headers (PCH) are a feature designed to accelerate the
   compilation process, particularly in **large projects**.
2. By **precompiling frequently used header files**, PCHs eliminate the need to
   recompile these files every time a source file is processed.
3. While precompiled headers can significantly reduce compilation times, they
   require careful setup and management to be effective.
4. It's vitally used for code that isn't yours, for example, STL library and
   OpenCL library.
5. However, it may make your code harder to read.

## How to Measure How Many Memory Allocations Ocur or Track Memory Allocations

1. Overload the new operator to print some information:
   ```CPP
   void* operator new( size_t size ) {
      // Do something
      return malloc( size );
   };
   ```

## Benchmark and How to Visualize Benchmark Results

1. There is **no universally accepted method for measuring performance**.
2. Different techniques have their own drawbacks, resulting in **less than 100%
   accurate** outcomes.
3. Cheron, a game developer, utilizes `std::chrono` to **implement a scoped
   timer** for assessing the performance of their game engine.
4. Use macros to wrap our print functions and timer objcets so that we can
   determine whether we should compile them.
5. Use `__FUNCTION__` or `__FUNSIG__` instead of using a string to print a
   function name.
6. Visualization Method One:
   - Store all result into a txt file.
   - Use perl to extract all data from the txt files and store them into a excel
     file.
   - Use Excel to visualize all data.
7. Visualization Method Two:
   - Store all data into a json file in the format that the tracing tool
     expects.
   - Open your chrome kernel browser.
   - Type `chrome://tracing or edge://tracing or ...` depending on your which
     browser you use into the URL line of the browser and press the enter key to
     open the tracing tool.
   - Drop the json file into the tracing tool or use the tracing tool to load
     the json file. V
   - Visulaize data and the relationship among different functions like on a
     stack.

## Singleton

1. It's a strategy used to organize a bunch of global variables and static
   functions in C++.
2. To **avoid copying the signleton**, **adding the delete keyword to the copy
   constructor**.
3. We can use **multiple `static` functions** to **return a non-static member by
   calling a non-static function**.
4. Because these functions are simple enough, the inline operation will expand
   them and **no performance** is **wasted**.
5. Also, **initializing the singleton in a static function** which **returns
   this signleton** can make our code cleaner.
6. It exists until the application is closed.
7. Using `namespace` instead of a `class` or a structure to implement the
   singleton is also ok.

## Continuous Integration (CI) in C++

### Explanation

1. Continuous Integration (CI) is **a software development practice** that
   **ensures code changes** are **integrated frequently**, with **each
   integration verified** through **automated builds and tests**.
2. In C++ projects, CI helps **maintain code quality** and **detect issues
   early** by **automating compilation, linking, and testing** **across**
   multiple **platforms** and environments.

### Why CI is important for C++

1. **Frequent integration**:
   - Ensures new code integrates seamlessly with the existing codebase,
     preventing compatibility and integration issues.
2. **Early bug detection**:
   - **Automated tests** detect issues early in the development cycle.
3. **Multi-platform support**:
   - C++ applications often target multiple platforms (e.g., Windows, Linux,
     macOS), and CI ensures builds succeed across all.
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
   - Results are reported back to developers, and any issues are highlighted for
     resolution.

### Tools for CI in C++

#### CI Platforms

1. GitHub actions.
2. GitLab CI/CD.
3. Jenkins: Provides custom pipelines using Groovy. Suitable for complex CI
   needs and large projects.

#### Build Tools

1. CMake: A cross-platform tool to manage the build process.
2. Make: Automates the compilation and linking process using a Makefile.

#### Code Quality and Static Analysis Tools

1. clang-tidy: Checks code style and detects potential bugs.
   - It's **a static analysis tool** that helps you analyze your code to find
     some issues that compiler can't detect, for example inifinite loops, name
     style and some undefined behaviors.
   - It requires a `compile_commands.json` file compilation options.
   - Therefore, if there is no `compile_commands.json` in your project, it may
     not function.
   - If you want to disable clang-tidy check for some code, you can know more
     about `NOLINT`, `NOLINTNEXTLINE`, and `NOLINTBEGIN` … `NOLINTEND` comments.
   - `Gcc/G++` also provides static analysis. However, few tools use it to
     detect code when programmers are writing code. It's only used during
     compiling code.
   - In addition, there are other static analysis tools, for example,
     `cppcheck`, `coverit` and `PVS studio`. We can ask chatgpt to know more
     about their difference.
2. Valgrind: **Detects memory leaks and profiling issues**

#### Best Practices for C++ CI

1. Use CMake for cross-platform builds:
   - Ensure the project builds across all targeted operating systems.
2. Run static analysis as part of the pipeline:
   - Identify code quality issues early.
3. Parallel testing:
   - Use tools like GoogleTest and catch2 to run unit tests efficiently.
4. Dockerize builds:
   - For consistent build environments, use Docker images with all dependencies
     pre-installed.
5. Monitor performance metrics:
   - Integrate performance benchmarks into the pipeline to detect regressions.

#### **What We Can Do in Our Project**

1. Write some perl scripts to extract data.
2. Write some make/cmake scripts to build your project.
3. Write some shell scripts to test your project.
4. Write some shell scripts to manage your project and execute these scripts you
   write on previous three steps.
5. Or write a `test` rule in `Makefile` to manage your project and execute these
   scripts you write on previous three steps
6. Use some tools to visualize these steps, for example, Jenkins. (**Optional**)

## RAII (Resource Acquisition Is Initialization)

### Explanation

1. RAII **ties resource management (acquisition and release) to object
   lifetime**.
2. Resources are acquired during object construction and automatically released
   during destruction.
3. Guarantees resource cleanup even in the face of exceptions or complex control
   flows.

### Usage

1. Dynamic memory
   - Managed via smart pointers like `std::unique_ptr` or `std::shared_ptr`.
2. File handles:
   - Managed by RAII-style classes to open and close files automatically.
3. Mutex locks:
   - Managed with objects like `std::lock_guard` to handle locking and
     unlocking.
4. Network connections:
   - Managed through RAII for automatic connection and disconnection.
5. Resource pooling:
   - Ensures proper acquisition and release of resources like database
     connections.

### Advantages

1. Automatic resource management:
   - Reduces risk of resource leaks by ensuring cleanup.
2. Exception safety:
   - Ensures resources are released even if an exception is thrown.
3. Simplified code:
   - Minimizes explicit resource management code.
4. Fewer bugs:
   - Helps avoid common issues like dangling pointers and memory leaks.
5. Scoped resource control:
   - Clearly defines the scope and duration of resource usage.

### Disadvantages

1. Limited flexibility:
   - Resource lifetime is tied to object lifetime, which may not always align
     with program requirements.
2. Complexity in destruction:
   - Destructors may become complex if managing multiple resources.
3. Increased memory usage:
   - Smart pointers introduce slight memory and performance overhead.
4. Potential for overhead:
   - RAII can add overhead, especially with frequent acquisition/release.
5. Not suitable for non-scope-based resources:
   - Less effective for resources not naturally scoped to an object’s lifetime
     (e.g., global or shared resources).

## How to Process Unused Variables

### Attribute `[[maybe_unused]]` (C++17)

1. The attribute `[[maybe_unused]]` allows the compiler to ignore unused
   variables, even when the `-Werror=unused-variable` argument is enabled.
2. Once a variable is declared as `[[maybe_unused]]`, the compiler will **not
   generate any warnings or errors related to it**.
3. Additionally, the compiler will **likely optimize these variables** out of
   the program, so they have no performance impact.
4. This attribute is useful when importing, copying, or pasting data that
   includes unused variables.
5. Besides, if a variable is currently unused but may be used in the future,
   this attribute can be applied.

### Syntax

```CPP
[[maybe_unused]] Type var_name{};
```

## What Causes Undefined Behavior (UB)

0. Undefined behavior (UB) refers to a behavior that can produce different
   results depending on the system and compiler implementation.
1. Using uninitialized variables. (Result in a UB.) (Compilers can handle it.)
2. Failure to return a value from a non-void function. (Result in a UB.)
   (Compilers can't always handle it.)
3. Any use of an object after it has been destroyed. (Result in a UB.)
   (Compilers can't handle it.)
4. Signed integer overflow is undefined behavior in C++, while unsigned integer
   overflow is well-defined. However, using unsigned integers is not recommended
   because their wrap-around action can result in numerous bugs. (Is a UB.)
5. A rounding error in floating type numbers becsuase of their limited
   precision. (May result in a UB.)
6. Modify or destroy the initializer related to `std::string_view` objects when
   using these objects. (May result in a UB.)
7. The same `inline` variable can have different values in different translation
   units. (Result in a UB.)
8. The order in which expressions (operands, function arguments, and
   subexpressions) with the same precedence level are evaluated is undefined
   behavior (UB). (Result in a UB.)
9. Integer/0. (Result in a UB.)
10. Number/0.0. (May result in a UB, or `NaN` or `Inf` (on architectures that
    support IEEE754 floating point format).)
11. A function or expression is said to have a side effect if it has some
    observable effect beyond producing a return value. In many cases, C++ also
    does not specify when the side effects of operators must be applied. Using a
    variable that has a side effect applied to it more than once in a given
    statement. (may result in a UB.)

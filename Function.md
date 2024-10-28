<!-- vim-markdown-toc GFM -->

- [Function](#function)
  - [1) Explanation](#1-explanation)
  - [2) Advantages and Disadvantages](#2-advantages-and-disadvantages)
    - [Advantages ( Why Use a Function )](#advantages--why-use-a-function-)
    - [Disadvantages](#disadvantages)
  - [3) Definition Syntax](#3-definition-syntax)
  - [4) Declaration Syntax](#4-declaration-syntax)
  - [5) Reference Syntax](#5-reference-syntax)
  - [6) How to Pass an Argument to a Function](#6-how-to-pass-an-argument-to-a-function)
  - [7) Keywords Related to Functions](#7-keywords-related-to-functions)
    - [(1) `inline`](#1-inline)
      - [Explanation](#explanation)
      - [Syntax](#syntax)
      - [Advantages](#advantages)
      - [Disadvantages](#disadvantages-1)
      - [Usage](#usage)
    - [(2) `const`](#2-const)
      - [Purpose](#purpose)
    - [(3) `constexpr`](#3-constexpr)
    - [(4) `static`](#4-static)
    - [(5) `noexcept`](#5-noexcept)
      - [Explanation](#explanation-1)
      - [Synatx](#synatx)
      - [Usage](#usage-1)
      - [Conditional noexcept expressions](#conditional-noexcept-expressions)
        - [Explanation](#explanation-2)
        - [Synatx](#synatx-1)
    - [(6) `asm` or `__asm`](#6-asm-or-__asm)
      - [Explanation](#explanation-3)
      - [Syntax](#syntax-1)
  - [8) Function Pointers](#8-function-pointers)
    - [Explanation](#explanation-4)
    - [(1) Declaration and Definition Syntax](#1-declaration-and-definition-syntax)
    - [(2) Declaration and Assignment Syntax](#2-declaration-and-assignment-syntax)
    - [(2) Syntax for Function Calls Using Function Pointers](#2-syntax-for-function-calls-using-function-pointers)
    - [(3) Syntax for Function Pinter Declaration Using `using`](#3-syntax-for-function-pinter-declaration-using-using)
    - [(4) Syntax for Function Pinter Declaration Using `typedef`](#4-syntax-for-function-pinter-declaration-using-typedef)
  - [9) Lambda Functions](#9-lambda-functions)
    - [Why Use Lambda Functions](#why-use-lambda-functions)
    - [Explanation](#explanation-5)
    - [Syntax](#syntax-2)
      - [Code for Passing It as a Variable](#code-for-passing-it-as-a-variable)
      - [Code for Defining It as a Function](#code-for-defining-it-as-a-function)
      - [Explanation](#explanation-6)
    - [Capture Clause](#capture-clause)
      - [Explanation](#explanation-7)
      - [Example 1: Capture Nothing](#example-1-capture-nothing)
      - [Example 2: A Default Capture Mode `[=]` - Capture All Variables by Value](#example-2-a-default-capture-mode----capture-all-variables-by-value)
      - [Example 3: A Default Capture Mode `[&]` - Capture All Variables by Value](#example-3-a-default-capture-mode----capture-all-variables-by-value)
      - [Example 4: Specify Some Variables Captured by Value](#example-4-specify-some-variables-captured-by-value)
      - [Example 5: Specify Some Variables Captured by Reference](#example-5-specify-some-variables-captured-by-reference)
      - [Example 6: Specify Some Variables Captured by Reference and Others by Value](#example-6-specify-some-variables-captured-by-reference-and-others-by-value)
      - [Example 7: Specify Some Variables Captured by Value and Others by Reference](#example-7-specify-some-variables-captured-by-value-and-others-by-reference)
      - [Example 8: Specify Some Variables Captured by Reference and Some by Value](#example-8-specify-some-variables-captured-by-reference-and-some-by-value)
    - [`mutable` Lambda Functions](#mutable-lambda-functions)
      - [Explanation](#explanation-8)
      - [Syntax](#syntax-3)
    - [`noexcept` Lambda Functions](#noexcept-lambda-functions)
      - [Explanation](#explanation-9)
      - [Syntax](#syntax-4)

<!-- vim-markdown-toc -->

## Function

### 1) Explanation

1. A function is **a self-contained block of code** that **performs a specific task**. It can take
   input values, called parameters, process them, and optionally return a result.

### 2) Advantages and Disadvantages

#### Advantages ( Why Use a Function )

1. **Code Reusability**: Functions allow you to write a piece of code once and reuse it multiple
   times throughout your program. This reduces redundancy and makes the code more maintainable.
2. Modularity: Functions enable you to break down complex problems into smaller, manageable pieces.
   Each function can focus on a specific task, which makes understanding and maintaining the code
   easier.
3. Easier Debugging: Since functions isolate specific tasks, it’s easier to identify and fix bugs.
   You can test each function independently to ensure it works correctly.
4. Improved Readability: Well-named functions make the code more readable. They serve as
   documentation by indicating what the function does, which can help other developers (or your
   future self) understand the code more quickly.
5. Abstraction: Functions help abstract away complex logic. Once a function is defined, you can use
   it without needing to understand its internal workings, allowing you to focus on higher-level
   programming.

#### Disadvantages

1. **Overhead**: Calling functions introduces a slight overhead due to the time taken for the call
   and return. This can impact performance in time-critical applications, particularly if functions
   are called excessively or are very small, except in the case of an **inline** function.
2. Complexity: Overusing functions or creating too many small functions can lead to unnecessary
   complexity. If functions are too granular, it may become challenging to trace program flow and
   understand how different parts interact.
3. Global State Management: Functions can complicate the management of global variables or states.
   If functions modify global variables, it can lead to unpredictable behavior and make debugging
   difficult.
4. Scope Issues: The scope of variables defined within functions can lead to issues if not managed
   properly. Local variables may be inaccessible outside the function, which can limit their
   usefulness.
5. Dependency Management: Functions can create dependencies between different parts of a program.
   Changes in one function may require updates to others that depend on it, which can lead to
   maintenance challenges.

### 3) Definition Syntax

```CPP
RetType funcName( para_list ) {
   // function body
};
```

```CPP
auto funcName( para_list ) -> RetType {
   // function body
};
```

### 4) Declaration Syntax

```CPP
RetType funcName( para_list );
```

### 5) Reference Syntax

```CPP
funcName( arg_list );
```

```CPP
RetType var_name = funcName( arg_list );
```

### 6) How to Pass an Argument to a Function

1. **Primitive**-type arguments: Pass their **values** to the function.
2. **Class**-type, **struct**-type, and other **complex arguments**: Pass their **references or
   pointers** to the function.

### 7) Keywords Related to Functions

#### (1) `inline`

##### Explanation

1. Functions defined with the `inline` keyword suggest to the compiler that it should **attempt** to
   **expand the function's code at each point where the function is called**, rather than performing
   a traditional call.
2. Please note that this is **just a suggestion**. The compiler will decide whether or not to expand
   the inline function depending on the situation. If you want to force the compiler to unfold the
   function all the time, you should understand more about the compiler's behavior.

##### Syntax

```
inline RetType funcName( para_list ) { // function body };

int main() {
   RetType result = funcName( para_list );   // Function call may be replaced with the function body
};
```

##### Advantages

1. Reduced function call overhead.
2. Fast execution.

##### Disadvantages

1. Code bloat.
2. Increased compilation time.
3. Debugging difficult.

##### Usage

1. Inline Functions
2. Inline Methods
3. Inline Template Functions

#### (2) `const`

##### Purpose

1. For more information, please refer to Section [1) `const`](#1-const).

#### (3) `constexpr`

1. For more information, please refer to Section [2) `constexpr`](#2-constexpr).

#### (4) `static`

1. For more information, please refer to Section [3) `static`](#3-static).

#### (5) `noexcept`

##### Explanation

1. `noexcept` is a specifier in C++ that **indicates** whether a function is **guaranteed not to
   throw exceptions**.
2. It helps optimize code by allowing the compiler to make certain assumptions about exception
   handling.
3. If a `noexcept` function **throws an exception**, the compiler will issue a **`warning`**.

##### Synatx

```CPP
RetType funcName( para_list ) noexcept {
   // Indicates no exceptions will be thrown
   // Function implementation
};
```

```CPP
// The compiler will issue a `warning`.
RetType funcName( para_list ) noexcept {
   // Indicates no exceptions will be thrown
   // Function implementation
   throw std::runtime_error( " ... " );
};
```

##### Usage

1. Function declarations and definitions
2. Lambda expressions
3. Constructors and destructors
4. Move constructors and move assignment operators
5. Conditional noexcept expressions
6. Function pointers and type aliases
7. Overloaded functions

##### Conditional noexcept expressions

###### Explanation

1. Conditional `noexcept` in C++ allows you to **specify that a function is noexcept** only if
   **certain conditions** are **met**.
2. The expression accompanying `noexcept` is **evaluated** as true or false **at compile time**. If
   the expression is **true**, the function is considered **noexcept**; if **false**, it may **throw
   exceptions**.

###### Synatx

```CPP
RetType funcName( para_list ) noexcept(noexcept(an expression or a function) {
   // Indicates no exceptions will be thrown
   // Function implementation
};
```

#### (6) `asm` or `__asm`

##### Explanation

1. `asm` and `__asm` are **keywords** used to **embed assembly language instructions within C++
   code**.
2. They allow you to write low-level code for performance-critical sections, hardware control, or
   when specific machine instructions are required.

##### Syntax

```CPP
asm("assembly_code");
```

### 8) Function Pointers

#### Explanation

1. A function pointer is **a variable** that **stores the address of a function** in C or C++.
2. It allows you to call a function indirectly through its pointer, enabling dynamic function calls
   and making it possible to implement callback mechanisms.

#### (1) Declaration and Definition Syntax

```CPP
// The implicit conversion occurs.
auto func_ptr_name = funcName;
```

```CPP
// This syntax is equivalent to the syntax mentioned above.
// The implicit conversion does not occur.
auto func_ptr_name = &funcName;
```

```CPP
// This syntax is equivalent to the syntax mentioned above.
// The implicit conversion occurs.
RetType ( *func_ptr_name )( para_type_list ) = funcName;
```

```CPP
// This syntax is equivalent to the syntax mentioned above.
// The implicit conversion does not occur.
RetType ( *func_ptr_name )( para_type_list ) = &funcName;
```

#### (2) Declaration and Assignment Syntax

```CPP
RetType ( *func_ptr_name )( para_type_list );
// The implicit conversion occurs.
func_ptr_name = funcName;
```

```CPP
// This syntax is equivalent to the syntax mentioned above.
// The implicit conversion does not occur.
RetType ( *func_ptr_name )( para_type_list );
func_ptr_name = &funcName;
```

#### (2) Syntax for Function Calls Using Function Pointers

```CPP
// A function whose return type isn't `void`
auto result = func_ptr_name( arguement_list );
```

```CPP
// This syntax is equivalent to the syntax mentioned above.
RetType result = func_ptr_name( arguement_list );
```

```CPP
// A function whose return type is `void`
func_pt_name( arguement_list );
```

#### (3) Syntax for Function Pinter Declaration Using `using`

```CPP
using FuncPtrName = RetType ( * )( parameter_types );
FuncPtrName func_ptr_name;
```

#### (4) Syntax for Function Pinter Declaration Using `typedef`

```CPP
typedef RetType ( *FuncPtrName )( parameter_types );
FuncPtrName func_ptr_name;
```

### 9) Lambda Functions

#### Why Use Lambda Functions

1.  If functionA wants to call functionB **at a particular point**, you could pass a pointer to
    functionB into functionA. However, using traditional method to implement functionB may be
    **overkill**, so you should use a lambda instead.
2.  Some **C++ standard libraries require** function pointers; you can pass a lambda as a pointer to
    them.

#### Explanation

1. A lambda function is a way to define **an anonymous inline function** (i.e., a function without a
   name) directly in your code. It allows you to create small, simple function-like entities inline,
   making your code more concise and flexible.

#### Syntax

##### Code for Passing It as a Variable

```CPP
[capture]( para_list ) -> RetType { body };
```

##### Code for Defining It as a Function

```CPP
auto funcName =  [capture]( para_list ) -> RetType { body };
```

##### Explanation

1. capture: Specifies which variables from the surrounding scope are captured by the lambda. This
   can be done by value (`=`) or by reference (`&`).
2. parameters: The parameters for the lambda function, similar to any regular function.
3. RetType (**optional**): The return type of the lambda. If **omitted**, C++ will attempt to deduce
   it automatically.
4. body: The function body where the logic of the lambda resides.

#### Capture Clause

##### Explanation

1. Capture by value (`=`): Copies the variable and makes it accessible inside the lambda.
2. Capture by reference (`&`): Allows the lambda to modify the variable in the outer scope.
3. Default capture: Default capture in a lambda function allows you to specify how variables from
   the surrounding scope are captured **without explicitly listing each one**. You can set **a
   default capture mode for all variables**, which **can be overridden for specific variables** if
   needed.

##### Example 1: Capture Nothing

```CPP
auto funcName =  []( para_list ) -> RetType { body };
```

##### Example 2: A Default Capture Mode `[=]` - Capture All Variables by Value

```CPP
// A default capture mode[=]: captures all variables by value.
auto funcName =  [=]( para_list ) -> RetType { body };
```

##### Example 3: A Default Capture Mode `[&]` - Capture All Variables by Value

```CPP
// A default capture mode[&]: captures all variables by value.
auto funcName =  [&]( para_list ) -> RetType { body };
```

##### Example 4: Specify Some Variables Captured by Value

```CPP
auto funcName =  [var1, var2, ...]( para_list ) -> RetType { body };
```

##### Example 5: Specify Some Variables Captured by Reference

```CPP
auto funcName =  [&var1, &var2, ...]( para_list ) -> RetType { body };
```

##### Example 6: Specify Some Variables Captured by Reference and Others by Value

```CPP
// In the capture list, the default capture must appear first.
auto funcName =  [=, &var1, &var2, ...]( para_list ) -> RetType { body };
```

##### Example 7: Specify Some Variables Captured by Value and Others by Reference

```CPP
// In the capture list, the default capture must appear first.
auto funcName =  [&, =var1, =var2, ...]( para_list ) -> RetType { body };
```

##### Example 8: Specify Some Variables Captured by Reference and Some by Value

```CPP
auto funcName =  [&var1, &var2, ..., varn1, varn2, ...]( para_list ) -> RetType { body };
```

#### `mutable` Lambda Functions

##### Explanation

1. For a lambda, the `mutable` keyword allows the lambda to **change the value of a variable passed
   by value inside the lambda**, but it **does not change the variable's actual value outside the
   lambda**.
2. In 90% of cases, the `mutable` keyword will be used in a class with the `const` keyword.

##### Syntax

```CPP
[capture]( para_list ) mutable -> RetType { body };
```

```CPP
auto funcName =  [capture]( para_list ) mutable -> RetType { body };
```

#### `noexcept` Lambda Functions

##### Explanation

1. The `noexcept` keyword **indicates** whether a lambda expression is **guaranteed not to not throw
   exceptions**.
2. If a `noexcept` lambda function **throws an exception**, the compiler will issue a **`warning`**.

##### Syntax

```CPP
[capture]( para_list ) noexcept -> RetType { body };
```

```CPP
auto funcName =  [capture]( para_list ) noexcept -> RetType { body };
```

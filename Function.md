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
ReturnType funcName( parameter_list ) {
   // function body
};
```

### 4) Declaration Syntax

```CPP
ReturnType funcName( parameter_list );
```

### 5) Reference Syntax

```CPP
funcName( argument_list );
```

```CPP
ReturnType var_name = funcName( argument_list );
```

### 6) How to Pass an Argument to a Function

1. **Primitive**-type arguments: Pass their **values** to the function.
2. **Class**-type, **struct**-type, and other **complex arguments**: Pass their **references or
   pointers** to the function.

### 7) Keywords Related to Functions

#### (1) `inline`

##### Purpose

1. Suggests to the compiler to replace the function call with the function body to reduce call
   overhead. Please note that this is **just a suggestion**. The compiler will decide whether or not
   to expand the inline function depending on the situation. If you want to force the compiler to
   unfold the function all the time, you should understand more about the compiler's behavior.

##### Example

```
inline int add( int a, int b ) { return a + b; }

int main() {
   int result = add( 5, 3 );   // Function call may be replaced with (5 + 3)
}
```

##### Advantages

1. Reduced function call overhead.
2. Fast execution.

##### Disadvantages

1. Code bloat.
2. Increased compilation time.
3. Debugging difficult.

#### (2) `const`

##### Purpose

1. For more information, please refer to Section [1) `const`](#1-const).

#### (3) `static`

1. For more information, please refer to Section [3) `static`](#3-static).

#### (4) `constexpr`

1. For more information, please refer to Section [2) `constexpr`](#2-constexpr).

#### (5) `noexcept`

##### Purpose

1. Indicates that a function does **not throw exceptions**, allowing the compiler to **optimize**
   calls to the function.

##### Example

```CPP
void safeFunction() noexcept {   // Indicates no exceptions will be thrown
                                 // Function implementation
}

int main() { safeFunction(); }
```

#### (6) `asm` or `__asm`

##### Purpose

1. Allows embedding **assembly code** within a C++ function.

##### Example

```CPP
void asmFunction() {
   asm( "movl $1, %eax" );   // Simple assembly instruction
}

int main() { asmFunction(); }
```

### 8) Function Pointers

#### Explanation and Usage

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
ReturnType ( *func_ptr_name )( parameter_type_list ) = funcName;
```

```CPP
// This syntax is equivalent to the syntax mentioned above.
// The implicit conversion does not occur.
ReturnType ( *func_ptr_name )( parameter_type_list ) = &funcName;
```

#### (2) Declaration and Assignment Syntax

```CPP
ReturnType ( *func_ptr_name )( parameter_type_list );
// The implicit conversion occurs.
func_ptr_name = funcName;
```

```CPP
// This syntax is equivalent to the syntax mentioned above.
// The implicit conversion does not occur.
ReturnType ( *func_ptr_name )( parameter_type_list );
func_ptr_name = &funcName;
```

#### (2) Syntax for Function Calls Using Function Pointers

```CPP
// A function whose return type isn't `void`
auto result = func_ptr_name( arguement_list );
```

```CPP
// This syntax is equivalent to the syntax mentioned above.
ReturnType result = func_ptr_name( arguement_list );
```

```CPP
// A function whose return type is `void`
func_pt_name( arguement_list );
```

#### (3) Syntax for Function Pinter Declaration Using `typedef`

```CPP
typedef ReturnType ( *FuncPtrName )( parameter_types );
FuncPtrName func_ptr_name;
```

#### (4) Syntax for Function Pinter Declaration Using `using`

```CPP
using FuncPtrName = ReturnType ( * )( parameter_types );
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
[capture]( parameters ) -> ReturnType { body };
```

##### Code for Defining It as a Function

```CPP
auto functionName =  [capture]( parameters ) -> ReturnType { body };
```

#### Explanation

1. capture: Specifies which variables from the surrounding scope are captured by the lambda. This
   can be done by value (`=`) or by reference (`&`).
2. parameters: The parameters for the lambda function, similar to any regular function.
3. ReturnType (**optional**): The return type of the lambda. If **omitted**, C++ will attempt to
   deduce it automatically.
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
auto functionName =  []( parameters ) -> ReturnType { body };
```

##### Example 2: A Default Capture Mode `[=]` - Capture All Variables by Value

```CPP
// A default capture mode[=]: captures all variables by value.
auto functionName =  [=]( parameters ) -> ReturnType { body };
```

##### Example 3: A Default Capture Mode `[&]` - Capture All Variables by Value

```CPP
// A default capture mode[&]: captures all variables by value.
auto functionName =  [&]( parameters ) -> ReturnType { body };
```

##### Example 4: Specify Some Variables Captured by Value

```CPP
auto functionName =  [var1, var2, ...]( parameters ) -> ReturnType { body };
```

##### Example 5: Specify Some Variables Captured by Reference

```CPP
auto functionName =  [&var1, &var2, ...]( parameters ) -> ReturnType { body };
```

##### Example 6: Specify Some Variables Captured by Reference and Others by Value

```CPP
// In the capture list, the default capture must appear first.
auto functionName =  [=, &var1, &var2, ...]( parameters ) -> ReturnType { body };
```

##### Example 7: Specify Some Variables Captured by Value and Others by Reference

```CPP
// In the capture list, the default capture must appear first.
auto functionName =  [&, =var1, =var2, ...]( parameters ) -> ReturnType { body };
```

##### Example 8: Specify Some Variables Captured by Reference and Some by Value

```CPP
auto functionName =  [&var1, &var2, ..., varn1, varn2, ...]( parameters ) -> ReturnType { body };
```

#### `mutable` Lambda Functions

##### Syntax

```CPP
[capture]( parameters ) mutable -> ReturnType { body };
```

```CPP
auto functionName =  [capture]( parameters ) mutable -> ReturnType { body };
```

##### Explanation

1. For a lambda, the `mutable` keyword allows the lambda to **change the value of a variable passed
   by value inside the lambda**, but it **does not change the variable's actual value outside the
   lambda**.
2. In 90% of cases, the `mutable` keyword will be used in a class with the `const` keyword.

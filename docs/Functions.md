<!-- vim-markdown-toc GFM -->

- [Functions](#functions)
  - [Explanation](#explanation)
  - [Advantages and Disadvantages](#advantages-and-disadvantages)
    - [Advantages (Why Use Functions)](#advantages-why-use-functions)
    - [Disadvantages](#disadvantages)
  - [Declaration Syntax](#declaration-syntax)
  - [Definition Syntax](#definition-syntax)
  - [Reference Syntax](#reference-syntax)
  - [Function Arguments](#function-arguments)
    - [Function Argument Pushing Order (Stack Order)](#function-argument-pushing-order-stack-order)
    - [How to Pass Arguments to a Function](#how-to-pass-arguments-to-a-function)
    - [Limitations of Function Default Arguments](#limitations-of-function-default-arguments)
  - [Keywords Related to Functions](#keywords-related-to-functions)
    - [`inline`](#inline)
      - [Explanation](#explanation-1)
      - [Syntax](#syntax)
      - [Advantages](#advantages)
      - [Disadvantages](#disadvantages-1)
      - [Usage](#usage)
    - [`const`](#const)
    - [`constexpr`](#constexpr)
    - [`static`](#static)
    - [`noexcept`](#noexcept)
      - [Explanation](#explanation-2)
      - [Synatx](#synatx)
      - [Usage](#usage-1)
      - [Conditional `noexcept` Expressions](#conditional-noexcept-expressions)
        - [Explanation](#explanation-3)
        - [Synatx](#synatx-1)
    - [`asm` or `__asm`](#asm-or-__asm)
      - [Explanation](#explanation-4)
      - [Syntax](#syntax-1)
  - [Function Pointers](#function-pointers)
    - [Explanation](#explanation-5)
    - [Declaration and Definition Syntax](#declaration-and-definition-syntax)
    - [Declaration and Assignment Syntax](#declaration-and-assignment-syntax)
    - [Function Pointer Arrays](#function-pointer-arrays)
    - [Syntax for Function Calls Using Function Pointers](#syntax-for-function-calls-using-function-pointers)
    - [Syntax for Function Pinter Declaration Using `using`](#syntax-for-function-pinter-declaration-using-using)
    - [Syntax for Function Pinter Declaration Using `typedef`](#syntax-for-function-pinter-declaration-using-typedef)
  - [Lambda Functions](#lambda-functions)
    - [Why Use Lambda Functions](#why-use-lambda-functions)
    - [Explanation](#explanation-6)
    - [Syntax](#syntax-2)
      - [Passing It as a Variable](#passing-it-as-a-variable)
      - [Defining It as a Function](#defining-it-as-a-function)
      - [Explanation](#explanation-7)
    - [Capture Clause](#capture-clause)
      - [Explanation](#explanation-8)
      - [Example 1: Capture Nothing](#example-1-capture-nothing)
      - [Example 2: A Default Capture Mode `[=]` - Capture All Variables by Value](#example-2-a-default-capture-mode----capture-all-variables-by-value)
      - [Example 3: A Default Capture Mode `[&]` - Capture All Variables by Value](#example-3-a-default-capture-mode----capture-all-variables-by-value)
      - [Example 4: Specify Some Variables Captured by Value](#example-4-specify-some-variables-captured-by-value)
      - [Example 5: Specify Some Variables Captured by Reference](#example-5-specify-some-variables-captured-by-reference)
      - [Example 6: Specify Some Variables Captured by Reference and Others by Value](#example-6-specify-some-variables-captured-by-reference-and-others-by-value)
      - [Example 7: Specify Some Variables Captured by Value and Others by Reference](#example-7-specify-some-variables-captured-by-value-and-others-by-reference)
      - [Example 8: Specify Some Variables Captured by Reference and Some by Value](#example-8-specify-some-variables-captured-by-reference-and-some-by-value)
      - [Example 9: Creates a New Variable within the Lambda and Initializes it with an Expression](#example-9-creates-a-new-variable-within-the-lambda-and-initializes-it-with-an-expression)
    - [`mutable` Lambda Functions](#mutable-lambda-functions)
      - [Explanation](#explanation-9)
      - [Syntax](#syntax-3)
    - [`noexcept` Lambda Functions](#noexcept-lambda-functions)
      - [Explanation](#explanation-10)
      - [Syntax](#syntax-4)
  - [Function Parameter Packs](#function-parameter-packs)
    - [Explanation](#explanation-11)
    - [Common Syntax](#common-syntax)
    - [Links](#links)
  - [Callback Functions and Registeration Functions](#callback-functions-and-registeration-functions)
  - [Function References](#function-references)
    - [Explanation](#explanation-12)
    - [Declaration and Definition Syntax](#declaration-and-definition-syntax-1)
  - [Function Signatures](#function-signatures)
  - [Hiding, Overloading, Overriding, and Overwriting](#hiding-overloading-overriding-and-overwriting)
- [`std::function`](#stdfunction)

<!-- vim-markdown-toc -->

## Functions

### Explanation

1. Functions are **self-contained blocks of code** that **perform specific
   tasks**.
2. They can accept input values, known as parameters, process them, and
   optionally return a result.

### Advantages and Disadvantages

#### Advantages (Why Use Functions)

1. **Code reusability**:
   - Functions allow you to write a piece of code once and reuse it multiple
     times throughout your program.
   - This reduces redundancy and makes the code more maintainable.
2. **Modularity**:
   - Functions enable you to break down complex problems into smaller,
     manageable pieces.
   - Each function can focus on a specific task, which makes understanding and
     maintaining the code easier.
3. **Easier debugging**:
   - Since functions isolate specific tasks, it’s easier to identify and fix
     bugs.
   - You can test each function independently to ensure it works correctly.
4. **Improved readability**:
   - Well-named functions make the code more readable.
   - They serve as documentation by indicating what the function does, which can
     help other developers (or your future self) understand the code more
     quickly.
5. Abstraction:
   - Functions help abstract away complex logic.
   - Once a function is defined, you can use it without needing to understand
     its internal workings, allowing you to focus on higher-level programming.

#### Disadvantages

1. **Overhead**:
   - Calling functions introduces a slight overhead due to the time taken for
     the call and return.
   - This can impact performance in time-critical applications, particularly if
     functions are called excessively or are very small, except in the case of
     an **inline** function.
2. Complexity:
   - Overusing functions or creating too many small functions can lead to
     unnecessary complexity.
   - If functions are too granular, it may become challenging to trace program
     flow and understand how different parts interact.
3. Global state management:
   - Functions can complicate the management of global variables or states.
   - If functions modify global variables, it can lead to unpredictable behavior
     and make debugging difficult.
4. Scope issues:
   - The scope of variables defined within functions can lead to issues if not
     managed properly.
   - Local variables may be inaccessible outside the function, which can limit
     their usefulness.
5. Dependency management:
   - Functions can create dependencies between different parts of a program.
   - Changes in one function may require updates to others that depend on it,
     which can lead to maintenance challenges.

### Declaration Syntax

```CPP
RetType funcName( para_list );
```

### Definition Syntax

```CPP
RetType funcName( para_list ) {
   // Function body.
};
```

```CPP
auto funcName( para_list ) -> RetType {
   // Function body.
};
```

### Reference Syntax

```CPP
funcName( arg_list );
```

```CPP
RetType var_name = funcName( arg_list );
```

### Function Arguments

#### Function Argument Pushing Order (Stack Order)

1. **Right to left** (**most common**):
   - In most platforms and compilers (e.g., x86 and x64 using the C calling
     convention), arguments are pushed onto the stack from right to left.
   - This means the rightmost parameter is pushed first.
   - This allows the function to access arguments in the correct order when it
     retrieves them from the stack.
2. Left to right (less common):
   - Some calling conventions (e.g., used in some versions of the ARM
     architecture) may push arguments left to right (from leftmost to
     rightmost).
   - This is less common in mainstream desktop systems but might be used in
     embedded or special-purpose systems.
3. Registers:
   - For performance reasons, many modern platforms (like x64) pass the first
     few arguments to a function in registers rather than pushing them onto the
     stack.
   - Only arguments that don't fit into the available registers are pushed onto
     the stack.

#### How to Pass Arguments to a Function

1. **Primitive**-type arguments: Pass their **values** to the function.
2. **Class**-type, **struct**-type, and other **complex arguments**: Pass their
   **references or pointers** to the function.

#### Limitations of Function Default Arguments

1. **Order of Parameters**:
   - **Once a default argument** is **specified** for a parameter, **all
     subsequent** parameters **must** also **have default arguments**.
   - It is **not permissible** to **omit a parameter** that **has a default
     value** if one intends to **provide values for later parameters**.
2. **Ambiguity in overloading**:
   - The use of default arguments can lead to ambiguity in function overloading.
   - If multiple overloaded functions can match the same call due to the
     presence of default arguments, it may result in confusion for the compiler.
3. **Inheritance**:
   - When overriding a virtual function **in a derived class**, **the default
     arguments** of the base class method **cannot be altered**.
   - The default arguments of the base class will remain applicable, which may
     lead to confusion.
4. **Function pointers**:
   - When using function pointers, **default arguments cannot be used** in the
     pointer type because the default argument mechanism relies on the compiler
     knowing the function signature, and function pointers do not inherently
     know this.
   - The function pointer type must match the function signature precisely.
5. **Cannot change default arguments between declarations and definitions**.
6. **Default arguments cannot be repeated**:
   - Default arguments must be provided only once in the function declaration or
     definition.
   - If you specify default arguments in both the declaration and definition,
     the compiler will raise an error.

### Keywords Related to Functions

#### `inline`

##### Explanation

1. Functions defined with the `inline` keyword suggest to the compiler that it
   should **attempt** to **expand the function's code at each point where the
   function is called**, rather than performing a traditional call.
2. Please note that this is **just a suggestion**.
   - The compiler will decide whether or not to expand the inline function
     depending on the situation.
   - If you want to force the compiler to unfold the function all the time, you
     should understand more about the compiler's behavior.

##### Syntax

```
inline RetType funcName( para_list ) { // Function body. };

int main() {
   RetType result = funcName( para_list );   // Function call may be replaced with the function body.
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

1. Inline functions.
2. Inline methods.
3. Inline template functions.

#### `const`

1. [`const` Methods (`const` Member Functions)](./ConstConstexprAndStatic.md#const-methods-const-member-functions)
2. [`const` Function Parameters](./ConstConstexprAndStatic.md##const-function-parameters)

#### `constexpr`

1. [`constexpr` Functions (`constexpr` Return Values)](./ConstConstexprAndStatic.md#constexpr-functions-constexpr-return-values)

#### `static`

1. [`static` Methods (`static` Member Functions)](./ConstConstexprAndStatic.md#static-methods-static-member-functions)
2. [`static` Global Functions](#static-global-functions)

#### `noexcept`

##### Explanation

1. `noexcept` is a specifier in C++ that **indicates** whether a function is
   **guaranteed not to throw exceptions**.
2. It helps optimize code by allowing the compiler to make certain assumptions
   about exception handling.
3. If a `noexcept` function **throws an exception**, the compiler will issue a
   **`warning`**.

##### Synatx

```CPP
RetType funcName( para_list ) noexcept {
   // Indicates no exceptions will be thrown.
   // Function implementation.
};
```

```CPP
// The compiler will issue a `warning`.
RetType funcName( para_list ) noexcept {
   // Indicates no exceptions will be thrown.
   // Function implementation.
   throw std::runtime_error( " ... " );
};
```

##### Usage

1. Function declarations and definitions.
2. Lambda expressions.
3. Constructors and destructors.
4. Move constructors and move assignment operators.
5. Conditional noexcept expressions.
6. Function pointers and type aliases.
7. Overloaded functions.

##### Conditional `noexcept` Expressions

###### Explanation

1. Conditional `noexcept` in C++ allows you to **specify that a function is
   noexcept** only if **certain conditions** are **met**.
2. The expression accompanying `noexcept` is **evaluated** as true or false **at
   compile time**.
   - If the expression is **true**, the function is considered **noexcept**.
   - If **false**, it may **throw exceptions**.

###### Synatx

```CPP
RetType funcName( para_list ) noexcept( noexcept ( an expression or a function ) {
   // Indicates no exceptions will be thrown.
   // Function implementation.
};
```

#### `asm` or `__asm`

##### Explanation

1. `asm` and `__asm` are **keywords** used to **embed assembly language
   instructions within C++ code**.
2. They allow you to write low-level code for performance-critical sections,
   hardware control, or when specific machine instructions are required.

##### Syntax

```CPP
asm("assembly_code");
```

### Function Pointers

#### Explanation

1. A function pointer is **a variable** that **stores the address of a
   function** in C or C++.
2. It allows you to call a function indirectly through its pointer, enabling
   **dynamic function calls** and making it possible to **implement callback
   mechanisms**.

#### Declaration and Definition Syntax

```CPP
// The implicit conversion occurs.
// If the function is overloaded, `static_cast` should be used to convert `funcName` explicitly.
// Alternatively, avoid using `auto` and declare the function pointer with an explicitly specific type.
auto func_ptr_name = funcName; // Not recommend.
// auto func_ptr_name = SpaceName::funcName; // Not allow.
// auto func_ptr_name = ClassName::funcName; // Not allow.
```

```CPP
// This syntax is equivalent to the syntax mentioned above.
// The implicit conversion does not occur.
auto func_ptr_name = &funcName; // Recommend.
// auto func_ptr_name = &SpaceName::funcName; // Recommend.
// auto func_ptr_name = &ClassName::funcName; // Recommend.
```

```CPP
// This syntax is equivalent to the syntax mentioned above.
// The implicit conversion occurs.
RetType ( *func_ptr_name )( para_type_list ) = funcName; // Not recommend.
// RetType ( *func_ptr_name )( para_type_list ) = SpaceName::funcName; // Not allow.
// RetType ( *func_ptr_name )( para_type_list ) = ClassName::funcName; // Not allow.
```

```CPP
// This syntax is equivalent to the syntax mentioned above.
// The implicit conversion does not occur.
RetType ( *func_ptr_name )( para_type_list ) = &funcName; // Recommend.
// RetType ( *func_ptr_name )( para_type_list ) = &SpaceName::funcName; // Recommend.
// RetType ( *func_ptr_name )( para_type_list ) = &ClassName::funcName; // Recommend.
```

#### Declaration and Assignment Syntax

```CPP
RetType ( *func_ptr_name )( para_type_list );
// The implicit conversion occurs.
func_ptr_name = funcName; // Not recommend.
```

```CPP
// This syntax is equivalent to the syntax mentioned above.
// The implicit conversion does not occur.
RetType ( *func_ptr_name )( para_type_list );
func_ptr_name = &funcName; // Recommend.
```

#### Function Pointer Arrays

1. [Function Pointer Arrays](./Arrays.md#function-pointer-arrays)

#### Syntax for Function Calls Using Function Pointers

```CPP
// A function whose return type isn't `void`.
auto result = func_ptr_name( arg_list ); // Not recommend.
auto result = ( *func_ptr_name )( arg_list ); // Recommend.
```

```CPP
// This syntax is equivalent to the syntax mentioned above.
RetType result = func_ptr_name( arg_list ); // Not recommend.
RetType result = ( *func_ptr_name )( arg_list ); // Recommend.
```

```CPP
// A function whose return type is `void`.
func_pt_name( arg_list ); // Not recommend.
( *func_ptr_name )( arg_list ); // Recommend.
```

```CPP
RetType ( *func_ptr_name )( para_type_list ) = &ClassName::funcName; // Recommend.
ClassName obj_name;
ClassName* obj_ptr = &obj_name;
// A function whose return type isn't `void`.
auto result = ( obj_name.func_ptr_name )( arg_list ); // Not allow.
auto result = ( obj_name->func_ptr_name )( arg_list ); // Not allow.
auto result = ( obj_name.*func_ptr_name )( arg_list ); // Recommend.
auto result = ( obj_name->*func_ptr_name )( arg_list ); // Recommend.
```

```CPP
RetType ( *func_ptr_name )( para_type_list ) = &ClassName::funcName; // Recommend.
ClassName obj_name;
ClassName* obj_ptr = &obj_name;
// This syntax is equivalent to the syntax mentioned above.
RetType result = ( obj_name.func_ptr_name )( arg_list ); // Not allow.
RetType result = ( obj_name->func_ptr_name )( arg_list ); // Not allow.
RetType result = ( obj_name.*func_ptr_name )( arg_list ); // Recommend.
RetType result = ( obj_name->*func_ptr_name )( arg_list ); // Recommend.
```

```CPP
RetType ( *func_ptr_name )( para_type_list ) = &ClassName::funcName; // Recommend.
ClassName obj_name;
ClassName* obj_ptr = &obj_name;
// A function whose return type is `void`.
( obj_name.func_ptr_name )( arg_list ); // Not allow.
( obj_name->func_ptr_name )( arg_list ); // Not allow.
( obj_name.*func_ptr_name )( arg_list ); // Recommend.
( obj_name->*func_ptr_name )( arg_list ); // Recommend.
```

#### Syntax for Function Pinter Declaration Using `using`

1. [Syntax for Function Pinter Declaration Using `using`](./UsingTypedefNameSpaces.md#usage)
   ```CPP
   using FuncPtrName = RetType ( * )( parameter_types );
   FuncPtrName func_ptr_name;
   // using funcPtrName = RetType ( SpaceName::* )( ... );   // Alias for member function
   // using funcPtrName = RetType ( ClassName::* )( ... );   // Alias for member function
   ```

#### Syntax for Function Pinter Declaration Using `typedef`

1. [Syntax for Function Pinter Declaration Using `typedef`](./UsingTypedefNameSpaces.md#usage-1)
   ```CPP
   typedef RetType ( *FuncPtrName )( parameter_types );
   FuncPtrName func_ptr_name;
   // typedef RetType ( SpaceName::*FuncPtrName )( parameter_types );
   // typedef RetType ( ClassName::*FuncPtrName )( parameter_types );
   ```

### Lambda Functions

#### Why Use Lambda Functions

1. If `functionA` intends to invoke `functionB` **at a specific juncture**, a
   pointer to `functionB` can be passed into `functionA`.
2. However, employing a conventional implementation of `functionB` may be
   **excessive**; thus, utilizing a lambda expression is recommended.
3. Certain **C++ standard libraries necessitate** the use of function pointers;
   in such cases, a lambda expression can be passed as a pointer.

#### Explanation

1. A lambda function is a way to define **an anonymous inline function** (i.e.,
   a function without a name) directly in your code.
2. It allows you to create small, simple function-like entities **`inline`**,
   making your **code more concise and flexible**.
3. **All elements captured** by a lambda function **must be declared before the
   lambda’s definition**.

#### Syntax

##### Passing It as a Variable

```CPP
[capture]( para_list ) -> RetType { /* Funtion body. */ };
```

##### Defining It as a Function

```CPP
auto funcName =  [capture]( para_list ) -> RetType { /* Funtion body. */ };
```

##### Explanation

1. `capture`:
   - Specifies which variables from the surrounding scope are captured by the
     lambda.
   - This can be done by value (`=`) or by reference (`&`).
2. `para_list`:
   - The `para_list` for the lambda function, similar to any regular function.
3. `RetType` (**optional**):
   - The return type of the lambda.
   - If **omitted**, C++ will attempt to deduce it automatically.
4. `Function body`:
   - The function body where the logic of the lambda resides.

#### Capture Clause

##### Explanation

1. Capture by value (`=`):
   - Copies the variable and makes it accessible inside the lambda.
2. Capture by reference (`&`):
   - Allows the lambda to modify the variable in the outer scope.
3. Initializing capture (`var = expr`):
   - Creates a new variable var within the lambda and initializes it with expr
4. Default capture:
   - Default capture in a lambda function allows you to specify how variables
     from the surrounding scope are captured **without explicitly listing each
     one**.
   - You can set **a default capture mode for all variables**, which **can be
     overridden for specific variables** if needed.

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

##### Example 9: Creates a New Variable within the Lambda and Initializes it with an Expression

```CPP
auto funcName =  [ var = expr, ...]( para_list ) -> RetType { body };
```

#### `mutable` Lambda Functions

##### Explanation

1. For a lambda, the `mutable` keyword allows the lambda to **change the value
   of a variable passed by value inside the lambda**, but it **does not change
   the variable's actual value outside the lambda**.
2. In 90% of cases, the `mutable` keyword will be used in a class with the
   `const` keyword.

##### Syntax

```CPP
[capture]( para_list ) mutable -> RetType { body };
```

```CPP
auto funcName =  [capture]( para_list ) mutable -> RetType { body };
```

#### `noexcept` Lambda Functions

##### Explanation

1. The `noexcept` keyword **indicates** whether a lambda expression is
   **guaranteed not to not throw exceptions**.
2. If a `noexcept` lambda function **throws an exception**, the compiler will
   issue a **`warning`**.

##### Syntax

```CPP
[capture]( para_list ) noexcept -> RetType { body };
```

```CPP
auto funcName =  [capture]( para_list ) noexcept -> RetType { body };
```

### Function Parameter Packs

#### Explanation

1. Function parameter packs are **function parameters** that **accept zero or
   more function arguments**.

#### Common Syntax

```CPP
// Be mindful of the Ellipsis.
template< typename... Ts > RetType funcName( Ts... args ) {
   // Method to print all arguments in order without adding any extra characters.
   ( std::cout << ... << args ) << std::endl;
   // Method to print all arguments'addresses in order without adding any extra characters.
   ( std::cout << ... << &args ) << std::endl;
   // Method to print all ++arguments in order without adding any extra characters.
   ( std::cout << ... << ++args ) << std::endl;
   std::tuple< Args... > _var;        // Store arguments in a tuple.
   std::tuple< Args*... > _var_ptr;   // Store arguments in a tuple.
                                      // Method to return an element by index.
   return std::get< Index >( _var );
}
```

#### Links

1. [`parameter packs` in cplusplus]().
2. [`parameter packs` in cppreference](https://en.cppreference.com/w/cpp/language/parameter_pack).
3. [Variadic Templates (Template Packs)](./Templates.md/#variadic-templates-template-packs)

### Callback Functions and Registeration Functions

1. Callback functions:
   - A callback function is **a function** that is **passed as a parameter to
     another function**.
   - The function receiving the callback can then call it at the appropriate
     time, typically in response to an event or condition.
   - In essence, it is calling a function indirectly through a pointer to it
     (i.e., function pointer).
2. Registration functions:
   - A registration function is **a function** that is **typically used to
     register a callback or handler**.
   - It **takes a function pointer as an argument** and **stores or uses it
     later**, allowing other functions to invoke it when needed.
   - It’s essentially a way of registering a function for future calls.

### Function References

#### Explanation

1. A function reference is **an alias of a function** in C++.
2. It allows you to call a function indirectly through its name, making it
   possible to **implement callback mechanisms**.

#### Declaration and Definition Syntax

```CPP
auto& func_ptr_name = funcName;
```

```CPP
// This syntax is equivalent to the syntax mentioned above.
RetType ( &func_ptr_name )( para_type_list ) = funcName;
```

### Function Signatures

1. **A function signature** is **the unique combination of elements** that the
   compiler **uses to identify a function** and differentiate it from others.
2. The signature **determines if functions are overloads or redefinitions** and
   allows the compiler to select the correct function during compilation.
3. Whenever a function is declared or defined in C++, **the function signature
   must be consistent in both the declaration and the definition**.
4. The function signature in C++ **includes**:
   - **Function name**: The name of the function.
   - **Parameter list**:
     - The **number** of parameters.
     - The **types** of each parameter.
     - The **order** of parameters.
     - Whether parameters are **references (`&`), rvalue references (`&&`)**, or
       **pointers** (`*`).
     - **Const qualifiers** on **reference** and **pointer** parameters. (**Only
       references and pointers**).
5. **All keywords and specifiers that appear after the parameter list but before
   the function body or `;` are considered part of the function signature in
   C++, except for `final` and `override`**:
   - **`const` qualifier**.
   - **Reference qualifiers**: For example, `RetType funcName( ... ) &` (lvalue
     qualifier) is distinct from `RetType funcName( ... ) &&` (rvalue
     qualifier).
     - `&` means the function can only be called on lvalues (objects that have a
       persistent address).
     - `&&` means the function can only be called on rvalues (temporary
       objects).
   - **`volatile` qualifier**: Rarely used, but
     `RetType funcName( ... ) volatile` would be distinct from
     `RetType funcName( ... )`.
     - The `volatile` qualifier indicates that the value of the variable can be
       changed by an external source, such as hardware or another thread.
     - This can prevent optimizations that might otherwise assume the variable
       is not modified unexpectedly.
   - **`noexcpet` qualifier**.
6. However, a function signature in C++ does **not include**:
   - The **return type** of the function.
   - The **const qualifier** of parameters **passed by value** (e.g., `int x`
     vs. `const int x`).
   - The **constexpr** of parameters (e.g., `int x` vs. `constexpr int x`).
   - **Default argument values**.

### Hiding, Overloading, Overriding, and Overwriting

1. [Hiding, Overloading, Overriding, and Overwriting](./HidingOverloadingOverridingAndOverwriting.md)

## `std::function`

1. [`std::function`](./StdBindAndStdFunction.md#stdfunction)

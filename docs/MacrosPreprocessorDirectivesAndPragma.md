<!-- vim-markdown-toc GFM -->

- [Macro, Preprocessor Directives (Including `pragma`) and Other Related Keywords](#macro-preprocessor-directives-including-pragma-and-other-related-keywords)
  - [Macro](#macro)
  - [Preprocessor Directives](#preprocessor-directives)
  - [Syntax](#syntax)
  - [Related Keywords](#related-keywords)
    - [`#ifdef`, `#ifndef`, `#else`, `#endif`](#ifdef-ifndef-else-endif)
      - [Explanation](#explanation)
      - [Syntax](#syntax-1)
    - [`#undef`](#undef)
      - [Explanation](#explanation-1)
      - [Syntax](#syntax-2)
    - [`#include`](#include)
      - [Explanation](#explanation-2)
      - [Syntax](#syntax-3)
    - [`#pragma`](#pragma)
      - [Explanation](#explanation-3)
      - [Syntax](#syntax-4)
    - [`const` and `constexpr`](#const-and-constexpr)
    - [`inline`](#inline)
  - [Related Operators `##` and `#`](#related-operators--and-)
    - [`##`](#)
    - [`#`](#-1)

<!-- vim-markdown-toc -->

## Macro, Preprocessor Directives (Including `pragma`) and Other Related Keywords

### Macro

1. Macros are typically defined using the **preprocessor directive** `#define`,
   which allows for **text substitution** **prior** to the actual
   **compilation** of the code.
2. They are classified as **preprocessor statements**.
3. Macros may **represent** simple **constants** or **complex expressions**.
4. When the preprocessor encounters a macro, it replaces it with the
   corresponding value or code.
5. They enable the **compilation of identical code** to produce varied outcomes
   **based on distinct configurations**.
6. The **backslash (`\`)** can be utilized to create **multi-line macros**.
7. **Excessive use** of macros may adversely **affect** the **readability** of
   the code.
8. **Function-like macros** can be **difficult to debug**.
9. When a macro is defined, from its definition location to the end of the file,
   all code can use it, regardless of whether it is defined inside a code block.
10. **The scope of a macro is global**.
11. This is because the preprocessor doesn’t understand C++ concepts like
    functions.

### Preprocessor Directives

1. **A preprocessor directive** is **a command** that instructs the C or C++
   **preprocessor to perform specific operations** **before the actual
   compilation** of the source code begins.
2. These directives always **start with the `#` symbol** and are **processed by
   the preprocessor**, which runs before the compiler.
3. Directives defined in one file **do not have any impact on other files**
   (**unless they are #included into another file**).

### Syntax

```CPP
#define MACRO_NAME replacement_text
```

```CPP
// Function-like Macros
// para_list without Type specifiers.
#define funcName( para_list ) replacement_text
```

```CPP
// Multi-line Macros
#define MACRO_NAME replacement_text1 \
                   replacement_text2 \
                   ...;
```

### Related Keywords

#### `#ifdef`, `#ifndef`, `#else`, `#endif`

##### Explanation

1. These **preprocessor directives** are used for **conditional compilation**,
   allowing code to be **included or excluded** based on whether a macro is
   defined or not.
2. This can be used as a header guard, similar to `#pragma once`, to resolve
   **duplicate definition problems**.
3. However, these methods **cannot completely eliminate such problems**.
4. For example:
   - There are three files: `Main.cpp`, `Fun.cpp`, and `Header.h`.
   - Both `Main.cpp` and `Fun.cpp` include `Header.h`.
   - `Main.cpp` references something from `Fun.cpp`.
   - `Header.h` contains a global variable definition.
   - When we compile these three files, multiple definition errors occur.
5. Therefore, we **recommend** that **header files only contain templates,
   declarations, and type definitions**.

##### Syntax

```CPP
#ifdef MACRO_NAME
// Code Block
#else
// Code Block
#endif
```

```CPP
#ifdef MACRO_NAME
// Code Block
#else
#define MACRO_NAME replacement_text
#endif
```

```CPP
#ifndef MACRO_NAME
// Code Block
#else
// Code Block
#endif
```

```CPP
#ifndef MACRO_NAME
#define MACRO_NAME replacement_text
#else
// Code Block
#endif
```

#### `#undef`

##### Explanation

1. This **preprocessor directive** is used to **undefine a macro**, making it
   unavailable after that point in the code.

##### Syntax

```CPP
#define MACRO_NAME replacement_text
#undef MACRO_NAME
```

#### `#include`

##### Explanation

1. This **preprocessor directive** is **not a macro** but is often **used with
   macros** to **include header files** where macros may be defined.
2. `#include <HeaderFile>`:
   - This syntax instructs the preprocessor to **search for the specified header
     file** exclusively **in the standard include directories**.
   - It is typically used for **system or library headers**.
3. `#include "path/to/HeaderFile"`:
   - This syntax tells the preprocessor to **look for the specified header file
     in the specific path first**.
   - If it is **not found** there, it then **searches the standard include
     directories**.

##### Syntax

```CPP
#include <HeaderFile>
```

```CPP
#include "path/to/HeaderFile"
```

#### `#pragma`

##### Explanation

1. This **preprocessor directive** provides additional information to the
   compiler, often used for **controlling compiler-specific behaviors** but can
   also be relevant in the context of macros.
2. The `#pragma` directive itself does not belong to compiler extensions—it is a
   standardized part of the C and C++ language specifications.
3. However, the specific `#pragma` directives provided by compilers are often
   compiler extensions, meaning their behavior and availability depend on the
   compiler.
4. Different compilers support different `#pragma` directives. The following
   `#pragma` directives work with GCC/G++ and Clang/Clang++ but may not be
   supported by other compilers.
5. `#pragma once` is supported by most modern C/C++ compilers.

##### Syntax

```CPP
#pragma once  // Ensures the file is included only once.
```

```CPP
#pragma GCC optimize( "ONumber" ) // Controls optimization levels.
```

```CPP
// Controls diagnostic messages (warnings/errors).
#pragma GCC diagnostic push // Save current state.
#pragma GCC diagnostic ignored "-Wunused-variable" // Ignore unused variable warnings.
CPP code; // No warning here.
#pragma GCC diagnostic pop // Restore original state.
```

```CPP
#pragma STDC FENV_ACCESS ON // Enable floating-point environment access.
#pragma STDC FP_CONTRACT OFF // Disable floating-point contraction.
```

#### `const` and `constexpr`

1. These keywords are **alternatives** to macros for **defining constant
   values** with **type safety**.
2. [`const`](./ConstConstexprAndStatic.md#const).
3. [`constexpr`](./ConstConstexprAndStatic.md#constexpr).

#### `inline`

1. This keyword can be used to **define functions** that behave **like macros**
   **but with type checking and scope**.
2. [`inline`](./Functions.md#inline).

### Related Operators `##` and `#`

#### `##`

1. The `##` operator is used to concatenate (paste together) two tokens into a
   single token during macro expansion. This is useful for generating unique
   names or combining identifiers.

#### `#`

1. The `#` operator converts a macro argument into a string literal. It is used
   to create string representations of macro arguments.

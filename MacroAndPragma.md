<!-- vim-markdown-toc GFM -->

- [Macro and Related Keywords ( Including `pragma` )](#macro-and-related-keywords--including-pragma-)
  - [Syntax](#syntax)
  - [Explanation](#explanation)
  - [Related Keywords](#related-keywords)
    - [`#ifdef`, `#ifndef`, `#else`, `#endif`](#ifdef-ifndef-else-endif)
      - [Syntax](#syntax-1)
      - [Explanation](#explanation-1)
    - [`#undef`](#undef)
      - [Syntax](#syntax-2)
      - [Explanation](#explanation-2)
    - [`#include`](#include)
      - [Syntax](#syntax-3)
      - [Explanation](#explanation-3)
    - [`#pragma`](#pragma)
      - [Syntax](#syntax-4)
      - [Explanation](#explanation-4)
    - [`const` and `constexpr`](#const-and-constexpr)
    - [`inline`](#inline)

<!-- vim-markdown-toc -->

## Macro and Related Keywords ( Including `pragma` )

### Syntax

```CPP
#define MACRO_NAME replacement_text
```

```CPP
// Function-like Macros
#define funcName( para_list ) replacement_text
```

```CPP
// Multi-line Macros
#define MACRO_NAME replacement_text1 \
                   replacement_text2 \
                   ...
```

### Explanation

1. Macros in C++ are typically defined using the preprocessor directive `#define`, which allows for
   **text substitution** **prior** to the actual **compilation** of the code. They are classified as
   **preprocessor statements**.
2. Macros may **represent** simple **constants** or **complex expressions**. When the preprocessor
   encounters a macro, it replaces it with the corresponding value or code.
3. They enable the **compilation of identical code** to produce varied outcomes **based on distinct
   configurations**.
4. The **backslash (`\`)** can be utilized to create **multi-line macros**.
5. **Excessive use** of macros may adversely **affect** the **readability** of the code.

### Related Keywords

#### `#ifdef`, `#ifndef`, `#else`, `#endif`

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

##### Explanation

1. These directives are used for **conditional compilation**, allowing code to be **included or
   excluded** based on whether a macro is defined or not.

#### `#undef`

##### Syntax

```CPP
#define MACRO_NAME replacement_text
#undef MACRO_NAME
```

##### Explanation

1. This directive is used to **undefine a macro**, making it unavailable after that point in the
   code.

#### `#include`

##### Syntax

```CPP
#include <HeaderFile>
```

```CPP
#include "path/to/HeaderFile"
```

##### Explanation

1. This directive is **not a macro** but is often **used with macros** to **include header files**
   where macros may be defined.
2. `#include <HeaderFile>`: This syntax instructs the preprocessor to **search for the specified
   header file** exclusively **in the standard include directories**. It is typically used for
   **system or library headers**.
3. `#include "path/to/HeaderFile"`: This syntax tells the preprocessor to **look for the specified
   header file in the specific path first**. If it is **not found** there, it then **searches the
   standard include directories**.

#### `#pragma`

##### Syntax

```CPP
#pragma once  // Ensures the file is included only once
```

##### Explanation

1. This directive provides additional information to the compiler, often used for **controlling
   compiler-specific behaviors** but can also be relevant in the context of macros.

#### `const` and `constexpr`

1. These keywords are **alternatives** to macros for **defining constant values** with **type
   safety**.

#### `inline`

1. This keyword can be used to **define functions** that behave **like macros** **but with type
   checking and scope**.

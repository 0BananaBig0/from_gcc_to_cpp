## Macro and Related Keywords ( Including `pragma` )

### Syntax

```CPP
#define MACRO_NAME replacement_text
```

```CPP
// Function-like Macros
#define funcName( para_list ) replacement_text
```

### Explanation

1. Macros in C++ are typically defined using the preprocessor directive `#define`, which allows for
   text substitution prior to the actual compilation of the code. They are classified as
   preprocessor statements.
2. Macros may represent simple constants or complex expressions. When the preprocessor encounters a
   macro, it replaces it with the corresponding value or code.
3. Excessive use of macros may adversely affect the readability of the code.
4. Macros enable the compilation of identical code to produce varied outcomes based on distinct
   configurations.
5. They can be employed to exclude segments of code that are not intended for compilation at a given
   time.
6. The backslash (`\`) can be utilized to create multi-line macros.

### Related Keywords

#### `#ifdef`, `#ifndef`, `#else`, `#endif`

### Syntax

```CPP
#ifdef MACRO_NAME
#define LOG(msg) std::cout << msg << std::endl
#else
#define LOG(msg)
#endif
```

#### `#undef`

#### `#pragma`

#### `const` and `constexpr`

#### `inline`

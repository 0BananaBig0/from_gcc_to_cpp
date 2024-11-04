<!-- vim-markdown-toc GFM -->

- [Extern Linkage](#extern-linkage)
  - [Explanation](#explanation)
  - [`extern`](#extern)
  - [`extern "C" { ... };`](#extern-c---)
  - [Default Extern Linkage](#default-extern-linkage)

<!-- vim-markdown-toc -->

## Extern Linkage

### Explanation

1. Extern linkage **allows functions and variables to be accessed across different translation
   units**. It enables the sharing of definitions between multiple files in a program.

### `extern`

1. The `extern` keyword is **used to declare variables or functions that are defined in another
   translation unit**. It informs the compiler that the variable or function exists, but its
   definition will be found elsewhere.
2. `extern` can be used to declare global variables or functions in a header file, making them
   accessible across multiple source files.

### `extern "C" { ... };`

1. The `extern "C"` construct specifies that **the enclosed declarations should use C linkage**
   rather than C++ linkage. This is essential for **linking C++ code with C libraries** or when
   **calling C functions from C++**.
2. `extern "C"` should be used to **prevent name mangling** for functions or variables declared
   within it. This ensures compatibility with C code.

### Default Extern Linkage

1. When you declare **a function**, it **has external linkage** unless specified otherwise (for
   example, if declared `static`).
2. This means **the function** can be called from other translation units **without needing the
   `extern` keyword**.

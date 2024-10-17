<!-- vim-markdown-toc GFM -->

* [`auto` and `decltype`](#auto-and-decltype)
  * [`auto`](#auto)
    * [Explanation](#explanation)
    * [Syntax](#syntax)
    * [Usage](#usage)
    * [Characteristics](#characteristics)
    * [Notes](#notes)
  * [`decltype`](#decltype)
    * [Explanation](#explanation-1)
    * [Syntax](#syntax-1)
    * [Usage](#usage-1)
    * [Characteristics](#characteristics-1)
    * [Notes](#notes-1)

<!-- vim-markdown-toc -->
## `auto` and `decltype`

### `auto`

#### Explanation

1. `auto` is **a type specifier** that allows the compiler to **automatically deduce the type** of
   **a variable from its initializer**.
2. This feature, introduced in C++11, is especially useful for **simplifying complex type
   declarations, avoiding redundancy, and making code more readable**.

#### Syntax

```CPP
auto var_name = initializer;
```

#### Usage

1. Variable declarations: Declare variables without specifying their type.
2. Simplifying complex types.
3. Range-Based for Loops. For example, `for( auto var_name : object_name )`.
4. Lambda expressions.
5. Using `auto` with structured bindings. For example `for( auto [x, y] : object_pair_name )`.
   - **Structured bindings**, introduced in C++17, provide a way to unpack tuple-like objects (such
     as `std::pair`, `std::tuple`, and user-defined types with `std::get`) into individual named
     variables.

#### Characteristics

1. Type deduction: The type is **determined at compile time**a.
2. Copy behavior: auto creates **a copy of the original type** unless specified otherwise (e.g.,
   auto& for lvalue references).
3. `const` qualifiers: If initialized with **a const value**, auto **deduces a non-const type**.
4. Initializer lists: When initialized with an initializer list, auto deduces the type to be the
   corresponding container type (e.g., `std::initializer_list`).
5. Type safety: auto maintains type safety by ensuring that the deduced type matches the
   initializer.
6. Simplicity: Reduces verbosity, especially for complex types like iterators or function objects.

#### Notes

1. `auto` can deduce whether a reference is `const` based on the initializer variable. However, for
   non-reference types, `auto` only deduces the type without adding `const`. Therefore, if you want
   variables **deduced with `auto` to be `const`**, you'd better **explicitly specify `const`**.
2. `auto` can deduce whether a type is a pointer based on the initializer.
   `auto var_name = ptr_name;` `<=>` `auto* var_name = ptr_name; \\ **Better**` However, if you use
   `auto` to **deduce a type with a pointer** as the initializer, you'd better **specify it
   explicitly with a star ( `*` )**.
3. `auto` **cannot deduce** whether a type is **a reference** based on the initializer. Therefore,
   If you want the type to be deduced as a reference, **specify it explicitly with `&`**.
   `auto & var_name = ini_name;`
4. Specifically, if the initializer is **a const char pointer** or **a const char array** (such as a
   string literal, "xxx"), auto deduces the variable to be **a const char pointer**.
5. If you **change the return types of your functions or APIs**, `auto` can help us reduce the
   amount of code that needs to be modified. However, the code will become less readable, and some
   bugs may occur because the compiler will not tell us where changes are needed to adapt to these
   new functions. Therefore, you should **avoid using `auto` in this case**.
6. **Use `auto`** when working with **an iterator**, as it can make the code more readable.
7. When calling a function whose **return type has a long name**, you can **use `auto`** to make the
   code more readable.

### `decltype`

#### Explanation

1. **A keyword** allows you to **query the type of an expression** at **compile time** **without
   evaluating it**. This is particularly useful in **template programming** and situations where
   **types are complex or unknown**.

#### Syntax

```CPP
decltype(expression)
```

#### Usage

1. Type deductions: Determine the type of a variable based on another variable.
2. Type deduction in templates.
3. Defining function pointers.
4. Use `decltype` to deduce return types of functions.
5. Using with `auto`.

#### Characteristics

1. The inference result is a **reference type** if the expression is an lvalue enclosed in
   parentheses.
2. Otherwise, the inference result is **the the actual type** of the expression.
3. No evaluation: `decltype` does **not evaluate the expression**; it merely inspects it to
   determine the type.
4. Type safety: Ensures that the deduced type is consistent with the expression, aiding in type-safe
   code.

#### Notes

1. **Use `decltype(expression)&`** instead of `decltype(expression)`, `decltype((expression))`, or
   `decltype((expression))&` if you want to deduce a result as **a reference type**, even if the
   expression is already a reference. Although these four expressions yield the same inference
   result, the first option is preferred.
2. **Add `const`** as a prefix to `decltype(expression)` if you want to **deduce a result as a const
   type**, even if the expression is already a const type.
3. **Use `decltype(expression)`** instead of `decltype(expression)*`, `decltype((expression))`, or
   `decltype((expression))*` if the expression is **a pointer**; the latter three do not yield the
   same inference result as the former.

<!-- vim-markdown-toc GFM -->

- [Function Bindings](#function-bindings)
  - [Explanation](#explanation)
  - [Static Binding](#static-binding)
  - [Dynamic Binding](#dynamic-binding)
- [C++17 Bindings](#c17-bindings)
  - [Explanation](#explanation-1)
  - [Structured Binding](#structured-binding)
    - [Syntax](#syntax)
    - [Explanation](#explanation-2)
  - [`std::tie`](#stdtie)
    - [Syntax](#syntax-1)
    - [Explanation](#explanation-3)
  - [Differences Between Structured Binding and `std::tie`](#differences-between-structured-binding-and-stdtie)

<!-- vim-markdown-toc -->

## Function Bindings

### Explanation

1. Function binding in C++ refers to **the association** between **a function call** and **the
   actual function definition that gets executed**.
2. This process can **occur at different times**, leading to **two main types** of binding:
   **static** binding and **dynamic** binding.

### Static Binding

1. Static binding, also known as **early binding**, occurs **at compile time**.
2. The compiler determines **which function** to **call** **based on the type of the reference or
   pointer**, not the actual object.
3. This means that the **function call** is **resolved before** the program **runs**, leading to
   **faster execution** since no additional checks are needed at runtime.
4. Static binding is used for **non-virtual functions**, **function overloading**, and **static
   method calls**.
5. This binding method is generally more **efficient** due to compile-time resolution, making it a
   preferred choice when polymorphism is not needed.

### Dynamic Binding

1. Dynamic binding, or **late binding**, occurs **at runtime**.
2. The actual **function** to **call** is **determined** by **the type of the object being pointed**
   to rather than the type of the reference or pointer.
3. This allows for **polymorphic behavior**, where the program can decide **which function to invoke
   based on the actual object at runtime**.
4. Dynamic binding is primarily used with **virtual functions** in class hierarchies, enabling
   **polymorphism**.
5. This approach provides greater **flexibility** but incurs **a slight performance overhead** due
   to the need for **runtime type checks**, typically using a virtual table (vtable) to resolve
   function calls.

## C++17 Bindings

### Explanation

1. C++17 bindings provide a way to **unpack elements** from tuple-like objects, making it easier to
   work with **multiple return values** from functions or complex data structures.
2. This improves **code clarity** and **reduces boilerplate code**.

### Structured Binding

#### Explanation

1. Structured binding allows you to **declare multiple variables** that can simultaneously **hold
   the values** extracted from **tuple-like structures** (such as `std::tuple`, `std::pair`, arrays,
   or user-defined types).
2. It simplifies the syntax for unpacking values and allows for more expressive code.
3. **The number of variables** in `[var1, var2, ...]` is equal to **the number of values** provided
   by the `initializer`.

#### Syntax

```CPP
auto [var1, var2, ...] = initializer;
```

```CPP
auto& [var1, var2, ...] = initializer;
```

```CPP
// Use it with a range-based for loop
for ( auto& [var1, var2, ...] : container );
```

### `std::tie`

#### Explanation

1. `std::tie` **creates a tuple of non-const references**, allowing you to **unpack values** from
   **a tuple-like structure** (such as `std::tuple`, `std::pair`, or similar) **without copying**
   them.
2. This is particularly useful when working with functions that return **multiple values** in
   **tuple format**.
3. The **`initializer`** passed to `std::tie` must evaluate to **a tuple-like structure**, such as
   `std::tuple` or `std::pair`. It will **not work** with types that **lack a tuple-like
   interface**, such as `std::get`.
4. `std::tie` should **not** be used to **bind a temporary object** to avoid **undefined behavior**.

#### Syntax

```CPP
Type1 var1;
Type2 var2;
...
std::tie( var1, var2, ... ) = initializer;
```

### Differences Between Structured Binding and `std::tie`

1. Their syntax differs.
2. **Structured binding** can unpack all values from the initializer into new **variables or
   references**, while **`std::tie`** only binds these values to **references**.
3. **Structured binding** can bind **a wider variety of types** than `std::tie`, as it can unpack
   values from any tuple-like structure, **including arrays and user-defined types** that implement
   the necessary interface, while **`std::tie`** is **limited** to binding **only** to **existing
   variables** and specifically works with **tuples or pairs**.

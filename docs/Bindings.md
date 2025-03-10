<!-- vim-markdown-toc GFM -->

- [Function Binding](#function-binding)
  - [Explanation](#explanation)
  - [Static Binding (Early Binding)](#static-binding-early-binding)
  - [Dynamic Binding (Late Binding)](#dynamic-binding-late-binding)
- [C++17 Bindings](#c17-bindings)
  - [Explanation](#explanation-1)
  - [Structured Binding](#structured-binding)
    - [Explanation](#explanation-2)
    - [Syntax](#syntax)
  - [`std::tie`](#stdtie)
    - [Explanation](#explanation-3)
    - [Syntax](#syntax-1)
  - [Differences Between Structured Binding and `std::tie`](#differences-between-structured-binding-and-stdtie)
  - [Pairs and Tuples](#pairs-and-tuples)
- [`std::bind`](#stdbind)
- [Other Bindings](#other-bindings)
  - [Variable Binding](#variable-binding)
  - [Name Binding](#name-binding)
  - [Object Binding](#object-binding)
  - [Template Binding](#template-binding)
  - [Scope Binding](#scope-binding)
  - [Reference Binding](#reference-binding)
  - [Constant Binding](#constant-binding)

<!-- vim-markdown-toc -->

## Function Binding

### Explanation

1. Function binding refers to **the association** between **a function call**
   and **the actual function definition that gets executed**.
2. This process can **occur at different times**, leading to **two main types**
   of binding: **static** binding and **dynamic** binding.

### Static Binding (Early Binding)

1. Static binding, also known as **early binding**, occurs **at compile time**.
2. The compiler determines **which function** to **call** **based on the type of
   the reference or pointer**, not the actual object.
3. This means that the **function call** is **resolved before** the program
   **runs**, leading to **faster execution** since no additional checks are
   needed at runtime.
4. Static binding is used for **non-virtual functions**, **function
   overloading**, and **static method calls**.
5. This binding method is generally more **efficient** due to compile-time
   resolution, making it a preferred choice when polymorphism is not needed.

### Dynamic Binding (Late Binding)

1. Dynamic binding, or **late binding**, occurs **at runtime**.
2. The actual **function** to **call** is **determined** by **the type of the
   object being pointed** to rather than the type of the reference or pointer.
3. This allows for **polymorphic behavior**, where the program can decide
   **which function to invoke based on the actual object at runtime**.
4. Dynamic binding is primarily used with **virtual functions** in class
   hierarchies, enabling **polymorphism**.
5. This approach provides greater **flexibility** but incurs **a slight
   performance overhead** due to the need for **runtime type checks**, typically
   using a virtual table (vtable) to resolve function calls.

## C++17 Bindings

### Explanation

1. C++17 bindings provide a way to **unpack elements** from tuple-like objects,
   making it easier to work with **multiple return values** from functions or
   complex data structures.
2. This improves **code clarity** and **reduces boilerplate code**.

### Structured Binding

#### Explanation

1. Structured binding allows you to **declare multiple variables** that can
   **simultaneously hold the values** extracted from **tuple-like structures**
   (such as `std::tuple`, `std::pair`, fixed-size arrays, or user-defined
   types).
2. It simplifies the syntax for unpacking values and allows for more expressive
   code.
3. **The number of variables** in `[var1, var2, ...]` is equal to **the number
   of values** provided by the `tuple_like_structure`.

#### Syntax

```CPP
// Decomposition.
// Except for fixed-size arrays, `std::tuple`, and `std::pair`, other containers can only use this
// syntax to work with a single tuple-like element.
auto [var1, var2, ...] = tuple_like_structure;
```

```CPP
// Decomposition.
// Except for fixed-size arrays, `std::tuple`, and `std::pair`, other containers can only use this
// syntax to work with a single tuple-like element.
auto& [var1, var2, ...] = tuple_like_structure;
```

```CPP
// Decomposition with a range-based for loop.
// All containers can use structured bindings when iterating over elements.
for ( auto& [var1, var2, ...] : container ) { ...; };
```

```CPP
// Decomposition with a range-based for loop.
// All containers can use structured bindings when iterating over elements.
for ( auto var: container ) { ...; };
```

```CPP
// Decomposition with a range-based for loop.
// All containers can use structured bindings when iterating over elements.
for ( Type var: container ) { ...; };
```

### `std::tie`

#### Explanation

1. `std::tie` **creates a tuple of non-const references**, allowing you to
   **unpack values** from **a tuple-like structure** (such as `std::tuple`,
   `std::pair`, or similar) **without copying** them.
2. This is particularly useful when working with functions that return
   **multiple values** in **tuple format**.
3. The **`tuple_like_structure`** passed to `std::tie` must evaluate to **a
   tuple-like structure**, such as `std::tuple` or `std::pair`. It will **not
   work** with types that **lack a tuple-like interface**, such as `std::get`.
4. `std::tie` should **not** be used to **bind a temporary object** to avoid
   **undefined behavior**.

#### Syntax

```CPP
Type1 var1;
Type2 var2;
...;
std::tie( var1, var2, ... ) = tuple_like_structure;
```

### Differences Between Structured Binding and `std::tie`

1. Their syntax differs.
2. **Structured binding** can unpack all values from the `tuple_like_structure`
   into new **variables or references**, while **`std::tie`** only binds these
   values to **references**.
3. **Structured binding** can bind **a wider variety of types** than `std::tie`,
   as it can unpack values from any tuple-like structure, **including arrays and
   user-defined types** that implement the necessary interface, while
   **`std::tie`** is **limited** to binding **only** to **existing variables**
   and specifically works with **tuples or pairs**.

### Pairs and Tuples

1. [Pairs and Tuples](./PairsAndTuples.md)

## `std::bind`

1. [`std::bind`](./StdBindAndStdFunction.md#stdbind)

## Other Bindings

### Variable Binding

1. Variable binding involves associating **a variable** with **a specific memory
   location** where its value is stored.
2. The binding defines the variable's **lifetime and scope** within the program.
3. Once a variable is declared, it remains bound to its memory location until it
   goes out of scope or is explicitly deallocated.

### Name Binding

1. Name binding refers to the process of associating **an identifier** (such as
   a variable, function, or class name) with **its corresponding entity** during
   the compilation phase.
2. This binding is crucial for resolving names and ensuring that the correct
   entity is referenced throughout the program.

### Object Binding

1. Object binding involves associating **an object instance** with **its class
   definition**.
2. This binding allows the object to **access the class's member functions and
   variables**.
3. The object is bound to **the class's interface**, providing the necessary
   context for member function calls.

### Template Binding

1. Template binding occurs when **template parameters** are associated with
   **specific types or values** during the instantiation of templates.
2. This process allows C++ to **create type-safe generic functions and
   classes**, enabling **code reuse** without sacrificing type safety.
3. The binding is determined by the types provided at the point of
   instantiation.

### Scope Binding

1. Scope binding defines **the region** within which **a name is valid**.
2. Names can be bound to **different scopes**, including **local, global, and
   class scopes**.
3. This binding determines **the visibility and lifetime** of the name,
   influencing **how and where it can be accessed** in the code.

### Reference Binding

1. Reference binding occurs when **a reference variable** is associated with
   **an existing variable**.
2. The reference serves as **an alias** for **the original variable**, allowing
   modifications made through the reference to affect the original.
3. This binding provides a way to create direct connections to existing
   variables without copying their values.

### Constant Binding

1. Constant binding refers to the association of **a variable** with **a
   constant value** that cannot be changed after its initialization.
2. This binding is important for enforcing immutability, ensuring that certain
   values remain fixed throughout the program's execution.
3. Constant binding helps maintain program integrity and prevents unintended
   modifications.

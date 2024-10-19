<!-- vim-markdown-toc GFM -->

* [`enum`](#enum)
  * [Explanation](#explanation)
  * [Purpose](#purpose)
  * [Examples of Unscoped Enumeration](#examples-of-unscoped-enumeration)
  * [Examples of Scoped Enumeration ( C++11 )](#examples-of-scoped-enumeration--c11-)
  * [The Difference Between `enum` ( Unscoped Enumeration ) and `enum class` ( Scoped Enumeration )](#the-difference-between-enum--unscoped-enumeration--and-enum-class--scoped-enumeration-)
    * [1) Syntax](#1-syntax)
    * [2) Namespace Scoping](#2-namespace-scoping)
    * [3) Type Safety](#3-type-safety)
    * [4) Underlying Type](#4-underlying-type)
    * [5) Forward Declaration](#5-forward-declaration)
    * [6) Bitwise Operations](#6-bitwise-operations)

<!-- vim-markdown-toc -->
## `enum`

### Explanation

1. An enum (short for "enumeration") is **a user-defined type** that consists of **a set of** named
   integral **constants**, providing a way to define a collection of related constants with
   meaningful names. Enumerations improve code readability by replacing numeric values with
   descriptive names.

### Purpose

1. If you need to represent some states with integers, you can use an enum to group and represent
   them.

### Examples of Unscoped Enumeration

```CPP
enum Color {
   Red,         // 0
   Green = 3,   // 3
   Blue         // 4
};

Color myColor = Green;
```

### Examples of Scoped Enumeration ( C++11 )

```CPP
enum class Color : char {
   Red = 'r',
   Green = 'g',
   Blue = 'b'
};

Color myColor = Color::Green;
```

### The Difference Between `enum` ( Unscoped Enumeration ) and `enum class` ( Scoped Enumeration )

#### 1) Syntax

#### 2) Namespace Scoping

1.  `enum`: Enum values injected into enclosing scope.
2.  `enum class`: Enum values scoped within the enum type.

#### 3) Type Safety

1.  `enum`: Implicitly converts to int.
2.  `enum class`: No implicit conversions.

#### 4) Underlying Type

1.  `enum`: Cannot specify underlying type explicitly.
2.  `enum class`: Can specify underlying type (e.g., `enum class Color : unsigned int`).

#### 5) Forward Declaration

1.  `enum`: Not allowed.
2.  `enum class`: Allowed.

#### 6) Bitwise Operations

1. `enum`: Allowed without extra effort.
2. `enum class`: Not allowed without operator overloading.

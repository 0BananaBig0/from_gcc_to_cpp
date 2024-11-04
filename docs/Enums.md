<!-- vim-markdown-toc GFM -->

- [Enums (`enum`)](#enums-enum)
  - [Explanation](#explanation)
  - [Usage](#usage)
  - [Unscoped Enumeration Syntax](#unscoped-enumeration-syntax)
  - [Scoped Enumeration Syntax](#scoped-enumeration-syntax)
  - [Differences Between `enum` ( Unscoped Enumeration ) and `enum class` ( Scoped Enumeration )](#differences-between-enum--unscoped-enumeration--and-enum-class--scoped-enumeration-)
    - [1) Syntax](#1-syntax)
    - [2) Namespace Scoping](#2-namespace-scoping)
    - [3) Type Safety](#3-type-safety)
    - [4) Underlying Type](#4-underlying-type)
    - [5) Forward Declaration](#5-forward-declaration)
    - [6) Bitwise Operations](#6-bitwise-operations)

<!-- vim-markdown-toc -->

## Enums (`enum`)

### Explanation

1. An enum (short for "enumeration") is **a user-defined type** that consists of **a set of** named
   integral **constants**, providing a way to define a collection of related constants with
   meaningful names.
2. Enumerations improve code **readability** by replacing numeric values with descriptive names.

### Usage

1. **Represent some states with integers** by using an enum to group and represent them.

### Unscoped Enumeration Syntax

```CPP
enum EnumName {
   Mem1,            // 0
   Mem2,            // 1
   ...; Memn = n,   // n
   Memn1            // n + 1
};

EnumName enum_name = Mem2;
```

### Scoped Enumeration Syntax

```CPP
enum EnumName: Type {
   Mem1,            // 0
   Mem2,            // 1
   ...; Memn = n,   // n
   Memn1            // n + 1
};

EnumName enum_name = EnumName::Mem2;
```

### Differences Between `enum` ( Unscoped Enumeration ) and `enum class` ( Scoped Enumeration )

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

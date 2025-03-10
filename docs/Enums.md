<!-- vim-markdown-toc GFM -->

- [Enums (`enum`)](#enums-enum)
  - [Explanation](#explanation)
  - [Usage](#usage)
  - [Unscoped Enumeration Syntax](#unscoped-enumeration-syntax)
  - [Scoped Enumeration Syntax](#scoped-enumeration-syntax)
  - [Unscoped Enumeration Syntax with a Scope](#unscoped-enumeration-syntax-with-a-scope)
  - [Differences Between `enum` (Unscoped Enumeration) and `enum class` (Scoped Enumeration)](#differences-between-enum-unscoped-enumeration-and-enum-class-scoped-enumeration)
    - [Syntax](#syntax)
    - [Namespace Scoping](#namespace-scoping)
    - [Type Safety](#type-safety)
    - [Underlying Type](#underlying-type)
    - [Forward Declaration](#forward-declaration)
    - [Bitwise Operations](#bitwise-operations)

<!-- vim-markdown-toc -->

## Enums (`enum`)

### Explanation

1. An enum (short for "enumeration") is **a user-defined type** that consists of
   **a set of** named integral **constants**, providing a way to define a
   collection of related constants with meaningful names.
2. Enumerations improve code **readability** by replacing numeric values with
   descriptive names.

### Usage

1. **Represent some states with integers** by using an enum to group and
   represent them.

### Unscoped Enumeration Syntax

```CPP
enum EnumName {
   MEM1,   // 0
   MEM2,   // 1
   ...,
   MEMN = n,   // n
   MEMN1,       // n + 1
   ...
};

EnumName enum_name = MEM2;
```

### Scoped Enumeration Syntax

```CPP
enum EnumName : Type {
   MEM1,   // 0
   MEM2,   // 1
   ...,
   MEMN = n,   // n
   MEMN1       // n + 1
   ...
};

EnumName enum_name = EnumName::MEM2;
```

### Unscoped Enumeration Syntax with a Scope

```CPP
Class ClassName {
   enum EnumName {
      MEM1,   // 0
      MEM2,   // 1
      ...,
      MEMN = n,   // n
      MEMN1,      // n + 1
      ...
   };
};

EnumName enum_name = ClassName::MEM2;
```

### Differences Between `enum` (Unscoped Enumeration) and `enum class` (Scoped Enumeration)

#### Syntax

#### Namespace Scoping

1. `enum`: Enum values injected into enclosing scope.
2. `enum class`: Enum values scoped within the enum type.

#### Type Safety

1. `enum`: Implicitly converts to int.
2. `enum class`: No implicit conversions.

#### Underlying Type

1. `enum`: Cannot specify underlying type explicitly.
2. `enum class`: Can specify underlying type (e.g.,
   `enum class Color : unsigned int`).

#### Forward Declaration

1. `enum`: Not allowed.
2. `enum class`: Allowed.

#### Bitwise Operations

1. `enum`: Allowed without extra effort.
2. `enum class`: Not allowed without operator overloading.

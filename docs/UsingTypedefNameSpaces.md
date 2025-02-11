<!-- vim-markdown-toc GFM -->

- [`using` and `typedef`](#using-and-typedef)
  - [`using`](#using)
    - [Explanation](#explanation)
    - [Syntax](#syntax)
    - [Usage](#usage)
  - [`typedef`](#typedef)
    - [Explanation](#explanation-1)
    - [Syntax](#syntax-1)
    - [Usage](#usage-1)
  - [Notes](#notes)
- [`namespace`](#namespace)
  - [Explanation](#explanation-2)
  - [Declaration Syntax](#declaration-syntax)
  - [Definition Syntax or How to Add a Member into a Defined or Declared `namespace`](#definition-syntax-or-how-to-add-a-member-into-a-defined-or-declared-namespace)
  - [How to Reference a Member from a `namespace`](#how-to-reference-a-member-from-a-namespace)
  - [`using namespace SpaceName`](#using-namespace-spacename)
    - [Disadvantages](#disadvantages)
  - [Notes](#notes-1)

<!-- vim-markdown-toc -->

## `using` and `typedef`

### `using`

#### Explanation

1. `using` is **a keyword** and has multiple uses, each serving a different
   purpose depending on the context.
2. It can be used for **type aliasing**, **namespace introduction (not
   recommend)**, and **template aliasing**.
3. It offers more flexibility compared to `typedef`, particularly when working
   with templates.

#### Syntax

```CPP
using AliasName = Type;
```

#### Usage

1. Syntax simplicity.
2. Template aliases. (**No limitations**).
   ```CPP
   // `ClassName` is a template class that has been implmented.
   template< typename T, ... > using AliasName = ClassName< T, ... >;
   ```
   ```CPP
   // `StructName` is a template structure that has been implmented.
   template< typename T, ... > using AliasName = StructName< T, ... >;
   ```
   ```CPP
   // `funcName` is a template function that has been implmented.
   template< typename T, ... > using aliasName = funcName< T, ... >;
   ```
3. Function pointer declaration.
   ```CPP
   using FuncPtrName = RetType ( * )( parameter_types );
   FuncPtrName func_ptr_name;
   // using funcPtrName = RetType ( SpaceName::* )( ... );   // Alias for member function
   // using funcPtrName = RetType ( ClassName::* )( ... );   // Alias for member function
   ```
4. Alias for member types in classes.
   ```CPP
   class ClassName {
      public:
         // Using alias.
         using AliasName = Type;
         AliasName _mem;
   };
   ```
5. Alias for an array.
   ```CPP
   using AliasName = Type[size];
   AliasName arr_name;
   // using AliasName = Type[];
   // AliasName arr_name = { ... };
   ```

### `typedef`

#### Explanation

1. `typedef` is **a keyword** used to **create an alias for a data type**,
   allowing you to define new names for existing types.
2. This can improve code readability, simplify complex type definitions, and
   enhance maintainability by making it easier to manage changes in data types
   throughout your code.

#### Syntax

```CPP
typedef Type AliasName;
```

#### Usage

1. Syntax simplicity.
2. Template aliases. (**Only allows inside a struct or class, but not allows
   outside of a struct or class**).
   ```CPP
   // `ClassName` is a template class that has been implmented.
   template< typename T, ... > class ClassName< T, ... > { ...; };
   // `StructName` is a template structure that has been implmented.
   template< typename T, ... > StructName{
      typedef Classname< T, ... > AliasName;
      ...;
   }
   ```
3. Function pointer declaration.
   ```CPP
   typedef RetType ( *FuncPtrName )( parameter_types );
   FuncPtrName func_ptr_name;
   // typedef RetType ( SpaceName::*FuncPtrName )( parameter_types );
   // typedef RetType ( ClassName::*FuncPtrName )( parameter_types );
   ```
4. Alias for member types in classes.
   ```CPP
   class ClassName {
      public:
         // Using `typedef`.
         typedef Type AliasName;
         AliasName _mem;
   };
   ```
5. Alias for an array.
   ```CPP
   Typedef Type AliasName[size];
   AliasName arr_name;
   // Typedef Type AliasName[];
   // AliasName arr_name = { ... };
   ```
6. Define multiple alias names in a single line.
   ```CPP
   typedef Type TypeAlias, *PtrAlias, (&FunRefAlias)( parameter_types ), ArrayAlias[size];
   TypeAlias var_name;
   PtrAlias var_ptr;
   FunRefAlias fun_ref = ...;
   ArrayAlias arr_name;
   ```

### Notes

1. Using `using` is generally better than using `typedef` for aliasing a data
   type, especially in modern C++ (C++11 and beyond).
2. Both `typedef` and `using` in C++ (and `typedef` in C) create type aliases.
3. These aliases are only for valid type specifiers, such as fundamental types
   (`int`, `float`, `char`, etc.), user-defined types (`struct`, `class`, etc.),
   pointers, arrays, function types, etc.
4. Any other string in the `typedef` or `using` declaration but not in `{}` or
   `()` serves as the alias name and must not conflict with C/C++ keywords.

## `namespace`

### Explanation

1. A `namespace` is **a way to organize and group related classes, functions,
   variables, and other identifiers** to **avoid name conflicts**.
2. It provides a logical structure that helps manage large codebases,
   particularly when multiple libraries or modules are used that might define
   identifiers with the same names.
3. It was designed primarily as a mechanism for preventing naming collisions.
4. In fact, if classes, functions, variables, and other identifiers are not
   defined within a named `namespace`, they are defined in the **global
   namespace**, which is sometimes mistakenly referred to as an anonymous
   `namespace`.

### Declaration Syntax

```CPP
namespace SpaceName {};
```

### Definition Syntax or How to Add a Member into a Defined or Declared `namespace`

```CPP
namespace SpaceName {
    ...;
  };
```

```CPP
namespace SpaceName = AnotherSpaceName;
```

```CPP
namespace SpaceName = SpaceNameA::SpaceNameB;
```

### How to Reference a Member from a `namespace`

```CPP
SpaceName::member;
```

### `using namespace SpaceName`

```CPP
using SpaceNameA::SpaceNameB;
```

```CPP
using namespace SpaceNameA;
using namespace SpaceNameB;
```

```CPP
using namespace SpaceNameA::SpaceNameB;
```

#### Disadvantages

1. It's **difficult** to determine from **which** namespace a **function is
   being called** if both namespaces contain a function **with the same name**.
   There are multiple scenarios:
   - Both functions have **the same signature**.
   - Both functions do not have the same signature, but **implicit conversion**
     can occur between their parameters.

### Notes

1. **Do not use it** in header files, but it can be **used within a small
   scope**, such as a function or an if statement.
2. `::xxx` is used to reference `xxx` defined in the global namespace from
   within any namespace because the global namespace is also considered an
   anonymous namespace.
3. In multi-team organizations, two-level or even three-level namespaces are
   often used to prevent naming conflicts between code generated by different
   teams.
4. Variables declared inside a namespace are also global variables.

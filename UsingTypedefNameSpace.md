<!-- vim-markdown-toc GFM -->

* [`using` and `typedef`](#using-and-typedef)
  * [`using`](#using)
    * [Explanation](#explanation)
    * [Syntax](#syntax)
    * [Usage](#usage)
  * [`typedef`](#typedef)
    * [Explanation](#explanation-1)
    * [Syntax](#syntax-1)
    * [Usage](#usage-1)
* [`namespace`](#namespace)
  * [Explanation](#explanation-2)
  * [Declaration Syntax](#declaration-syntax)
  * [Definition Syntax or How to Add a Member into a Defined or Declared `namespace`](#definition-syntax-or-how-to-add-a-member-into-a-defined-or-declared-namespace)
  * [How to Reference a Member from a `namespace`](#how-to-reference-a-member-from-a-namespace)
  * [`using namespace SpaceName`](#using-namespace-spacename)
    * [Disadvantages](#disadvantages)
  * [Notes](#notes)

<!-- vim-markdown-toc -->

## `using` and `typedef`

### `using`

#### Explanation

1. `using` is **a keyword** and has multiple uses, each serving a different purpose depending on the
   context.
2. It can be used for **type aliasing**, **namespace introduction (not recommend)**, and **template
   aliasing**. It offers more flexibility compared to `typedef`, particularly when working with
   templates.

#### Syntax

```CPP
using YourTypeName = Type;
```

#### Usage

1. Syntax simplicity.
2. Template aliases.
   ```CPP
   template< typename T > using YourTypeName = ClassName< T >;
   ```
   ```CPP
   template< typename T > using YourFunctionName = funcName< T >;
   ```
3. Function pointer declaration.
   ```CPP
   using FuncPtrName = RetType ( * )( parameter_types );
   FuncPtrName func_ptr_name;
   ```
4. Alias for member types in classes.
   ```CPP
   class ClassB {
      public:
         // Using alias
         using YourTypeName = ClassB;
         YourTypeName _mem;
   };
   ```

### `typedef`

#### Explanation

1. `typedef` is **a keyword** used to **create an alias for a data type**, allowing you to define
   new names for existing types.
2. This can improve code readability, simplify complex type definitions, and enhance maintainability
   by making it easier to manage changes in data types throughout your code.

#### Syntax

```CPP
typedef Type YourTypeName;
```

#### Usage

1. Syntax simplicity.
2. Function pointer declaration.
   ```CPP
   typedef RetType ( *FuncPtrName )( parameter_types );
   FuncPtrName func_ptr_name;
   ```
3. Alias for member types in classes.
   ```CPP
   class ClassB {
      public:
         // Using typedef
         typedef ClassB YourTypeName;
         YourTypeName _mem;
   };
   ```

## `namespace`

### Explanation

1. A `namespace` is **a way to organize and group related classes, functions, variables, and other
   identifiers** to **avoid name conflicts**. It provides a logical structure that helps manage
   large codebases, particularly when multiple libraries or modules are used that might define
   identifiers with the same names.
2. In fact, if we do not implement our classes, functions, variables, and other identifiers within a
   named `namespace`, they are implemented in **an anonymous `namespace`**.

### Declaration Syntax

```CPP
namespace SpaceName {};
```

### Definition Syntax or How to Add a Member into a Defined or Declared `namespace`

```CPP
namespace SpaceName {
    ...
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

1. It's **difficult** to determine from **which** namespace a **function is being called** if both
   namespaces contain a function **with the same name**. There are multiple scenarios:
   - Both functions have **the same signature**.
   - Both functions do not have the same signature, but **implicit conversion** can occur between
     their parameters.

### Notes

1. **Do not use it** in header files, but it can be **used within a small scope**, such as a
   function or an if statement.

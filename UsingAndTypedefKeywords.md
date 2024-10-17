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
   context. It can be used for **type aliasing**, **namespace introduction (not recommend)**, and
   **template aliasing**. It offers more flexibility compared to `typedef`, particularly when
   working with templates.

#### Syntax

```
using YourTypeName = Type;
```

#### Usage

1. Syntax simplicity.
2. Template aliases.
3. Function pointer declaration.
4. Alias for member types in classes.

### `typedef`

#### Explanation

1. `typedef` is **a keyword** used to **create an alias for a data type**, allowing you to define
   new names for existing types. This can improve code readability, simplify complex type
   definitions, and enhance maintainability by making it easier to manage changes in data types
   throughout your code.

#### Syntax

```CPP
typedef Type YourTypeName;
```

#### Usage

1. Syntax simplicity.
2. Function pointer declaration.
3. Alias for member types in classes.

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

1. Code becomes harder to read: It's difficult to determine whether a function is from xxx or if the
   name is a function name.
2. Name conflicts may arise.
3. Ambiguous function calls: For example, consider two functions: functionA has a parameter of type
   const char pointer, and functionB has a parameter of type std::string. Both functions are named
   print, but they differ slightly. If we call the print function and pass "Hello" as an argument,
   it can be confusing which function will be called, functionA or functionB. If an implicit
   conversion occurs, the type of "Hello" can be changed from const char pointer to std::string. In
   fact, functionA will be called because it matches "Hello" better. However, we might intend to
   call functionB, not functionA. This results in a silent runtime error, not a compile-time error.
   It's difficult for us to keep track of this error.

### Notes

1. **Do not use it** in header files, but it can be **used within a small scope**, such as a
   function or an if statement.

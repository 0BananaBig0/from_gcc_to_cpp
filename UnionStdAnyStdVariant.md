<!-- vim-markdown-toc GFM -->

- [Unions](#unions)
  - [Explanation](#explanation)
  - [Synatx](#synatx)
  - [Anonymous Unions](#anonymous-unions)
    - [Explanation](#explanation-1)
    - [Syntax](#syntax)
- [`std::variant` ( Multiple Types of Data in Single Variable )](#stdvariant--multiple-types-of-data-in-single-variable-)
  - [Explanation](#explanation-2)
  - [Synatx](#synatx-1)
  - [Member Functions](#member-functions)
- [`std::any`](#stdany)
  - [Explanation](#explanation-3)
  - [Synatx](#synatx-2)
  - [Member Functions](#member-functions-1)

<!-- vim-markdown-toc -->

## Unions

### Explanation

1. Unions are special data structures that **store different types** of data **in the same memory
   location**.
2. **Only one** of the union **members** can **hold a value** at any given time, which means **the
   size** of a union is **determined by** **the size of** its **largest member**, and **all
   members** in the union **share the same memory**.
3. Typically, we **use an anonymous union**. It allows us to **treat a variable as different types**
   and helps **save memory**.

### Synatx

```CPP
// Definition Syntax
union UnionName {
      Type1 mem1;
      Type2 mem2;
      // Other mems
};
```

```CPP
// Definition Syntax
union UnionName {
      Type1 mem1;
      Type2 mem2;
      // Other mems
} obj;
```

```CPP
// Usage Syntax
UnionName obj;
obj.mem1 = initializer1;   // obj.mem2 will also be set to initializer1.
obj.mem2 = initializer2;   // obj.mem1 will also be set to initializer2.
```

### Anonymous Unions

#### Explanation

1. Anonymous unions are **unions without names**, allowing their **members** to **be accessed
   directly** without the need to qualify them with a union name.
2. This can **simplify code** when the union is used **frequently within a class or structure**.

#### Syntax

```CPP
// Definition Syntax
struct StructName {
      union {
            Type1 _mem1;
            Type2 _mem2;
            // Other mems
      };
};
```

```CPP
// Usage Syntax
StructName obj;
obj._mem1 = initializer1;   // obj._mem2 will also be set to  initializer1.
obj._mem2 = initializer2;   // obj._mem1 will also be set to  initializer2.
```

```CPP
// Definition Syntax
class ClassName {
   public:
      union {
            Type1 _mem1;
            Type2 _mem2;
            // Other mems
      };
};
```

```CPP
// Usage Syntax
ClassName obj;
obj._mem1 = initializer1;   // obj._mem2 will also be set to  initializer1.
obj._mem2 = initializer2;   // obj._mem1 will also be set to  initializer2.
```

## `std::variant` ( Multiple Types of Data in Single Variable )

### Explanation

1. `std::variant` is is **a type-safe union** introduced that allows us to **list various types**
   for a variable, as well as assign and reassign it to different types of values.
2. It functions similarly to a class or a structure, rather than a union. While **a union** is
   **more efficient**, **it** is **type safer**.
3. In some cases, using `std::variant` helps us obtain more information rather than just optional
   data, such as when reading a file.
4. `std::variant` can **store exactly one value at a time** from a predefined set of types. This
   means that while you can specify multiple types when declaring a `std::variant`, it can **only
   hold an instance** of one of those types at any given moment.
5. `std::variant` is **type safer** than `std::any`.

### Synatx

```CPP
// Declaration syntax
#include <variant>
std::variant< TypeList > var_name;
```

```CPP
// Definition syntax
std::variant< TypeList > var_name = initializer;
// Assignment syntax
var_name = val;
```

```CPP
// Checking type
if( std::holds_alternative< Type >( var_name ) ) {
   // Do something
}
```

```CPP
// Retrieving value
Type var_val = std::get< Type >( var_name );
```

```CPP
// Retrieving value
Type& var_val = std::get< Type >( var_name );
```

```CPP
// Checking type and retrieving value
if( auto var_val = std::get_if< Type >( var_name ) ) {
   std::cout << *var_val << std::endl;
   // or std::cout << std::get<Type>(var_name) << std::endl;
   // Do something
}
```

```CPP
// Visit the value
std::visit(
   []( auto&& var_val ) {
      std::cout << var_val << std::endl;
      // Do something
   },
   var_name );
```

```CPP
// Handling invalid access
try {
   Type var_val = std::get< Type >(
      var_name );   // This will throw if myVariant does not hold a double
} catch( const std::bad_variant_access& e ) {
   std::cerr << "Bad variant access: " << e.what() << std::endl;
}
```

### Member Functions

1. [`std::variant` in cplusplus]().
2. [`std::variant` in cppreference](https://en.cppreference.com/w/cpp/utility/variant).

## `std::any`

### Explanation

1. `std::any` is **a type-safe container** for **single values** of **any type**.
2. It can hold **an instance of any type**, enabling you to store heterogeneous values **without
   knowing their types at compile time**.
3. This feature makes `std::any` particularly useful in scenarios like **dynamic type storage and
   type erasure**.
4. When used to **store small-sized variables**, typically **up to 32 bytes** depending on its
   implementation, it functions **similarly to `std::variant`**.
5. However, if **larger sizes** are required, **dynamic allocations** are necessary, which can
   **impact performance**. This feature is **not useful**, and **few programmers use it**.

### Synatx

```CPP
// Declaration syntax
#include <any>
std::any var_name;
```

```CPP
// Definition syntax
std::any var_name = initializer;
// Assignment syntax
var_name = val;
```

```CPP
// Checking type
if( var_name.type() == typeid( Type ) ) {
   // Do something
}
```

```CPP
// Retrieving value
Type var_val = std::any_cast< Type >( var_name );
```

```CPP
// Retrieving value
// Better than the above statement, will be optimized.
Type& var_ref = std::any_cast< Type& >( var_name );
```

```CPP
// Handling invalid casts
try {
   Type var_val = std::any_cast< Type >(
      var_name );   // throws std::bad_any_cast if the type is incorrect
} catch( const std::bad_any_cast& e ) {
   // Handle error
}
```

```CPP
// Resetting the value
var_name.reset();   // clears the stored value
```

### Member Functions

1. [`std::any` in cplusplus]().
2. [`std::any` in cppreference](https://en.cppreference.com/w/cpp/utility/any).

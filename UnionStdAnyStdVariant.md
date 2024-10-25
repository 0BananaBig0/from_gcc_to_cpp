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
  - [Members and Related Stuffs](#members-and-related-stuffs)
    - [Links](#links)
    - [Template parameters](#template-parameters)
    - [Member Functions](#member-functions)
    - [Non-member Functions](#non-member-functions)
    - [Helper classes](#helper-classes)
    - [Helper objects](#helper-objects)
- [`std::any`](#stdany)
  - [Explanation](#explanation-3)
  - [Synatx](#synatx-2)
  - [Members and Related Stuffs](#members-and-related-stuffs-1)
    - [Links](#links-1)
    - [Member Functions](#member-functions-1)
    - [Non-member Functions](#non-member-functions-1)
    - [Helper Classes](#helper-classes-1)
- [`std::optional` ( Optional Data )](#stdoptional--optional-data-)
  - [Explanation](#explanation-4)
  - [Synatx](#synatx-3)
  - [Members and Related Stuffs](#members-and-related-stuffs-2)

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
obj.mem1 = val1;   // obj.mem2 will also be set to val1.
obj.mem2 = val2;   // obj.mem1 will also be set to val2.
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
obj._mem1 = val1;   // obj._mem2 will also be set to  val1.
obj._mem2 = val2;   // obj._mem1 will also be set to  val2.
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
obj._mem1 = val1;   // obj._mem2 will also be set to  val1.
obj._mem2 = val2;   // obj._mem1 will also be set to  val2.
```

## `std::variant` ( Multiple Types of Data in Single Variable )

### Explanation

1. `std::variant` is is **a type-safe union** introduced that allows us to **list various types**
   for a variable, as well as assign and reassign it to different types of values.
2. It functions similarly to **a template class** or **a template structure**, rather than a union.
   While **a union** is **more efficient**, **it** is **type safer**.
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
std::variant< TypeList > var_name = val;
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
   // or std::cout << std::get< Type >( var_name ) << std::endl;
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

### Members and Related Stuffs

#### Links

1. [`std::variant` in cplusplus]().
2. [`std::variant` in cppreference](https://en.cppreference.com/w/cpp/utility/variant).

#### Template parameters

1. `Types`: The types that may be stored in this variant. All types must meet the Destructible
   requirements (in particular, array types and non-object types are not allowed).

#### Member Functions

1. (constructor): Constructs the variant object (public member function).
2. (destructor): Destroys the variant, along with its contained value (public member function).
3. `operator=`: Assigns a variant (public member function).
4. `index`: Returns the zero-based index of the alternative held by the variant (public member
   function).
5. `valueless_by_exception`: Checks if the variant is in the invalid state (public member function).
6. `emplace`: Constructs a value in the variant, in place (public member function).
7. `swap`: Swaps with another variant (public member function).
8. `visit` (C++26): Calls the provided functor with the argument held by the variant (public member
   function).

#### Non-member Functions

1. `visit` (C++17): Calls the provided functor with the arguments held by one or more variants
   (function template).
2. `holds_alternative` (C++17): Checks if a variant currently holds a given type (function
   template).
3. `get( std::variant )` (C++17): Reads the value of the variant given the index or the type (if the
   type is unique), throws on error (function template).
4. `get_if` (C++17): Obtains a pointer to the value of a pointed-to variant given the index or the
   type (if unique), returns null on error (function template).
5. `operator==/!=/</<=/>/>=` ( C++ 17 ), `operator<=>` (C++20): Compares variant objects as their
   contained values (function template).
6. `std::swap( std::variant )` (C++17): Specializes the `std::swap` algorithm (function template).

#### Helper classes

1. `monostate` (C++17): Placeholder type for use as the first alternative in a variant of
   non-default-constructible types (class).
2. `bad_variant_access` (C++17): Exception thrown on invalid accesses to the value of a variant
   (class).
3. `variant_size` (C++17), `variant_size_v` (C++17): Obtains the size of the variant's list of
   alternatives at compile time (class template) (variable template).
4. `variant_alternative`, `variant_alternative_t` (C++17): Obtains the type of the alternative
   specified by its index, at compile time (class template) (alias template).
5. `std::hash< std::variant >` (C++17): Hash support for `std::variant` (class template
   specialization).

#### Helper objects

1. `variant_npos` (C++17): Index of the variant in the invalid state (constant).

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
std::any var_name = val;
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

### Members and Related Stuffs

#### Links

1. [`std::any` in cplusplus]().
2. [`std::any` in cppreference](https://en.cppreference.com/w/cpp/utility/any).

#### Member Functions

1. (constructor): Constructs an any object (public member function).
2. (destructor): Destroys an any object (public member function).
3. `operator=`: Assigns an any object (public member function).
4. `emplace`: Change the contained object, constructing the new object directly (public member
   function).
5. `reset`: Destroys contained object (public member function).
6. `swap`: Swaps two any objects (public member function).
7. `has_value`: Checks if object holds a value (public member function).
8. `type`: Returns the typeid of the contained value (public member function).

#### Non-member Functions

1. `std::swap( std::any )` (C++17): Specializes the `std::swap` algorithm (function).
2. `any_cast` (C++17): Type-safe access to the contained object (function template).
3. `make_any` (C++17): Creates an any object (function template).

#### Helper Classes

1. `bad_any_cast` (C++17): Exception thrown by the value-returning forms of `any_cast` on a type
   mismatch (class).

## `std::optional` ( Optional Data )

### Explanation

### Synatx

### Members and Related Stuffs

<!-- (52) optional data: It is a new feature introduced in C++17 that allows us to determine whether the -->
<!-- data is accessible. This feature makes our code cleaner. An example is using it to determine whether -->
<!-- we successfully read a file. -->
<!--   std::optional< Type > var_name = functionName(); -->
<!--   Type default_value = var_name.value_or(a default value you want); -->
<!--   if( var_name.has_value() ) { // or if( var_name ) { -->
<!--     Type& val_name = *var_name; -->
<!--     // or Type& val_name = var_name.value(); -->
<!--     ... -->
<!--     }; // or -->

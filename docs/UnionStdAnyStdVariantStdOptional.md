<!-- vim-markdown-toc GFM -->

- [Unions](#unions)
  - [Explanation](#explanation)
  - [Synatx](#synatx)
  - [Anonymous Unions](#anonymous-unions)
    - [Explanation](#explanation-1)
    - [Syntax](#syntax)
- [`std::variant` (Multiple Types of Data in Single Variable)](#stdvariant-multiple-types-of-data-in-single-variable)
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
- [`std::optional` (Optional Data)](#stdoptional-optional-data)
  - [Explanation](#explanation-4)
  - [Synatx](#synatx-3)
  - [Members and Related Stuffs](#members-and-related-stuffs-2)
    - [Links](#links-2)
    - [Template parameters](#template-parameters-1)
    - [Member Types](#member-types)
    - [Member Functions](#member-functions-2)
    - [Non-member functions](#non-member-functions-2)
    - [Helper classes](#helper-classes-2)
    - [Helpers](#helpers)
    - [Helper specializations](#helper-specializations)

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
// Definition syntax.
union UnionName {
      Type1 mem1;
      Type2 mem2;
      // Other mems.
};
```

```CPP
// Definition syntax.
union UnionName {
      Type1 mem1;
      Type2 mem2;
      // Other mems.
} obj;
```

```CPP
// Usage syntax.
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
// Definition syntax.
struct StructName {
      union {
            Type1 _mem1;
            Type2 _mem2;
            // Other mems.
      };
};
```

```CPP
// Usage syntax.
StructName obj;
obj._mem1 = val1;   // obj._mem2 will also be set to  val1.
obj._mem2 = val2;   // obj._mem1 will also be set to  val2.
```

```CPP
// Definition syntax.
class ClassName {
   public:
      union {
            Type1 _mem1;
            Type2 _mem2;
            // Other mems.
      };
};
```

```CPP
// Usage syntax.
ClassName obj;
obj._mem1 = val1;   // obj._mem2 will also be set to  val1.
obj._mem2 = val2;   // obj._mem1 will also be set to  val2.
```

## `std::variant` (Multiple Types of Data in Single Variable)

### Explanation

1. `std::variant` is **a type-safe union** introduced that allows us to **list various types** for a
   variable, as well as assign and reassign it to different types of values.
2. It functions similarly to **a template class** or **a template structure**, rather than a union.
   While **a union** is **more efficient**, **it** is **type safer**.
3. In some cases, using `std::variant` helps us obtain more information rather than just optional
   data, such as when reading a file.
4. `std::variant` can **store exactly one value at a time** from a predefined set of types. This
   means that while you can specify multiple types when declaring a `std::variant`, it can **only
   hold an instance** of one of those types at any given moment.
5. `std::variant` is **type safer** than `std::any`.
6. Its header file is `<variant>`.

### Synatx

```CPP
// Declaration syntax.
std::variant< TypeList > var_name;
```

```CPP
// Definition syntax.
std::variant< TypeList > var_name = val;
// Assignment syntax.
var_name = val;
```

```CPP
// Definition syntax.
std::variant< TypeList > var_name1 = val;
// Copy constructor.
std::variant< TypeList > var_name2 = var_name1;
// Move constructor.
std::variant< TypeList > var_name3 = std::move( var_name2 );
```

```CPP
// Checking type.
if( std::holds_alternative< Type >( var_name ) ) {
   // Do something.
};
```

```CPP
// Retrieving value.
Type var_val = std::get< Type >( var_name );
```

```CPP
// Retrieving value.
Type& var_val = std::get< Type >( var_name );
```

```CPP
// Checking type and retrieving value.
if( auto var_val = std::get_if< Type >( var_name ) ) {
   std::cout << *var_val << std::endl;
   // or std::cout << std::get< Type >( var_name ) << std::endl;
   // Do something.
};
```

```CPP
// Visit the value.
std::visit(
   []( auto&& var_val ) {
      std::cout << var_val << std::endl;
      // Do something.
   },
   var_name );
```

```CPP
// Handling invalid access.
try {
   Type var_val = std::get< Type >(
      var_name );   // This will throw if myVariant does not hold a double.
} catch( const std::bad_variant_access& e ) {
   std::cerr << "Bad variant access: " << e.what() << std::endl;
};
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

1. `std::any` is **a type-safe container (a class)** for **single values** of **any type**.
2. It can hold **an instance of any type**, enabling you to store heterogeneous values **without
   knowing their types at compile time**.
3. This feature makes `std::any` particularly useful in scenarios like **dynamic type storage and
   type erasure**.
4. When used to **store small-sized variables**, typically **up to 32 bytes** depending on its
   implementation, it functions **similarly to `std::variant`**.
5. However, if **larger sizes** are required, **dynamic allocations** are necessary, which can
   **impact performance**. This feature is **not useful**, and **few programmers use it**.
6. Its header file is `<any>`.

### Synatx

```CPP
// Declaration syntax.
std::any var_name;
```

```CPP
// Definition syntax.
std::any var_name = val;
// Assignment syntax.
var_name = val;
```

```CPP
// Definition syntax.
std::any var_name1 = val;
// Copy constructor.
std::any var_name2( var_name1 );
// Move constructor.
std::any var_name3( std::move( var_name1 ) );
```

```CPP
// Checking type.
if( var_name.type() == typeid( Type ) ) {
   // Do something.
};
```

```CPP
// Retrieving value.
Type var_val = std::any_cast< Type >( var_name );
```

```CPP
// Retrieving value.
// Better than the above statement, will be optimized.
Type& var_ref = std::any_cast< Type& >( var_name );
```

```CPP
// Handling invalid casts.
try {
   Type var_val = std::any_cast< Type >(
      var_name );   // throws std::bad_any_cast if the type is incorrect.
} catch( const std::bad_any_cast& e ) {
   // Handle error.
};
```

```CPP
// Resetting the value.
var_name.reset();   // clears the stored value.
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

## `std::optional` (Optional Data)

### Explanation

1. `std::optional` is **a wrapper type (a template class)** used to **represent an object** that
   **may or may not contain a value**.
2. It encapsulates an optional value, offering **a safer alternative** to **return values** from
   functions (e.g., when searching for elements), **`nullptr`** or **sentinel values** (e.g., `-1`
   as an invalid index).
3. By explicitly managing cases where a value might be absent, it **enhances code clarity** and
   **reduces the risks of runtime errors** (like accessing uninitialized variables).
4. An example is using it to **determine whether a file is successfully read**.

### Synatx

```CPP
// Declaration syntax.
#include <optional>
std::optional< Type > var_name;
```

```CPP
// Definition syntax.
std::optional< Type > var_name = std::nullopt;   // Empty optional.
```

```CPP
// Definition syntax.
std::optional< Type > var_name = val;   // Contains a value.
```

```CPP
// Assignment syntax.
var_name = std::nullopt;   // Reset to empty state.
var_name = val;            // Assign a value.
```

```CPP
// Checking if value exists.
if( var_name.has_value() ) {   // or if( var_name ) {
   Type& val_name = *var_name;
   // or Type& val_name = var_name.value();
   // Do something with the value.
};
```

```CPP
// Retrieving value (throws exception if empty).
Type var_val = var_name.value();
```

```CPP
// Retrieving value (avoids exception).
Type var_val = var_name.value_or( default_value );
```

```CPP
// Handling exceptions for empty optionals.
try {
   Type var_val
      = var_name.value();   // Throws std::bad_optional_access if empty.
} catch( const std::bad_optional_access& e ) {
   // Handle the error.
};
```

```CPP
// Resetting the optional to empty state.
var_name.reset();   // Clears the value.
```

### Members and Related Stuffs

#### Links

1. [`std::optional` in cplusplus]().
2. [`std::optional` in cppreference](https://en.cppreference.com/w/cpp/utility/optional).

#### Template parameters

1. `T`: The type of the value to manage initialization state for.

#### Member Types

1. `value_type`: `T`
2. `iterator` (since C++26): Implementation-defined `LegacyRandomAccessIterator`,
   `ConstexprIterator`, and `contiguous_iterator` whose `value_type` and `reference` are
   `std::remove_cv_t< T >` and `T&`, respectively.
3. `const_iterator` (since C++26): Implementation-defined `LegacyRandomAccessIterator`,
   `ConstexprIterator`, and `contiguous_iterator` whose `value_type` and reference are
   `std::remove_cv_t< T >` and `const T&`, respectively.

#### Member Functions

1. (constructor): Constructs the optional object (public member function).
2. (destructor): Destroys the contained value, if there is one (public member function).
3. `operator=`: Assigns contents (public member function).
4. `begin` (C++26): Returns an iterator to the beginning (public member function).
5. `end` (C++26): Returns an iterator to the end (public member function).
6. `operator->`, `operator*`: Accesses the contained value (public member function).
7. `operator bool`, `has_value`: Checks whether the object contains a value (public member
   function).
8. `value`: Returns the contained value (public member function).
9. `value_or`: Returns the contained value if available, another value otherwise (public member
   function).
10. `and_then` (C++23): Returns the result of the given function on the contained value if it
    exists, or an empty optional otherwise (public member function).
11. `transform` (C++23): Returns an optional containing the transformed contained value if it
    exists, or an empty optional otherwise (public member function).
12. `or_else` (C++23): Returns the optional itself if it contains a value, or the result of the
    given function otherwise (public member function).
13. `swap`: Exchanges the contents (public member function).
14. `reset`: Destroys any contained value (public member function).
15. `emplace`: Constructs the contained value in-place (public member function).

#### Non-member functions

1. `operator==/!=/</<=/>/>=` (C++17), `operator<=>` (C++20): Compares optional objects (function
   template).
2. `make_optional` (C++17): Creates an optional object (function template).
3. `std::swap( std::optional )` (C++17): Specializes the `std::swap` algorithm (function template).

#### Helper classes

1. `std::hash< std::optional >` (C++17): Hash support for `std::optional` (class template
   specialization).
2. `nullopt_t` (C++17): indicator of an `std::optional` that does not contain a value (class).
3. `bad_optional_access` (C++17): Exception indicating checked access to an optional that doesn't
   contain a value (class).

#### Helpers

1. `nullopt` (C++17): An object of type `nullopt_t` (constant).
2. `in_place` (C++17), `in_place_type` (C++17), `in_place_index` (C++17), `in_place_t` (C++17),
   `in_place_type_t` (C++17), `in_place_index_t` (C++17): `in-place` construction tag (tag).

#### Helper specializations

1. `template< class T > constexpr bool ranges::enable_view< std::optional< T > > = true;` (since
   C++26): This specialization of `ranges::enable_view` makes optional satisfy view.
2. `template< class T > constexpr auto format_kind< std::optional< T > > = range_format::disabled;`
   (since C++26): This specialization of `format_kind` disables the range formatting support of
   optional.

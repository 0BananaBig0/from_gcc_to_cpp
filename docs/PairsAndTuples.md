<!-- vim-markdown-toc GFM -->

- [Pairs (`std::pair`)](#pairs-stdpair)
  - [Explanation](#explanation)
  - [Declaration Syntax](#declaration-syntax)
  - [Initialization Syntax](#initialization-syntax)
  - [Members and Related Stuffs](#members-and-related-stuffs)
    - [Links](#links)
    - [`std::make_pair`](#stdmake_pair)
      - [Explanation](#explanation-1)
      - [Syntax](#syntax)
      - [Links](#links-1)
    - [Template Parameters](#template-parameters)
    - [Member Types](#member-types)
    - [Member Objects](#member-objects)
    - [Member functions](#member-functions)
    - [Non-member Functions](#non-member-functions)
    - [Helper Classes](#helper-classes)
    - [Helper Specializations](#helper-specializations)
- [Tuples (`std::tuple`)](#tuples-stdtuple)
  - [Explanation](#explanation-2)
  - [Declaration Syntax](#declaration-syntax-1)
  - [Initialization Syntax](#initialization-syntax-1)
  - [Members and Related Stuffs](#members-and-related-stuffs-1)
    - [Links](#links-2)
    - [`std::make_tuple`](#stdmake_tuple)
      - [Explanation](#explanation-3)
      - [Syntax](#syntax-1)
      - [Links](#links-3)
    - [`std::get`](#stdget)
      - [Explanation](#explanation-4)
      - [Syntax](#syntax-2)
      - [Links](#links-4)
    - [Template Parameters](#template-parameters-1)
    - [Member Functions](#member-functions-1)
    - [Non-member Functions](#non-member-functions-1)
    - [Helper Concepts](#helper-concepts)
    - [Helper Classes](#helper-classes-1)
    - [Helper Specializations](#helper-specializations-1)

<!-- vim-markdown-toc -->

## Pairs (`std::pair`)

### Explanation

1. This **template class** **couples** together **a pair of values**, which may be of different
   types (`T1` and `T2`).
2. The individual values can be accessed through its **public members first and second**.
3. Pairs are **a particular case of tuple**.
4. Their header file is `<utility>`.

### Declaration Syntax

```CPP
std::pair< Type1, Type2 > pair_name;
```

### Initialization Syntax

```CPP
// Aggregate Initialization.
std::pair< Type1, Type2 > pair_name = { val1, val2 };
```

```CPP
// Aggregate Initialization.
std::pair< Type1, Type2 > pair_name = { val1, val2 };
```

```CPP
// Default constructor.
std::pair< Type1, Type2 > pair_name;
```

```CPP
// Copy var_name1 and var_name2.
Type1 var_name1 = intializer1;
Type2 var_name2 = intializer2;
std::pair< Type1, Type2 > pair_name( var_name1, var_name2 );
```

```CPP
// Parameterized constructor. Move temporary val1 and val2.
std::pair< Type1, Type2 > pair_name( val1, val2 );
```

```CPP
// Move constructor, or copy elision.
std::pair< Type1, Type2 > pair_name1 = std::make_pair< Type1, Type2 >( val1, val2 );
// Copy constructor.
std::pair< Type1, Type2 > pair_name2 = pair_name1;
```

```CPP
// Move constructor, or copy elision.
std::pair< Type1, Type2 > pair_name1 = std::make_pair< Type1, Type2 >( val1, val2 );
// Move constructor.
std::pair< Type1, Type2 > pair_name2 = std::move( pair_name1 );
```

### Members and Related Stuffs

#### Links

1. [`std::pair` in cplusplus](https://cplusplus.com/reference/utility/pair/).
2. [`std::pair` in cppreference](https://en.cppreference.com/w/cpp/utility/pair).

#### `std::make_pair`

##### Explanation

1. `std::make_pair` is **a template function** that **constructs a pair object** with its first
   element set to `t` and its second element set to `u`.
2. **The template types can be implicitly deduced from the arguments passed to `make_pair`**.
3. Pair objects can be constructed from other pair objects containing different types, if the
   respective types are implicitly convertible.

##### Syntax

```CPP
Its declaration syntax.
template< class T1, class T2 >
std::pair< T1, T2 > make_pair( T1 t, T2 u );   // ( until C++ 11 ).
```

```CPP
Its declaration syntax.
template< class T1, class T2 >
std::pair< V1, V2 > make_pair(
   T1&& t, T2&& u );   // ( since C++ 11 ), ( constexpr since C++ 14 ).
```

##### Links

1. [`std::make_pair` in cplusplus](https://cplusplus.com/reference/utility/make_pair/).
2. [`std::make_pair` in cppreference](https://en.cppreference.com/w/cpp/utility/pair/make_pair).

#### Template Parameters

1. `T1`,`T2`: The types of the elements that the pair stores.

#### Member Types

1. `first_type`: `T1`.
2. `second_type`: `T2`.

#### Member Objects

1. `first`: `T1`.
2. `second`: `T2`.

#### Member functions

1. (constructor): Constructs new pair (public member function).
2. `operator=`: Assigns the contents (public member function).
3. `swap`: swaps the contents (public member function).

#### Non-member Functions

1. `make_pair`: Creates a pair object of type, determined by the argument types (function template).
2. `operator==`, `operator!=/</<=/>/>=` (removed in C++20), `operator<=>` (C++20): Lexicographically
   compares the values in the pair (function template).
3. `std::swap( std::pair )`: Specializes the `std::swap algorithm` (function template).
4. `get( std::pair )`: Accesses an element of a pair (function template). [`std::get`](#stdget).

#### Helper Classes

1. `std::tuple_size< std::pair >`: Obtains the size of a pair (class template specialization).
2. `std::tuple_element< std::pair >`: Obtains the type of the elements of pair (class template
   specialization).
3. `std::basic_common_reference< std::pair >` (C++23): Determines the common reference type of two
   pairs (class template specialization).
4. `std::common_type< std::pair >` (C++23): Determines the common type of two pairs (class template
   specialization).
5. `std::formatter< std::pair >` (C++23): Formatting support for pair (class template
   specialization).

#### Helper Specializations

1. `template< class T, class U > constexpr bool enable_nonlocking_formatter_optimization< std::pair< T, U > > = enable_nonlocking_formatter_optimization< T > && enable_nonlocking_formatter_optimization< U >;`
   (since C++23): This specialization of `std::enable_nonlocking_formatter_optimization` enables
   efficient implementation of `std::print` and `std::println` for printing a pair object when both
   `T` and `U` enable it.

## Tuples (`std::tuple`)

### Explanation

1. `std::tuple` is **a template class** that can **hold a collection of elements**, which may be of
   **different types**. Unlike pairs, tuples can contain more than two elements.
2. Its header file is `<tuple>`.

### Declaration Syntax

```CPP
std::tuple< type_para_list > tuple_name;
```

### Initialization Syntax

```CPP
// Aggregate Initialization.
std::tuple< type_para_list > tuple_name = { ... };
```

```CPP
// Aggregate Initialization.
std::tuple< type_para_list > tuple_name{ ... };
```

```CPP
// Default constructor.
std::tuple< type_para_list > tuple_name;
```

```CPP
// Parameterized constructor.
std::tuple< type_para_list > tuple_name( ... );
```

```CPP
// Move constructor, or copy elision.
std::tuple< type_para_list > tuple_name1 = std::tuple< type_para_list >( ... );
// Copy constructor.
std::tuple< type_para_list > tuple_name2( tuple_name1 );
```

```CPP
// Move constructor, or copy elision.
std::tuple< type_para_list > tuple_name1 = std::tuple< type_para_list >( ... );
// Move constructor.
std::tuple< type_para_list > tuple_name2( std::move( tuple_name1 ) );
```

```CPP
// Aggregate Initialization.
std::pair< Type1, Type2 > pair_name = { val1, val2 };
// Copy-conversion constructor.
std::tuple< type_para_list > tuple_name( pair_name );
```

```CPP
// Aggregate Initialization.
std::pair< Type1, Type2 > pair_name = { val1, val2 };
// Move-onversion constructor.
std::tuple< type_para_list > tuple_name( std::move( pair_name ) );
```

### Members and Related Stuffs

#### Links

1. [`std::tuple` in cplusplus](https://cplusplus.com/reference/tuple/tuple/).
2. [`std::tuple` in cppreference](https://en.cppreference.com/w/cpp/utility/tuple).

#### `std::make_tuple`

##### Explanation

1. `std::make_tuple` is **a template function** that **constructs an object of** the appropriate
   **tuple** type to contain the elements specified in`args`.
2. **The type of the returned object (`tuple< VTypes... >`) is deduced from Types**: For each type
   in Types, its decay equivalent is used in `VTypes` (except `reference_wrapper` types, for which
   the corresponding reference type is used instead).
3. The function calls tuple's initialization constructor, forwarding `args` to it.

##### Syntax

```CPP
// Its declaration syntax.
template< class... Types >
std::tuple< VTypes... > make_tuple(
   Types&&... args );   // (since C++11), (constexpr since C++14)
```

##### Links

1. [`std::make_tuple` in cplusplus](https://cplusplus.com/reference/tuple/make_tuple/).
2. [`std::make_tuple` in cppreference](https://en.cppreference.com/w/cpp/utility/tuple/make_tuple).

#### `std::get`

##### Explanation

1. `std::get` is a template function that returns a reference to the `I`th element of tuple `t`.
2. (1-4) Extracts the `I`th element from the tuple. `I` must be an integer value in
   `[0, sizeof...(Types))`.
3. (5-8) Extracts the element of the tuple `t` whose type is `T`. Fails to compile unless the tuple
   has exactly one element of that type.
4. Parameters `t` is a tuple whose contents to extract Return value.

##### Syntax

```CPP
// Its declaration syntax.
template< std::size_t I, class... Types >
typename std::tuple_element< I, std::tuple< Types... > >::type& get(
   std::tuple< Types... >& t ) noexcept;   // (1) (since C++11)
```

```CPP
// Its declaration syntax.
/* ( */ constexpr /* since C++ 14 ) */ template< std::size_t I, class... Types >
typename std::tuple_element< I, std::tuple< Types... > >::type&& get(
   std::tuple< Types... >&& t ) noexcept;   // (2) (since C++11)
```

```CPP
// Its declaration syntax.
/* ( */ constexpr /* since C++ 14 ) */ template< std::size_t I, class... Types >
const typename std::tuple_element< I, std::tuple< Types... > >::type& get(
   const std::tuple< Types... >& t ) noexcept;   // (3) (since C++11)
```

```CPP
// Its declaration syntax.
/* ( */ constexpr /* since C++ 14 ) */ template< std::size_t I, class... Types >
const typename std::tuple_element< I, std::tuple< Types... > >::type&& get(
   const std::tuple< Types... >&& t ) noexcept;   // (4) (since C++11)
```

```CPP
// Its declaration syntax.
/* ( */ constexpr /* since C++ 14 ) */ template< class T, class... Types >
constexpr T& get( std::tuple< Types... >& t ) noexcept;   // (5) (since C++14)
```

```CPP
// Its declaration syntax.
template< class T, class... Types >
constexpr T&& get( std::tuple< Types... >&& t ) noexcept;   // (6) (since C++14)
```

```CPP
// Its declaration syntax.
template< class T, class... Types >
constexpr const T& get(
   const std::tuple< Types... >& t ) noexcept;   // (7) (since C++14)
```

```CPP
// Its declaration syntax.
template< class T, class... Types >
constexpr const T&& get(
   const std::tuple< Types... >&& t ) noexcept;   // (8) (since C++14)
```

```CPP
// Its usage syntax.
std::cout << std::get< Index > << std::endl;
std::cout << std::get< Type > << std::endl;
```

##### Links

1. [`std::get` in cplusplus](https://cplusplus.com/reference/tuple/get/).
2. [`std::get` in cppreference](https://en.cppreference.com/w/cpp/utility/tuple/get).

#### Template Parameters

1. `Types...`: The types of the elements that the tuple stores. Empty list is supported.

#### Member Functions

1. (constructor): Constructs a new tuple (public member function).
2. `operator=`: Assigns the contents of one tuple to another (public member function).
3. `swap`: Swaps the contents of two tuples (public member function).

#### Non-member Functions

1. `make_tuple`: Creates a tuple object of the type defined by the argument types (function
   template).
2. `tie`: Creates a tuple of lvalue references or unpacks a tuple into individual objects (function
   template). [`std::tie`](./Bindings.md#stdtie)
3. `forward_as_tuple`: Creates a tuple of forwarding references (function template).
4. `tuple_cat`: Creates a tuple by concatenating any number of tuples (function template).
5. `get( std::tuple )`: Tuple accesses specified element (function template).
6. `operator==`, `operator!=/</<=/>/>=` (removed in C++20), `operator<=>` (C++20): Lexicographically
   compares the values in the tuple (function template).
7. `std::swap( std::tuple )`: Specializes the std::swap algorithm (function template).

#### Helper Concepts

1. `tuple-like` (C++23), `pair-like` (C++23): Specifies that a type implemented the tuple protocol
   (`std::get`, `std::tuple_element`, `std::tuple_size`). (exposition-only concept`*`)

#### Helper Classes

1. `std::tuple_size< std::tuple >`: Obtains the size of a tuple (class template specialization).
2. `std::tuple_element< std::tuple >`: Obtains the type of the specified element (class template
   specialization).
3. `std::uses_allocator< std::tuple >`: Specializes the `std::uses_allocator` type trait (class
   template specialization).
4. `std::basic_common_reference< tuple-like >` (C++23): Determines the common reference type of a
   tuple and a tuple-like type (class template specialization).
5. `std::common_type< tuple-like >` (C++23): Determines the common type of a tuple and a tuple-like
   type (class template specialization).
6. `std::formatter< std::tuple >` (C++23): Formatting support for tuple (class template
   specialization).
7. `ignore`: Placeholder to skip an element when unpacking a tuple using tie (constant).

#### Helper Specializations

1. `template< class... Ts > constexpr bool enable_nonlocking_formatter_optimization< std::tuple< Ts... > > = ( enable_nonlocking_formatter_optimization< Ts > && ... );`
   (since C++23): This specialization of `std::enable_nonlocking_formatter_optimization` enables
   efficient implementation of `std::print` and `std::println` for printing a tuple object when each
   element type enables it.

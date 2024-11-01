<!-- vim-markdown-toc GFM -->

- [Dynamic Arrays and `std::vector`](#dynamic-arrays-and-stdvector)
  - [Explanation](#explanation)
  - [Characteristics](#characteristics)
  - [One-dimensional `std::vector`](#one-dimensional-stdvector)
    - [Declaration Syntax](#declaration-syntax)
    - [Initialization Syntax](#initialization-syntax)
    - [Syntax for Deleting One-dimensional `std::vector` Pointers](#syntax-for-deleting-one-dimensional-stdvector-pointers)
  - [Multidimensional `std::vector` ( **Not Recommend** )](#multidimensional-stdvector--not-recommend-)
    - [Declaration Syntax](#declaration-syntax-1)
    - [Initialization Syntax](#initialization-syntax-1)
  - [Members and Related Stuffs](#members-and-related-stuffs)
    - [Links](#links)
    - [Template Parameters](#template-parameters)
    - [Specializations](#specializations)
    - [Member Types](#member-types)
    - [Member Functions](#member-functions)
    - [Non-member Functions](#non-member-functions)
  - [Notes](#notes)

<!-- vim-markdown-toc -->

### Dynamic Arrays and `std::vector`

#### Explanation

1. Dynamic arrays are **arrays** that can **change size during runtime**
2. `std::vector` is a dynamic array that can grow or shrink as needed.
3. It **automatically handles memory allocation and deallocation**, making it easier to work with
   than raw pointers.

#### Characteristics

1. Dynamic arrays are typically **slower** than static arrays.
2. They **automatically manage memory**, so programmers do not need to manually allocate or
   deallocate it.

#### One-dimensional `std::vector`

##### Declaration Syntax

```CPP
// No initialization, contain garbage values and behave unpredictably.
std::vector< Type > arr_name;
```

```CPP
std::vector< Type >* arr_ptr = new std::vector< Type >;
```

```CPP
std::vector< Type > arr_name;
std::vector< Type >* arr_ptr = &arr_name;
```

##### Initialization Syntax

```CPP
// Initializer list constructor.
std::vector< Type > arr_name = { ... };
```

```CPP
// Initializer list constructor.
std::vector< Type > arr_name{ ... };
```

```CPP
// No initialization, contain garbage values and behave unpredictably.
std::vector< Type > arr_name( size );
```

```CPP
// Initialization with the specific value.
std::vector< Type > arr_name( size, value );
```

```CPP
// Initializer list constructor.
std::vector< Type > arr_name1 = { ... };
// Copy constructor.
std::vector< Type > arr_name2( arr_name1 );
```

```CPP
// Initializer list constructor.
std::vector< Type > arr_name1 = { ... };
// Copy constructor.
std::vector< Type > arr_name2 = arr_name1;
```

```CPP
// Move constructor.
std::vector< Type > arr_name( { ... } );
```

```CPP
// Constructs the container with the contents of the range `[first, last)`.
std::vector< Type > arr_name1( { ... } );
std::vector< Type > arr_name2( arr_name1.begin(), arr_name1.end() );
```

```CPP
std::vector< Type >* arr_ptr = new std::vector< Type >( size );
```

```CPP
std::vector< Type >* arr_ptr = new std::vector< Type >( size, value );
```

```CPP
// Initializer list constructor.
std::vector< Type > arr_name = { ... };
std::vector< Type >* arr_ptr = new std::vector< Type >( arr_name );
```

```CPP
std::vector< Type >* arr_ptr = new std::vector< Type >{ ... };
```

##### Syntax for Deleting One-dimensional `std::vector` Pointers

```CPP
delete arr_ptr;
```

#### Multidimensional `std::vector` ( **Not Recommend** )

##### Declaration Syntax

```CPP
// No initialization, contain garbage values and behave unpredictably.
std::vector< std::vector< Type > > arr_name;
```

```CPP
// No initialization, contain garbage values and behave unpredictably.
std::vector< std::vector< std::vector< Type > > > arr_name;
```

##### Initialization Syntax

```CPP
// Initializer list constructor.
std::vector< std::vector< Type > > arr_name = { { { ... /* size_y */ }, { ... }, ... /* size_x */ } };
```

```CPP
// Default Initialization.
std::vector< std::vector< Type > > arr_name = {};
```

```CPP
// Uniform Initialization (C++11 and later).
std::vector< std::vector< Type > > arr_name{ { { ...  /* size_y */}, { ... }, ... /* size_x */ } };
```

```CPP
// Copy Initialization.
std::vector< std::vector< Type > > arr_name1 = { { { ... /* size_y */ }, { ... }, ... /* size_x */ } };
std::vector< std::vector< Type > > arr_name2  = arr_name1;
```

```CPP
// Initializer list constructor.
std::vector< std::vector< std::vector< Type > > > arr_name = { {
   { { ... /* size_z */ }, { ... }, ... /* size_y */ },
   { { ... }, { ... }, ... },
   ... /* size_x */
} };
```

```CPP
// Default Initialization.
std::vector< std::vector< std::vector< Type > > > arr_name = {};
```

```CPP
// Uniform Initialization (C++11 and later).
std::vector< std::vector< std::vector< Type > > > arr_name{ {
   { { ... /* size_z */ }, { ... }, ... /* size_y */ },
   { { ... }, { ... }, ...},
   ... /* size_x */
} };
```

```CPP
std::vector< std::vector< std::vector< Type > > > arr_name1 = {
   { { ... /* size_z */ }, { ... }, ... /* size_y */ },
   { { ... }, { ... }, ... },
   ... /* size_x */
};
// Copy Initialization.
std::vector< std::vector< std::vector< Type > > > arr_name2 = arr_name1;
```

#### Members and Related Stuffs

##### Links

1. [`std::vector` in cplusplus](https://cplusplus.com/reference/vector/vector/).
2. [`std::vector` in cppreference](https://en.cppreference.com/w/cpp/container/vector).

##### Template Parameters

1. `T`: The type of the elements.
2. `Allocator`: An allocator that is used to acquire/release memory and to construct/destroy the
   elements in that memory.

##### Specializations

1. The standard library provides a specialization of `std::vector` for the type bool, which may be
   optimized for space efficiency.
   - `vector< bool >`: Space-efficient dynamic bitset (class template specialization).

##### Member Types

1. `value_type`: `T`.
2. `allocator_type`: `Allocator`.
3. `size_type`: Unsigned integer type (usually `std::size_t`).
4. `difference_type`: Signed integer type (usually `std::ptrdiff_t`).
5. `reference`: `value_type&`.
6. `const_reference`: `const value_type&`.
7. `pointer`: `Allocator::pointer` (until C++11), `std::allocator_traits< Allocator >::pointer`
   since C++11).
8. `const_pointer`: `Allocator::const_pointer` (until C++11),
   `std::allocator_traits< Allocator >::const_pointer` (since C++11).
9. `iterator`: `LegacyRandomAccessIterator` and `LegacyContiguousIterator` to `value_type` (until
   C++20), `LegacyRandomAccessIterator`, `contiguous_iterator`, and `ConstexprIterator` to
   `value_type` (since C++20).
10. `const_iterator`: `LegacyRandomAccessIterator` and `LegacyContiguousIterator` to
    `const value_type` (until C++20), `LegacyRandomAccessIterator`, `contiguous_iterator`, and
    `ConstexprIterator` to `const value_type` (since C++20).
11. `reverse_iterator`: `std::reverse_iterator< iterator >`.
12. `const_reverse_iterator`: `std::reverse_iterator< const_iterator >`.

##### Member Functions

1. (constructor): Constructs the vector (public member function).
2. (destructor): Destructs the vector (public member function).
3. `operator=`: Assigns values to the container (public member function).
4. `assign`: Assigns values to the container (public member function).
5. `assign_range` (C++23): Assigns a range of values to the container (public member function).
6. `get_allocator`: Returns the associated allocator (public member function).
7. `at`: Access specified element with bounds checking (public member function).
8. `operator[]`: Access specified element (public member function).
9. `front`: Access the first element (public member function).
10. `back`: Access the last element (public member function).
11. `data`: Direct access to the underlying contiguous storage (public member function).
12. `begin`, `cbegin`: Returns an iterator to the beginning (public member function).
13. `end`, `cend`: Returns an iterator to the end (public member function).
14. `rbegin`, `crbegin`: Returns a reverse iterator to the beginning (public member function).
15. `rend`, `crend`: Returns a reverse iterator to the end (public member function).
16. `empty`: Checks whether the container is empty (public member function).
17. `size`: Returns the number of elements (public member function).
18. `max_size`: Returns the maximum possible number of elements (public member function).
19. `reserve`: Reserves storage (public member function).
20. `capacity`: Returns the number of elements that can be held in currently allocated storage
    (public member function).
21. `shrink_to_fit` (`DR*`): Reduces memory usage by freeing unused memory (public member function).
22. `clear`: Clears the contents (public member function).
23. `insert`: Inserts elements (public member function).
24. `insert_range` (C++23): Inserts a range of elements (public member function).
25. `emplace`: Constructs element in-place (public member function).
26. `erase`: Erases elements (public member function).
27. `push_back`: Adds an element to the end (public member function).
28. `emplace_back`: Constructs an element in-place at the end (public member function).
29. `append_range` (C++23): Adds a range of elements to the end(public member function).
30. `pop_back`: Removes the last element (public member function).
31. `resize`: Changes the number of elements stored (public member function).
32. `swap`: Swaps the contents (public member function).

##### Non-member Functions

1. `operator==`, `operator!=/</<=/>/>=` (removed in C++20), `operator<=>` (C++20): Lexicographically
   compares the values of two vectors (function template).
2. `std::swap( std::vector )`: Specializes the `std::swap` algorithm (function template).
3. `erase( std::vector )` (C++20), `erase_if( std::vector )` (C++20): Erases all elements satisfying
   specific criteria (function template).

#### Notes

1. **Avoid `std::vector` automatic resizing**: We can **use the reserve function to hold memory**
   without creating any objects. The reserve function differs from the resize function: while resize
   creates objects to occupy memory, reserve only holds memory without creating objects. This
   function **changes the capacity** of the vector but **does not affect its size**.
2. **Avoid calling copy constructors**: We can **use the `emplace_back` function** instead of
   `push_back` to prevent unnecessary copying of objects.
3. Conclusion: To optimize our code, it is essential to understand the system environment and how
   the code works, including functions, objects, operators, etc.
4. `std::vector::push_back`: Copy or move all data to a new location, if need; Otherwise, just move
   new data into the current location.
5. `std::vector:emplace_back`: Copy or move old data to a new location and then construct new data
   in the new location, if need; Otherwise, just construct new data into the current location.

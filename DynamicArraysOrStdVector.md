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
  - [Member Functions](#member-functions)
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
// Aggregate Initialization or Uniform Initialization (C++11 and later).
std::vector< Type > arr_name = { ... };
```

```CPP
// Aggregate Initialization or Uniform Initialization (C++11 and later).
std::vector< Type > arr_name{ ... };
```

```CPP
// No initialization, contain garbage values and behave unpredictably.
std::vector< Type > arr_name( size );
```

```CPP
// No initialization, contain garbage values and behave unpredictably.
std::vector< Type > arr_name( size, value );
```

```CPP
// Aggregate Initialization.
std::vector< Type > arr_name1 = { ... };
// Copy constructor.
std::vector< Type > arr_name2(arr_name1);
```

```CPP
// Aggregate Initialization.
std::vector< Type > arr_name1 = { ... };
// Copy constructor.
std::vector< Type > arr_name2 = arr_name1;
```

```CPP
// Move constructor.
std::vector< Type > arr_name( { ... } );
```

```CPP
std::vector< Type >* arr_ptr = new std::vector< Type >( size );
```

```CPP
std::vector< Type >* arr_ptr = new std::vector< Type >( size, value );
```

```CPP
// Aggregate Initialization.
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
// Aggregate Initialization
std::vector< std::vector< Type > > arr_name = { { { ... /* size_y */ }, { ... }, ... /* size_x */ } };
```

```CPP
// Default Initialization
std::vector< std::vector< Type > > arr_name = {};
```

```CPP
// Uniform Initialization (C++11 and later)
std::vector< std::vector< Type > > arr_name{ { { ...  /* size_y */}, { ... }, ... /* size_x */ } };
```

```CPP
// Copy Initialization
std::vector< std::vector< Type > > arr_name1 = { { { ... /* size_y */ }, { ... }, ... /* size_x */ } };
std::vector< std::vector< Type > > arr_name2  = arr_name1;
```

```CPP
// Aggregate Initialization
std::vector< std::vector< std::vector< Type > > > arr_name = { {
   { { ... /* size_z */ }, { ... }, ... /* size_y */ },
   { { ... }, { ... }, ... },
   ... /* size_x */
} };
```

```CPP
// Default Initialization
std::vector< std::vector< std::vector< Type > > > arr_name = {};
```

```CPP
// Uniform Initialization (C++11 and later)
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
// Copy Initialization
std::vector< std::vector< std::vector< Type > > > arr_name2 = arr_name1;
```

#### Member Functions

1. [`std::vector` in cplusplus](https://cplusplus.com/reference/vector/vector/).
2. [`std::vector` in cppreference](https://en.cppreference.com/w/cpp/container/vector).

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

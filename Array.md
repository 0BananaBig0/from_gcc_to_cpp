<!-- vim-markdown-toc GFM -->

- [Array](#array)
  - [Explanation](#explanation)
  - [Characteristics](#characteristics)
    - [1) Homogeneous Data Types](#1-homogeneous-data-types)
    - [2) Contiguous Memory Allocation](#2-contiguous-memory-allocation)
  - [Raw Array](#raw-array)
    - [Explanation](#explanation-1)
    - [Characteristics](#characteristics-1)
    - [One-dimensional Raw Array](#one-dimensional-raw-array)
      - [Declaration Syntax](#declaration-syntax)
      - [Initialization Syntax](#initialization-syntax)
      - [Syntax for Deleting One-dimensional Raw Array Pointers](#syntax-for-deleting-one-dimensional-raw-array-pointers)
    - [Multidimensional Raw Array ( **Not Recommend** )](#multidimensional-raw-array--not-recommend-)
      - [Declaration Syntax](#declaration-syntax-1)
      - [Initialization Syntax](#initialization-syntax-1)
      - [Syntax for Deleting Multidimensional Raw Array Pointers](#syntax-for-deleting-multidimensional-raw-array-pointers)
  - [`std::array`](#stdarray)
    - [Explanation](#explanation-2)
    - [Characteristics](#characteristics-2)
    - [A Simple Implementation of `std::array`](#a-simple-implementation-of-stdarray)
    - [One-dimensional `std::array`](#one-dimensional-stdarray)
      - [Declaration Syntax](#declaration-syntax-2)
      - [Initialization Syntax](#initialization-syntax-2)
      - [Syntax for Deleting One-dimensional `std::array` Pointers](#syntax-for-deleting-one-dimensional-stdarray-pointers)
    - [Multidimensional `std::array` ( **Not Recommend** )](#multidimensional-stdarray--not-recommend-)
      - [Declaration Syntax](#declaration-syntax-3)
      - [Initialization Syntax](#initialization-syntax-3)
    - [Member Functions](#member-functions)
      - [Constructors](#constructors)
      - [Assignment](#assignment)
      - [Element Access](#element-access)
      - [Capacity](#capacity)
      - [Iterators](#iterators)
      - [Comparison](#comparison)
      - [Modifiers](#modifiers)
    - [Lexicographical Comparison or Lexicographical Order](#lexicographical-comparison-or-lexicographical-order)
    - [Notes](#notes)

<!-- vim-markdown-toc -->

## Array

### Explanation

1. An array is **a collection of elements**, all of **the same type**, that are stored in
   **contiguous memory** locations. Arrays are used to store **multiple values** in **a single
   variable**, making it easier to manage and manipulate data efficiently.

### Characteristics

#### 1) Homogeneous Data Types

1. All elements in an array must be of **the same data type** (e.g., all integers, all floats).

#### 2) Contiguous Memory Allocation

1. The elements of an array are stored in **consecutive memory** locations, which allows for
   **efficient access** using an index. The Contiguous memory **improves cache performance**.

### Raw Array

#### Explanation

1. A raw array in C++ refers to **a traditional C-style array** that is built into the language. It
   is **a fixed-size sequence** of elements of **the same type** and provides very minimal
   functionality compared to containers like `std::array` or `std::vector`.

#### Characteristics

1. The raw array is the **fastest** structure but **not safe** enough..
2. The **size** of a raw array is **defined at compile time** and **cannot be changed during
   runtime**. This means that once an array is declared, its size is fixed.

#### One-dimensional Raw Array

##### Declaration Syntax

```CPP
// No initialization, contain garbage values and behave unpredictably.
Type arr_name[size];
```

```CPP
Type* arr_ptr = new Type[size];
```

```CPP
Type arr_name[size];
Type* arr_ptr = arr_name;
```

##### Initialization Syntax

```CPP
// Aggregate Initialization
Type arr_name[size] = { ... };
```

```CPP
// Default Initialization
Type arr_name[size] = {};
```

```CPP
// Copy Initialization
Type arr_name1 = { ... };
Type arr_name2 = arr_name1;
```

```CPP
// Implicit Size: If the size isn't specified, it is inferred from the initializer list.
Type arr_name[] = { ... };
```

```CPP
Type* arr_ptr = new Type[size]{ ... };
```

```CPP
Type* arr_ptr = new Type[]{ ... };
```

##### Syntax for Deleting One-dimensional Raw Array Pointers

```CPP
delete[] arr_ptr;
```

#### Multidimensional Raw Array ( **Not Recommend** )

##### Declaration Syntax

```CPP
// No initialization, contain garbage values and behave unpredictably.
Type arr_name[size_x][size_y];
```

```CPP
// No initialization, contain garbage values and behave unpredictably.
Type arr_name[size_x][size_y][size_z];
```

```CPP
// `a2d` is an array that stores size_x pointers, each of which points to an array that stores size_y values.
Type** a2d = new Type*[size_x];
for( size_t i = 0; i < size_x; i++ ) {
   a2d[i] = new Type[size_y];
};
```

```CPP
Type*** a3d = new Type**[size_x];
for( size_t i = 0; i < size_x; i++ ) {
   a3d[i] = new Type*[size_y];
   for( size_t j = 0; j < size_y; j++ )
      a3d[i][j] = new Type[size_z];
};
```

##### Initialization Syntax

```CPP
// Aggregate Initialization
Type arr_name[size_x][size_y] = { { ... /* size_y */ }, { ... }, ... /* size_x */ };
```

```CPP
// Default Initialization
Type arr_name[size_x][size_y] = {};
```

```CPP
// Copy Initialization
Type arr_name1[size_x][size_y] = { { ... /* size_y */ }, { ... }, ... /* size_x */ };
Type arr_name2[size_x][size_y] = arr_name1;
```

```CPP
// Aggregate Initialization
Type arr_name[size_x][size_y][size_z] = {
   { { ... /* size_z */ }, { ... }, ... /* size_y */ },
   { { ... }, { ... }, ...},
   ... /* size_x */
};
```

```CPP
// Default Initialization
Type arr_name[size_x][size_y][size_z] = {};
```

```CPP
// Copy Initialization
Type arr_name1[size_x][size_y][size_z] = {
   { { ... /* size_z */ }, { ... }, ... /* size_y */ },
   { { ... }, { ... }, ...},
   ... /* size_x */
};
Type arr_name2[size_x][size_y][size_z] = arr_name1;
```

##### Syntax for Deleting Multidimensional Raw Array Pointers

```CPP
for( size_t i = 0; i < size_x; i++ ) {
   delete[] a2d[i];
};
delete[] a2d;
```

```CPP
for( size_t i = 0; i < size_x; i++ ) {
   for( size_t j = 0; j < size_y; j++ )
      delete[] a3d[i][j];
   delete[] a3d[i];
};
delete[] a3d;
```

### `std::array`

#### Explanation

1. `std::array` is **a container** from the C++ Standard Library that provides **a fixed-size
   array**. It is **a template class**, and all syntax applicable to template classes applies to it.
2. In fact, it's a template class:
   ```CPP
     template< typename T, int N > class Array { T _array[N] };
   ```

#### Characteristics

1.  `std::array` is **slower** than the raw array, but `std::array` is **safer** than a raw array.
2.  `std::array` is used like a raw array but **provides member functions** and allows us to use
    many standard C++ functions to manage it.
3.  In debug mode, `std::array` can **help us debug** like bounds checking, thanks to its debug
    macros and code.
4.  `std::array` is **a template**. We can use its functions to get its size, but it **doesn't store
    the size as a value**.
5.  The **size** of a `std::array` is **defined at compile time** and **cannot be changed during
    runtime**. This means that once an array is declared, its size is fixed.

#### A Simple Implementation of `std::array`

```CPP
template< typename T, size_t size > class Array {
      T _array[size]
};
```

#### One-dimensional `std::array`

##### Declaration Syntax

```CPP
// No initialization, contain garbage values and behave unpredictably.
std::array< Type, size > arr_name;
```

```CPP
std::array< Type, size >* arr_ptr = new std::array< Type, size >;
```

```CPP
std::array< Type, size > arr_name;
std::array< Type, size >* arr_ptr = &arr_name;
```

##### Initialization Syntax

```CPP
// Aggregate Initialization
std::array< Type, size > arr_name = { val1, val2, val3, ... };
```

```CPP
// Default Initialization
std::array< Type, size > arr_name = {};
```

```CPP
// Uniform Initialization (C++11 and later)
std::array< Type, size > arr{ val1, val2, val3, ... };
```

```CPP
// Class-type Constructor Initialization
std::array< Type, size > arr( { ... } );
```

```CPP
// Copy Initialization
std::array< Type, size > arr_name1 = { val1, val2, val3, ... };
std::array< Type, size > arr_name2 = arr_name1;
```

```CPP
std::array< Type, size >* arr_ptr = new std::array< Type, size >{ ... };
```

##### Syntax for Deleting One-dimensional `std::array` Pointers

```CPP
delete arr_ptr;
```

#### Multidimensional `std::array` ( **Not Recommend** )

##### Declaration Syntax

```CPP
// No initialization, contain garbage values and behave unpredictably.
std::array< std::array< Type, size_y >, size_x > arr_name;
```

```CPP
// No initialization, contain garbage values and behave unpredictably.
std::array< std::array< std::array< Type, size_z >, size_y >, size_x > arr_name;
```

##### Initialization Syntax

```CPP
// Aggregate Initialization
std::array< std::array< Type, size_y >, size_x > arr_name = { { { ... /* size_y */ }, { ... }, ... /* size_x */ } };
```

```CPP
// Default Initialization
std::array< std::array< Type, size_y >, size_x > arr_name = {};
```

```CPP
// Uniform Initialization (C++11 and later)
std::array< std::array< Type, size_y >, size_x > arr_name{ { { ...  /* size_y */}, { ... }, ... /* size_x */ } };
```

```CPP
// Copy Initialization
std::array< std::array< Type, size_y >, size_x > arr_name1 = { { { ... /* size_y */ }, { ... }, ... /* size_x */ } };
std::array< std::array< Type, size_y >, size_x > arr_name2  = arr_name1;
```

```CPP
// Aggregate Initialization
std::array< std::array< std::array< Type, size_z >, size_y >, size_x > arr_name = { {
   { { ... /* size_z */ }, { ... }, ... /* size_y */ },
   { { ... }, { ... }, ... },
   ... /* size_x */
} };
```

```CPP
// Default Initialization
std::array< std::array< std::array< Type, size_z >, size_y >, size_x > arr_name = {};
```

```CPP
// Uniform Initialization (C++11 and later)
std::array< std::array< std::array< Type, size_z >, size_y >, size_x > arr_name{ {
   { { ... /* size_z */ }, { ... }, ... /* size_y */ },
   { { ... }, { ... }, ...},
   ... /* size_x */
} };
```

```CPP
// Copy Initialization
std::array< std::array< std::array< Type, size_z >, size_y >, size_x > arr_name1 = {
   { { ... /* size_z */ }, { ... }, ... /* size_y */ },
   { { ... }, { ... }, ... },
   ... /* size_x */
};
std::array< std::array< std::array< Type, size_z >, size_y >, size_x > arr_name2 = arr_name1;
```

#### Member Functions

##### Constructors

1. `std::array()`: **Default** constructor.
1. `std::array(const std::array& other)`: **Copy** constructor.
1. `std::array(std::array&& other) noexcept`: **Move** constructor.
1. `template <class... Args> std::array(Args&&... args)`: Constructs an array with **the provided
   elements**.

##### Assignment

1. `std::array& operator=(const std::array& other)`: **Copy** assignment operator.
2. `std::array& operator=(std::array&& other) noexcept`: **Move** assignment operator.

##### Element Access

1. `T& operator[](size_t index)`: Access element at index **without bounds checking**.
2. `const T& operator[](size_t index) const`: Access element at index **without bounds checking**
   (`const` version).
3. `T& at(size_t index)`: Access element **with bounds checking**. Throws `std::out_of_range` if the
   index is out of bounds.
4. `const T& at(size_t index) const`: Access element **with bounds checking** (`const` version).
   Throws `std::out_of_range` if the index is out of bounds.
5. `T& front()`: Access the **first element**.
6. `T& back()`: Access the **last element**.
7. `const T& front() const`: Access the **first element** (`const` version).
8. `const T& back() const`: Access the **last element** (`const` version).
9. `T* data() noexcept`: Returns **a pointer** to **the underlying C-style array or the raw array**.

##### Capacity

1. `size_t size() const noexcept`: Returns **the number** of elements in the array (constant time).
2. `size_t max_size() const noexcept`: Returns **the maximum number** of elements the array can hold
   (**same as `size()`** in practice).
3. `bool empty() const noexcept`: Returns **true** if the array is **empty** (always false for
   `std::array` since the size is fixed and non-zero).

##### Iterators

1. `iterator begin() noexcept`: Returns **an iterator** to the **first element** of the array.
1. `const_iterator begin() const noexcept`: Returns **a `const` iterator** to the **first element**
   of the array.
1. `const_iterator cbegin() const noexcept`: Returns **a `const` iterator** to the **first element**
   of the array.
1. `iterator end() noexcept`: Returns **an iterator** to one past the **last element** of the array.
1. `const_iterator end() const noexcept`: Returns **a `const` iterator** to one past the **last
   element** of the array.
1. `const_iterator cend() const noexcept`: Returns **a `const` iterator** to one past the **last
   element** of the array.
1. `reverse_iterator rbegin() noexcept`: Returns **a reverse iterator** to the **last element**.
1. `const_reverse_iterator rbegin() const noexcept`: Returns **a const reverse iterator** to the
   **last element**.
1. `const_reverse_iterator crbegin() const noexcept`: Returns **a const reverse iterator** to the
   **last element**.
1. `reverse_iterator rend() noexcept`: Returns **a reverse iterator** to one before the **first
   element**.
1. `const_reverse_iterator rend() const noexcept`: Returns **a const reverse iterator** to one
   before the **first element**.
1. `const_reverse_iterator crend() const noexcept`: Returns **a const reverse iterator** to one
   before the **first element**.

##### Comparison

1. `bool operator==(const std`:`:array& other) const`: Checks for equality.
2. `bool operator!=(const std`:`:array& other) const`: Checks for inequality.
3. `bool operator<(const std`:`:array& other) const`: Compares two arrays **lexicographically**.
4. `bool operator<=(const std`:`:array& other) const`: Checks if the calling array is less than or
   equal to the other array, **lexicographically**.
5. `bool operator>(const std`:`:array& other) const`: Checks if the calling array is greater than
   the other array, **lexicographically**.
6. `bool operator>=(const std`:`:array& other) const`: Checks if the calling array is greater than
   or equal to the other array, **lexicographically**.

##### Modifiers

1. `void fill(const T& value)`: **Assigns** the specified **value** to **all elements** in the
   array.
2. `void swap(std`:`:array& other) noexcept`: **Swaps** the contents of the current array with
   other. Both arrays must have the same size and type.

#### Lexicographical Comparison or Lexicographical Order

1. This means that **the elements of the arrays** are **compared in sequence**, similar to how words
   are compared in a dictionary. The comparison starts **from the first element** and **proceeds
   until a difference is found** or **one of the arrays is exhausted**.

#### Notes

1. Do **not use an actual multidimensional array**. If you need a multidimensional array, flatten it
   and use a one-dimensional array instead. For example, `Type a2d[size_x * size_y];` and
   `Type* a2d = new Type[size_x * size_y];` Both examples create a two-dimensional array using a
   one-dimensional array..
2. When working with actual multidimensional arrays, **performance and memory issues** with pointers
   can arise depending on how the array is allocated and accessed, as **not all elements** may be
   **contiguous in memory**. This can lead to problems such as **memory fragmentation** and **cache
   misses**.
3. `size_t` is **an unsigned integer type** specifically designed to **represent the size** of
   objects or array indices. It is widely used to ensure **portability across platforms** and
   **avoid overflow issues** when working with memory sizes, since it matches the size of the
   addressable memory range on the system.

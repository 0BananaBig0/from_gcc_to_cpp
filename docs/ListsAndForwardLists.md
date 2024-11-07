<!-- vim-markdown-toc GFM -->

- [Lists (Doubly-linked Lists)](#lists-doubly-linked-lists)
  - [Explanation](#explanation)
  - [Declaration Syntax](#declaration-syntax)
  - [Initialization Syntax](#initialization-syntax)
  - [Syntax for Deleting `std::list` Pointers](#syntax-for-deleting-stdlist-pointers)
  - [Members and Related Stuffs](#members-and-related-stuffs)
    - [Links](#links)
    - [Template Parameters](#template-parameters)
    - [Member Types](#member-types)
    - [Member Functions](#member-functions)
    - [Non-member Functions](#non-member-functions)
- [Forward Lists (Singly-linked Lists)](#forward-lists-singly-linked-lists)
  - [Explanation](#explanation-1)
  - [Declaration Syntax](#declaration-syntax-1)
  - [Initialization Syntax](#initialization-syntax-1)
  - [Syntax for Deleting `std::forward_list` Pointers](#syntax-for-deleting-stdforward_list-pointers)
  - [Members and Related Stuffs](#members-and-related-stuffs-1)
    - [Links](#links-1)
    - [Template Parameters](#template-parameters-1)
    - [Member Types](#member-types-1)
    - [Member Functions](#member-functions-1)
    - [Non-member Functions](#non-member-functions-1)

<!-- vim-markdown-toc -->

## Lists (Doubly-linked Lists)

### Explanation

1. Lists are **sequence containers** that allow **constant-time insertion and deletion operations
   anywhere** within the sequence, as well as iteration **in both directions**.
2. List containers are implemented as **doubly linked lists**. These lists can store their elements
   in different and unrelated storage locations.
3. They can be implemented using **two pointers in a class or structure**, allowing them to
   **dynamically grow in size**.
4. **Adding and removing elements** at the beginning or end of **a list** costs **only constant
   time**, while **vectors** are generally **optimized** for **additions and removals** **at the
   end**.
5. Unlike vectors, lists do **not support random access**, meaning they cannot be directly accessed
   at a specific index or have elements retrieved by their index numbers.
6. Their header file is `<list>`.

### Declaration Syntax

```CPP
std::list< Type > list_name;
```

```CPP
std::list< Type >* list_ptr;
```

### Initialization Syntax

```CPP
// Initializer list constructor.
std::list< Type > list_name = { ... };
```

```CPP
// Initializer list constructor.
std::list< Type > list_name{ ... };
```

```CPP
// No initialization, contain garbage values and behave unpredictably.
std::list< Type > list_name;
```

```CPP
// No initialization, contain garbage values and behave unpredictably.
std::list< Type > list_name( size );
```

```CPP
// Initialization with the specific value.
std::list< Type > list_name( size, value );
```

```CPP
// Initializer list constructor.
std::list< Type > list_name1 = { ... };
// Copy constructor.
std::list< Type > list_name2( list_name1 );
```

```CPP
// Initializer list constructor.
std::list< Type > list_name1 = { ... };
// Copy constructor.
std::list< Type > list_name2 = list_name1;
```

```CPP
// Move constructor.
std::list< Type > list_name( { ... } );
```

```CPP
// Constructs the container with the contents of the range `[first, last)`.
std::list< Type > list_name1( { ... } );
std::list< Type > list_name2( list_name1.begin(), list_name1.end() );
```

```CPP
std::list< Type >* list_ptr = new std::list< Type >( size );
```

```CPP
std::list< Type >* list_ptr = new std::list< Type >( size, value );
```

```CPP
// Initializer list constructor.
std::list< Type > list_name = { ... };
std::list< Type >* list_ptr = new std::list< Type >( list_name );
```

```CPP
std::list< Type >* list_ptr = new std::list< Type >{ ... };
```

### Syntax for Deleting `std::list` Pointers

```CPP
delete list_ptr;
```

### Members and Related Stuffs

#### Links

1. [`std::list` in cplusplus](https://cplusplus.com/reference/list/list/).
2. [`std::list` in cppreference](https://en.cppreference.com/w/cpp/container/list).

#### Template Parameters

1. `T`: The type of the elements.
2. `Allocator`: An allocator that is used to acquire/release memory and to construct/destroy the
   elements in that memory.

#### Member Types

1. `value_type`: `T`.
2. `allocator_type`: `Allocator`.
3. `size_type`: Unsigned integer type (usually `std::size_t`).
4. `difference_type`: Signed integer type (usually `std::ptrdiff_t`).
5. `reference`: `value_type&`.
6. `const_reference`: `const value_type&`.
7. `pointer`: `Allocator::pointer` (until C++11), `std::allocator_traits< Allocator >::pointer`
   (since C++11).
8. `const_pointer`: `Allocator::const_pointer` (until C++11),
   `std::allocator_traits< Allocator >::const_pointer` (since C++11).
9. `iterator`: `LegacyBidirectionalIterator` to `value_type`.
10. `const_iterator`: `LegacyBidirectionalIterator` to `const value_type`.
11. `reverse_iterator`: `std::reverse_iterator< iterator >`.
12. `const_reverse_iterator`: `std::reverse_iterator< const_iterator >`.

#### Member Functions

1. (constructor): Constructs the list (public member function).
2. (destructor): Destructs the list (public member function).
3. `operator=`: Assigns values to the container (public member function).
4. `assign`: Assigns values to the container (public member function).
5. `assign_range` (C++23): Assigns a range of values to the container (public member function).
6. `get_allocator`: Returns the associated allocator (public member function).
7. `front`: Access the first element (public member function).
8. `back`: Access the last element (public member function).
9. `begin`, `cbegin`: Returns an iterator to the beginning (public member function).
10. `end`, `cend`: Returns an iterator to the end (public member function).
11. `rbegin`, `crbegin`: Returns a reverse iterator to the beginning (public member function).
12. `rend`, `crend`: Returns a reverse iterator to the end (public member function).
13. `empty`: Checks whether the container is empty (public member function).
14. `size`: Returns the number of elements (public member function).
15. `max_size`: Returns the maximum possible number of elements (public member function).
16. `clear`: Clears the contents (public member function).
17. `insert`: Inserts elements (public member function).
18. `insert_range` (C++23): Inserts a range of elements (public member function).
19. `emplace`: Constructs elements in-place (public member function).
20. `erase`: Erases elements and returns a valid iterator (public member function).
21. `push_back`: Adds an element to the end (public member function).
22. `emplace_back`: Constructs an element in-place at the end (public member function).
23. `append_range` (C++23): Adds a range of elements to the end (public member function).
24. `pop_back`: Removes the last element (public member function).
25. `push_front`: Inserts an element to the beginning (public member function).
26. `emplace_front`: Constructs an element in-place at the beginning (public member function).
27. `prepend_range` (C++23): Adds a range of elements to the beginning (public member function).
28. `pop_front`: Removes the first element (public member function).
29. `resize`: Changes the number of elements stored (public member function).
30. `swap`: Swaps the contents (public member function).
31. `merge`: Merges two sorted lists (public member function).
32. `splice`: Moves elements from another list (public member function).
33. `remove`, `remove_if`: Removes elements satisfying specific criteria (public member function).
34. `reverse`: Reverses the order of the elements (public member function).
35. `unique`: Removes consecutive duplicate elements (public member function).
36. `sort`: Sorts the elements (public member function).

#### Non-member Functions

1. `operator==`, `operator!=/</<=/>/>=` (removed in C++20), `operator<=>` (C++20): Lexicographically
   compares the values of two lists (function template).
2. `std::swap( std::list )`: Specializes the `std::swap` algorithm (function template).
3. `erase( std::list )` (C++20), `erase_if( std::list )` (C++20): Erases all elements satisfying
   specific criteria (function template).

## Forward Lists (Singly-linked Lists)

### Explanation

1. Forward lists are **sequence containers** that allow **constant-time insertion and deletion
   operations at any point** within the sequence.
2. Forward lists are implemented as **singly linked lists**.
3. These lists can store their elements in different, unrelated storage locations, with order
   maintained through a link from each element to the next in the sequence.
4. They can be implemented using **a single pointer within a class or structure**, enabling them to
   **grow dynamically in size**.
5. Unlike vectors, forward lists do **not support random access**, meaning elements cannot be
   accessed directly at specific indices or retrieved by index numbers.
6. Their header file is `<forward_list>`.

### Declaration Syntax

```CPP
std::forward_list< Type > list_name;
```

```CPP
std::forward_list< Type >* list_ptr;
```

### Initialization Syntax

```CPP
// Initializer list constructor.
std::forward_list< Type > list_name = { ... };
```

```CPP
// Initializer list constructor.
std::forward_list< Type > list_name{ ... };
```

```CPP
// No initialization, contain garbage values and behave unpredictably.
std::forward_list< Type > list_name;
```

```CPP
// No initialization, contain garbage values and behave unpredictably.
std::forward_list< Type > list_name( size );
```

```CPP
// Initialization with the specific value.
std::forward_list< Type > list_name( size, value );
```

```CPP
// Initializer list constructor.
std::forward_list< Type > list_name1 = { ... };
// Copy constructor.
std::forward_list< Type > list_name2( list_name1 );
```

```CPP
// Initializer list constructor.
std::forward_list< Type > list_name1 = { ... };
// Copy constructor.
std::forward_list< Type > list_name2 = list_name1;
```

```CPP
// Move constructor.
std::forward_list< Type > list_name( { ... } );
```

```CPP
// Constructs the container with the contents of the range `[first, last)`.
std::forward_list< Type > list_name1( { ... } );
std::forward_list< Type > list_name2( list_name1.begin(), list_name1.end() );
```

```CPP
std::forward_list< Type >* list_ptr = new std::forward_list< Type >( size );
```

```CPP
std::forward_list< Type >* list_ptr = new std::forward_list< Type >( size, value );
```

```CPP
// Initializer list constructor.
std::forward_list< Type > list_name = { ... };
std::forward_list< Type >* list_ptr = new std::forward_list< Type >( list_name );
```

```CPP
std::forward_list< Type >* list_ptr = new std::forward_list< Type >{ ... };
```

### Syntax for Deleting `std::forward_list` Pointers

```CPP
delete list_ptr;
```

### Members and Related Stuffs

#### Links

1. [`std::forward_list` in cplusplus](https://cplusplus.com/reference/forward_list/forward_list/).
2. [`std::forward_list` in cppreference](https://en.cppreference.com/w/cpp/container/forward_list).

#### Template Parameters

1. `T`: The type of the elements.
2. `Allocator`: An allocator that is used to acquire/release memory and to construct/destroy the
   elements in that memory.

#### Member Types

1. `value_type`: `T`.
2. `allocator_type`: `Allocator`.
3. `size_type`: Unsigned integer type (usually `std::size_t`).
4. `difference_type`: Signed integer type (usually `std::ptrdiff_t`).
5. `reference`: `value_type&`.
6. `const_reference`: `const value_type&`.
7. `pointer`: `std::allocator_traits< Allocator >::pointer`.
8. `const_pointer`: `std::allocator_traits< Allocator >::const_pointer`.
9. `iterator`: `LegacyForwardIterator` to `value_type`.
10. `const_iterator`: `LegacyForwardIterator` to `const value_type`.

#### Member Functions

1. (constructor): Constructs the `forward_list` (public member function).
2. (destructor): Destructs the `forward_list` (public member function).
3. `operator=`: Assigns values to the container (public member function).
4. `assign`: Assigns values to the container (public member function).
5. `assign_range` (C++23): Assigns a range of values to the container (public member function).
6. `get_allocator`: Returns the associated allocator (public member function).
7. `front`: Access the first element (public member function).
8. `before_begin`, `cbefore_begin`: Returns an iterator to the element before beginning (public
   member function).
9. `begin`, `cbegin`: Returns an iterator to the beginning (public member function).
10. `end`, `cend`: Returns an iterator to the end (public member function).
11. `empty`: Checks whether the container is empty (public member function).
12. `max_size`: Returns the maximum possible number of elements (public member function).
13. `clear`: Clears the contents (public member function).
14. `insert_after`: Inserts elements after an element (public member function).
15. `emplace_after`: Constructs elements in-place after an element (public member function).
16. `insert_range_after` (C++23): Inserts a range of elements after an element (public member
    function).
17. `erase_after`: Erases elements after an element (public member function).
18. `push_front`: Inserts an element to the beginning (public member function).
19. `emplace_front`: Constructs an element in-place at the beginning (public member function).
20. `prepend_range` (C++23): Adds a range of elements to the beginning (public member function).
21. `pop_front`: Removes the first element (public member function).
22. `resize`: Changes the number of elements stored (public member function).
23. `swap`: Swaps the contents (public member function).
24. `merge`: Merges two sorted lists (public member function).
25. `splice_after`: Moves elements from another `forward_list` (public member function).
26. `remove`, `remove_if`: Removes elements satisfying specific criteria (public member function).
27. `reverse`: Reverses the order of the elements (public member function).
28. `unique`: Removes consecutive duplicate elements (public member function).
29. `sort`: Sorts the elements (public member function).

#### Non-member Functions

1. `operator==`, `operator!=/</<=/>/>=` (removed in C++20), `operator<=>` (C++20): Lexicographically
   compares the values of two `forward_lists` (function template).
2. `std::swap( std::forward_list )`: Specializes the `std::swap` algorithm (function template).
3. `erase( std::forward_list )` (C++20), `erase_if( std::list )` (C++20): Erases all elements
   satisfying specific criteria (function template).

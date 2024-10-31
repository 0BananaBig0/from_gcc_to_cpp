<!-- vim-markdown-toc GFM -->

- [Stacks](#stacks)
  - [Explanation](#explanation)
  - [Declaration Syntax](#declaration-syntax)
  - [Initialization Syntax](#initialization-syntax)
  - [Syntax for Deleting `std::stack` Pointers](#syntax-for-deleting-stdstack-pointers)
  - [Members and Related Stuffs](#members-and-related-stuffs)
    - [Links](#links)
    - [Template Parameters](#template-parameters)
    - [Member Types](#member-types)
    - [Member Objects](#member-objects)
    - [Member Functions](#member-functions)
    - [Non-member Functions](#non-member-functions)
  - [Helper Classes](#helper-classes)
- [Queues](#queues)
  - [Explanation](#explanation-1)
  - [Declaration Syntax](#declaration-syntax-1)
  - [Initialization Syntax](#initialization-syntax-1)
  - [Syntax for Deleting `std::queue` Pointers](#syntax-for-deleting-stdqueue-pointers)
  - [Members and Related Stuffs](#members-and-related-stuffs-1)
    - [Links](#links-1)
    - [Template Parameters](#template-parameters-1)
    - [Member Types](#member-types-1)
    - [Member Objects](#member-objects-1)
    - [Member Functions](#member-functions-1)
    - [Non-member Functions](#non-member-functions-1)
    - [Helper Classes](#helper-classes-1)
- [Priority Queues](#priority-queues)
  - [Explanation](#explanation-2)
  - [Declaration Syntax](#declaration-syntax-2)
  - [Initialization Syntax](#initialization-syntax-2)
  - [Syntax for Deleting `std::priority_queue` Pointers](#syntax-for-deleting-stdpriority_queue-pointers)
  - [Members and Related Stuffs](#members-and-related-stuffs-2)
    - [Links](#links-2)
    - [Template Parameters](#template-parameters-2)
    - [Member Types](#member-types-2)
    - [Member Objects](#member-objects-2)
    - [Member Functions](#member-functions-2)
    - [Non-member Functions](#non-member-functions-2)
    - [Helper Classes](#helper-classes-2)
- [Deques ( Double-ended Queue ) ( Deck )](#deques--double-ended-queue---deck-)
  - [Explanation](#explanation-3)
  - [Declaration Syntax](#declaration-syntax-3)
  - [Initialization Syntax](#initialization-syntax-3)
  - [Syntax for Deleting `std::deque` Pointers](#syntax-for-deleting-stddeque-pointers)
  - [Members and Related Stuffs](#members-and-related-stuffs-3)
    - [Links](#links-3)
    - [Template Parameters](#template-parameters-3)
    - [Member Types](#member-types-3)
    - [Member Functions](#member-functions-3)
    - [Non-member Functions](#non-member-functions-3)

<!-- vim-markdown-toc -->

## Stacks

### Explanation

1. Stacks are a type of **container adaptor**, specifically designed to operate in **a LIFO context
   (last-in first-out)**, where elements are inserted and extracted only from one end of the
   container.
2. The stack **class template** acts as **a wrapper to the underlying container** - **only a
   specific set of functions is provided**.
3. The stack pushes and pops the element from the back of the underlying container, known as the top
   of the stack.
4. Their header file is `<stack>`.

### Declaration Syntax

```CPP
std::stack< Type > stack_name;
```

```CPP
// Not common, not recommend
std::stack< Type, Container< Type > > stack_name;
```

```CPP
std::stack< Type >* stack_ptr;
```

### Initialization Syntax

```CPP
// Default constructor. Value-initializes the underlying container.
std::stack< Type > stack_name;
```

```CPP
Container< Type > cont_name = { ... };
// Copy the content of the `cont_name`.
std::stack< Type, Container< Type > > stack_name( cont_name );
```

```CPP
// Move the content of the underlying container.
std::stack< Type, Container< Type > > stack_name( Container< Type >{ ... } );
```

```CPP
// Move the content of the underlying container.
std::stack< Type > stack_name1( { ... } );
// Copy constructor.
std::stack< Type > stack_name2( stack_name1 );
```

```CPP
// Move the content of the underlying container.
std::stack< Type > stack_name1( { ... } );
// Copy constructor.
std::stack< Type > stack_name2 = stack_name1;
```

```CPP
// Move the content of the underlying container.
std::stack< Type > stack_name1( { ... } );
// Move constructor.
std::stack< Type > stack_name2( std::move( stack_name1 ) );
```

```CPP
std::stack< Type >* stack_ptr = new std::stack< Type >;
```

```CPP
std::stack< Type, Container< Type > >* stack_ptr = new std::stack< Type >( Container< Type >{ ... } );
```

```CPP
// Move the content of the underlying container.
std::stack< Type > stack_name( { ... } );
std::stack< Type >* stack_ptr = new std::stack< Type >( stack_name );
```

```CPP
std::stack< Type >* stack_ptr = new std::stack< Type >( { ... } );
```

### Syntax for Deleting `std::stack` Pointers

```CPP
delete stack_ptr;
```

### Members and Related Stuffs

#### Links

1. [`std::stack` in cplusplus](https://cplusplus.com/reference/stack/stack/).
2. [`std::stack` in cppreference](https://en.cppreference.com/w/cpp/container/stack).

#### Template Parameters

1. `T`: The type of the stored elements. The program is ill-formed if `T` is not the same type as
   `Container::value_type`.
2. `Container`: The type of the underlying container to use to store the elements. The container
   must satisfy the requirements of `SequenceContainer`. Additionally, it must provide the following
   functions with the usual semantics:
   - `back()`, e.g., `std::vector::back()`,
   - `push_back()`, e.g., `std::deque::push_back()`,
   - `pop_back()`, e.g., `std::list::pop_back()`.
3. The standard containers `std::vector` (including `std::vector< bool >`), `std::deque` and
   `std::list` satisfy these requirements. **By default**, if no container class is specified for a
   particular stack class instantiation, **the standard container `std::deque`** is used.

#### Member Types

1. `container_type`: `Container`.
2. `value_type`: `Container::value_type`.
3. `size_type`: `Container::size_type`.
4. `reference`: `Container::reference`.
5. `const_reference`: `Container::const_reference`.

#### Member Objects

1. `Container c`: The underlying container (protected member object).

#### Member Functions

1. (constructor): Constructs the stack (public member function).
2. (destructor): Destructs the stack (public member function).
3. `operator=`: Assigns values to the container adaptor (public member function).
4. `top`: Accesses the top element (public member function).
5. `empty`: Checks whether the container adaptor is empty (public member function).
6. `size`: Returns the number of elements (public member function).
7. `push`: Inserts element at the top (public member function).
8. `push_range` (C++23): Inserts a range of elements at the top (public member function).
9. `emplace`: Constructs element in-place at the top (public member function).
10. `pop`: Removes the top element (public member function).
11. `swap`: Swaps the contents (public member function).

#### Non-member Functions

1. `operator==`, `operator!=/</<=/>/>=` (removed in C++20), `operator<=>` (C++20): Lexicographically
   compares the values of two stacks (function template).
2. `std::swap( std::stack )`: Specializes the `std::swap` algorithm (function template).

### Helper Classes

1. `std::uses_allocator< std::stack >`: Specializes the `std::uses_allocator` type trait (class
   template specialization).
2. `std::formatter< std::stack >` (C++23): Formatting support for `std::stack` (class template
   specialization).

## Queues

### Explanation

1. Queues are a type of **container adaptor**, specifically designed to operate in **a FIFO context
   (first-in first-out)**, where elements are inserted into one end of the container and extracted
   from the other.
2. The queue **class template** acts as **a wrapper to the underlying container - only a specific
   set of functions is provided**.
3. The queue pushes the elements on the back of the underlying container and pops them from the
   front.
4. Their header file is `<queue>`.

### Declaration Syntax

```CPP
std::queue< Type > queue_name;
```

```CPP
// Not common, not recommend
std::queue< Type, Container< Type > > queue_name;
```

```CPP
std::queue< Type >* queue_ptr;
```

### Initialization Syntax

```CPP
// Default constructor. Value-initializes the underlying container.
std::queue< Type > queue_name;
```

```CPP
Container< Type > cont_name = { ... };
// Copy the content of the `cont_name`.
std::queue< Type, Container< Type > > queue_name( cont_name );
```

```CPP
// Move the content of the underlying container.
std::queue< Type, Container< Type > > queue_name( Container< Type >{ ... } );
```

```CPP
// Move the content of the underlying container.
std::queue< Type > queue_name1( { ... } );
// Copy constructor.
std::queue< Type > queue_name2( queue_name1 );
```

```CPP
// Move the content of the underlying container.
std::queue< Type > queue_name1( { ... } );
// Copy constructor.
std::queue< Type > queue_name2 = queue_name1;
```

```CPP
// Move the content of the underlying container.
std::queue< Type > queue_name1( { ... } );
// Move constructor.
std::queue< Type > queue_name1( std::move( queue_name1 ) );
```

```CPP
std::queue< Type >* queue_ptr = new std::queue< Type >;
```

```CPP
std::queue< Type, Container< Type > >* queue_ptr = new std::queue< Type >( Container< Type >{ ... } );
```

```CPP
// Move the content of the underlying container.
std::queue< Type > queue_name( { ... } );
std::queue< Type >* queue_ptr = new std::queue< Type >( queue_name );
```

```CPP
std::queue< Type >* queue_ptr = new std::queue< Type >( { ... } );
```

### Syntax for Deleting `std::queue` Pointers

```CPP
delete queue_ptr;
```

### Members and Related Stuffs

#### Links

1. [`std::queue` in cplusplus](https://cplusplus.com/reference/queue/queue/).
2. [`std::queue` in cppreference](https://en.cppreference.com/w/cpp/container/queue).

#### Template Parameters

1. `T`: The type of the stored elements. The program is ill-formed if `T` is not the same type as
   `Container::value_type`.
2. `Container`: The type of the underlying container to use to store the elements. The container
   must satisfy the requirements of `SequenceContainer`. Additionally, it must provide the following
   functions with the usual semantics:
   - `back()`, e.g., `std::deque::back()`,
   - `front()`, e.g. `std::list::front()`,
   - `push_back()`, e.g., `std::deque::push_back()`,
   - `pop_front()`, e.g., `std::list::pop_front()`.
3. The standard containers `std::deque` and `std::list` satisfy these requirements.

#### Member Types

1. `container_type`: `Container`.
2. `value_type`: `Container::value_type`.
3. `size_type`: `Container::size_type`.
4. `reference`: `Container::reference`.
5. `const_reference`: `Container::const_reference`.

#### Member Objects

1. `Container c`: The underlying container (protected member object).

#### Member Functions

1. (constructor): Constructs the queue (public member function).
2. (destructor): Destructs the queue (public member function).
3. `operator=`: Assigns values to the container adaptor (public member function).
4. `front`: Access the first element (public member function).
5. `back`: Access the last element (public member function).
6. `empty`: Checks whether the container adaptor is empty (public member function).
7. `size`: Returns the number of elements (public member function).
8. `push`: Inserts element at the end (public member function).
9. `push_range` (C++23): Inserts a range of elements at the end (public member function).
10. `emplace`: Constructs element in-place at the end (public member function).
11. `pop`: Removes the first element (public member function).
12. `swap`: Swaps the contents (public member function).

#### Non-member Functions

1. `operator==`, `operator!=/</<=/>/>=` (removed in C++20), `operator<=>` (C++20): Lexicographically
   compares the values of two queues (function template).
2. `std::swap( std::queue )`: Specializes the `std::swap` algorithm (function template).

#### Helper Classes

1. `std::uses_allocator< std::queue >`: Specializes the `std::uses_allocator` type trait (class
   template specialization).
2. `std::formatter< std::queue >` (C++23): Formatting support for `std::queue` (class template
   specialization).

## Priority Queues

### Explanation

1. Priority queues are a type of **container adaptors**, specifically designed such that its **first
   element is always the largest of the elements it contains**, according to **some strict weak
   ordering criterion**.
2. **A user-provided `Compare`** can be supplied to **change the ordering**, e.g. using
   `std::greater< T >` would cause the smallest element to appear as the `top()`.
3. This context is **similar to a heap**, where elements can be **inserted at any moment**, and
   **only the max heap element can be retrieved** (the one at the top in the priority queue).
4. The priority queue **class template** acts as **a wrapper to the underlying container** - **only
   a specific set of functions is provided**.
5. Their header file is `<queue>`.

### Declaration Syntax

```CPP
std::priority_queue< Type > pri_queue_name;
```

```CPP
// Not common, not recommend
std::priority_queue< Type, Container< Type > > pri_queue_name;
```

```CPP
// Not common, not recommend
class Compare {
      bool _reverse;

   public:
      explicit Compare( const bool& rev_param = false ) {
         _reverse = rev_param;
      };

      bool operator()( const Type& lhs, const Type& rhs ) const {
         if( _reverse ) {
            ...
         } else {
            ...
         };
      };
};
std::priority_queue< Type, Container< Type >, Compare > pri_queue_name;
```

```CPP
std::priority_queue< Type, std::vector< Type >, Compare > pri_queue_name;
```

```CPP
std::priority_queue< Type >* pri_queue_ptr;
```

### Initialization Syntax

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::priority_queue< Type > pri_queue_name;
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::priority_queue< Type, Container< Type >, Compare > pri_queue_name;
// Copy-constructs the temporary `Compare` class object. Value-initializes the underlying container.
std::priority_queue< Type, Container< Type >, Compare > re_pri_queue_name( Compare( true ) );
```

```CPP
// Copy-constructs the comparison functor `comp` with the contents of compare. Value-initializes the underlying container.
Compare comp;
std::priority_queue< Type, Container< Type >, Compare  > pri_queue_name( comp );
```

```CPP
Compare comp;
Container< Type > cont_name = { ... };
// Copy the content of the `comp` and the `cont_name`.
std::priority_queue< Type, Container< Type >, Compare  > pri_queue_name( cont_name, comp );
```

```CPP
Compare comp;
// Move the content of the underlying container.
// Copy the content of the `comp`.
std::priority_queue< Type, Container< Type >, Compare  > pri_queue_name( Container< Type >{ ... }, comp );
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::priority_queue< Type > pri_queue_name1;
// Copy constructor.
std::priority_queue< Type > pri_queue_name2( pri_queue_name1 );
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::priority_queue< Type > pri_queue_name1;
// Copy constructor.
std::priority_queue< Type > pri_queue_name2 = pri_queue_name1;
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::priority_queue< Type > pri_queue_name1;
// Move constructor.
std::priority_queue< Type > pri_queue_name2( std::move( pri_queue_name1 ) );
```

```CPP
std::priority_queue< Type >* pri_queue_ptr = new std::priority_queue< Type >;
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::priority_queue< Type > pri_queue_name;
std::priority_queue< Type >* pri_queue_ptr = new std::priority_queue< Type >( pri_queue_name );
```

### Syntax for Deleting `std::priority_queue` Pointers

```CPP
delete pri_queue_ptr;
```

### Members and Related Stuffs

#### Links

1. [`std::priority_queue` in cplusplus](https://cplusplus.com/reference/queue/priority_queue/).
2. [`std::priority_queue` in cppreference](https://en.cppreference.com/w/cpp/container/priority_queue).

#### Template Parameters

1. `T`: The type of the stored elements. The program is ill-formed if `T` is not the same type as
   `Container::value_type`.
2. `Container`: The type of the underlying container to use to store the elements. The container
   must satisfy the requirements of `SequenceContainer`, and its iterators must satisfy the
   requirements of `LegacyRandomAccessIterator`. Additionally, it must provide the following
   functions with the usual semantics:
   - `front()`, e.g., `std::vector::front()`,
   - `push_back()`, e.g., `std::deque::push_back()`,
   - `pop_back()`, e.g., `std::vector::pop_back()`.
3. The standard containers `std::vector` (including `std::vector< bool >`) and `std::deque` satisfy
   these requirements.
4. `Compare`: A `Compare` type providing a strict weak ordering.
5. Note that the `Compare` parameter is defined such that it returns true if its first argument
   comes before its second argument in a weak ordering. But because the priority queue outputs
   largest elements first, the elements that "come before" are actually output last. That is, the
   front of the queue contains the "last" element according to the weak ordering imposed by Compare.

#### Member Types

1. `container_type`: `Container`.
2. `value_compare`: `Compare`.
3. `value_type`: `Container::value_type`.
4. `size_type`: `Container::size_type`.
5. `reference`: `Container::reference`.
6. `const_reference`: `Container::const_reference`.

#### Member Objects

1. `Container c`: The underlying container (protected member object).
2. `Compare comp`: The comparison function object (protected member object).

#### Member Functions

1. (constructor): Constructs the priority_queue (public member function).
2. (destructor): Destructs the priority_queue (public member function).
3. `operator=`: Assigns values to the container adaptor (public member function).
4. `top`: Accesses the top element (public member function).
5. `empty`: Checks whether the container adaptor is empty (public member function).
6. `size`: Returns the number of elements (public member function).
7. `push`: Inserts element and sorts the underlying container (public member function).
8. `push_range` (C++23): Inserts a range of elements and sorts the underlying container (public
   member function).
9. `emplace`: Constructs element in-place and sorts the underlying container (public member
   function).
10. `pop`: Removes the top element (public member function).
11. `swap`: Swaps the contents (public member function).

#### Non-member Functions

1. `std::swap( std::priority_queue )`: Specializes the `std::swap` algorithm (function template).

#### Helper Classes

1. `std::uses_allocator< std::priority_queue >`: Specializes the `std::uses_allocator` type trait
   (class template specialization).
2. `std::formatter< std::priority_queue >` (C++23): Formatting support for `std::priority_queue`
   (class template specialization).

## Deques ( Double-ended Queue ) ( Deck )

### Explanation

1. Dques are **sequence containers ( template classes )** with dynamic sizes that can be expanded or
   contracted on both ends (either its front or its back).
2. They allow for the individual elements to be accessed directly through **random access
   iterators**, with storage handled automatically by expanding and contracting the container as
   needed.
3. They provide a functionality **similar to vectors**, **but with efficient insertion and
   deletion** of elements also **at the beginning** of the sequence, and not only **at its end**.
   But, unlike vectors, deques are **not** guaranteed to **store all its elements in contiguous
   storage locations**: accessing elements in a deque by offsetting a pointer to another element
   causes undefined behavior.

### Declaration Syntax

```CPP
std::deque< Type > deque_name;
```

```CPP
std::deque< Type >* deque_ptr;
```

### Initialization Syntax

```CPP
// Initializer deque constructor.
std::deque< Type > deque_name = { ... };
```

```CPP
// Initializer deque constructor.
std::deque< Type > deque_name{ ... };
```

```CPP
// No initialization, contain garbage values and behave unpredictably.
std::deque< Type > deque_name;
```

```CPP
// No initialization, contain garbage values and behave unpredictably.
std::deque< Type > deque_name( size );
```

```CPP
// Initialization with the specific value.
std::deque< Type > deque_name( size, value );
```

```CPP
// Initializer deque constructor.
std::deque< Type > deque_name1 = { ... };
// Copy constructor.
std::deque< Type > deque_name2( deque_name1 );
```

```CPP
// Initializer deque constructor.
std::deque< Type > deque_name1 = { ... };
// Copy constructor.
std::deque< Type > deque_name2 = deque_name1;
```

```CPP
// Move constructor.
std::deque< Type > deque_name( { ... } );
```

```CPP
std::deque< Type >* deque_ptr = new std::deque< Type >( size );
```

```CPP
std::deque< Type >* deque_ptr = new std::deque< Type >( size, value );
```

```CPP
// Initializer deque constructor.
std::deque< Type > deque_name = { ... };
std::deque< Type >* deque_ptr = new std::deque< Type >( deque_name );
```

```CPP
std::deque< Type >* deque_ptr = new std::deque< Type >{ ... };
```

### Syntax for Deleting `std::deque` Pointers

```CPP
delete deque_ptr;
```

### Members and Related Stuffs

#### Links

1. [`std::deque` in cplusplus](https://cplusplus.com/reference/deque/deque/).
2. [`std::deque` in cppreference](https://en.cppreference.com/w/cpp/container/deque).

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

1. (constructor): Constructs the deque (public member function).
2. (destructor): Destructs the deque (public member function).
3. `operator=`: Assigns values to the container (public member function).
4. `assign`: Assigns values to the container (public member function).
5. `assign_range` (C++23): Assigns a range of values to the container (public member function).
6. `get_allocator`: Returns the associated allocator (public member function).
7. `at`: Access specified element with bounds checking (public member function).
8. `operator[]`: Access specified element (public member function).
9. `front`: Access the first element (public member function).
10. `back`: Access the last element (public member function).
11. `begin`, `cbegin`: Returns an iterator to the beginning (public member function).
12. `end`, `cend`: Returns an iterator to the end (public member function).
13. `rbegin`, `crbegin`: Returns a reverse iterator to the beginning (public member function).
14. `rend`, `crend`: Returns a reverse iterator to the end (public member function).
15. `empty`: Checks whether the container is empty (public member function).
16. `size`: Returns the number of elements (public member function).
17. `max_size`: Returns the maximum possible number of elements (public member function).
18. `shrink_to_fit` (`DR*`): Reduces memory usage by freeing unused memory (public member function).
19. `clear`: Clears the contents (public member function).
20. `insert`: Inserts elements (public member function).
21. `insert_range` (C++23): Inserts a range of elements (public member function).
22. `emplace`: Constructs elements in-place (public member function).
23. `erase`: Erases elements (public member function).
24. `push_back`: Adds an element to the end (public member function).
25. `emplace_back`: Constructs an element in-place at the end (public member function).
26. `append_range` (C++23): Adds a range of elements to the end (public member function).
27. `pop_back`: Removes the last element (public member function).
28. `push_front`: Inserts an element to the beginning (public member function).
29. `emplace_front`: Constructs an element in-place at the beginning (public member function).
30. `prepend_range` (C++23): Adds a range of elements to the beginning (public member function).
31. `pop_front`: Removes the first element (public member function).
32. `resize`: Changes the number of elements stored (public member function).
33. `swap`: Swaps the contents (public member function).

#### Non-member Functions

1. `operator==`, `operator!=/</<=/>/>=` (removed in C++20), `operator<=>` (C++20): Lexicographically
   compares the values of two deques (function template).
2. `std::swap( std::deque )`: Specializes the `std::swap` algorithm (function template).
3. `erase( std::deque )` (C++20), `erase_if( std::deque )` (C++20): Erases all elements satisfying
   specific criteria (function template).

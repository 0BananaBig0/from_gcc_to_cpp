## Stacks

### Explanation

1. Stacks are a type of **container adaptor**, specifically designed to operate in **a LIFO context
   (last-in first-out)**, where elements are inserted and extracted only from one end of the
   container.
2. The stack class template acts as **a wrapper to the underlying container** - **only a specific
   set of functions is provided**.
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
// Aggregate Initialization or Uniform Initialization (C++11 and later).
std::stack< Type > stack_name = { ... };
```

```CPP
// Aggregate Initialization or Uniform Initialization (C++11 and later).
std::stack< Type > stack_name{ ... };
```

```CPP
// No initialization, contain garbage values and behave unpredictably.
std::stack< Type > stack_name;
```

```CPP
Container< Type > cont_name = { ... };
// Copy the content of the cont_name.
std::stack< Type, Container< Type > > stack_name( cont_name );
```

```CPP
// Move the content of the underlying container.
std::stack< Type, Container< Type > > stack_name( Container< Type >{ ... } );
```

```CPP
// Aggregate Initialization.
std::stack< Type > stack_name1 = { ... };
// Copy constructor.
std::stack< Type > stack_name2( stack_name1 );
```

```CPP
// Aggregate Initialization.
std::stack< Type > stack_name1 = { ... };
// Copy constructor.
std::stack< Type > stack_name2 = stack_name1;
```

```CPP
// Move constructor.
std::stack< Type > stack_name( { ... } );
```

```CPP
std::stack< Type >* stack_ptr = new std::stack< Type >;
```

```CPP
std::stack< Type, Container< Type > >* stack_ptr = new std::stack< Type >( Container< Type >{ ... } );
```

```CPP
// Aggregate Initialization.
std::stack< Type > stack_name = { ... };
std::stack< Type >* stack_ptr = new std::stack< Type >( stack_name );
```

```CPP
std::stack< Type >* stack_ptr = new std::stack< Type >{ ... };
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
11. `swap`: swaps the contents (public member function).

#### Non-member Functions

1. `operator==`, `operator!=/</<=/>/>=` (removed in C++20), `operator<=>` (C++20): Lexicographically
   compares the values of two stacks (function template).
2. `std::swap( std::stack )`: Specializes the `std::swap` algorithm (function template).

### Helper classes

1. `std::uses_allocator< std::stack >`: Specializes the `std::uses_allocator` type trait (class
   template specialization).
2. `std::formatter< std::stack >` (C++23): Formatting support for `std::stack` (class template
   specialization).

## Queues

### Explanation

1. Queues are a type of container adaptor, specifically designed to operate in a FIFO context
   (first-in first-out), where elements are inserted into one end of the container and extracted
   from the other.
2. The queue class template acts as a wrapper to the underlying container - only a specific set of
   functions is provided.
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
// Aggregate Initialization or Uniform Initialization (C++11 and later).
std::queue< Type > queue_name = { ... };
```

```CPP
// Aggregate Initialization or Uniform Initialization (C++11 and later).
std::queue< Type > queue_name{ ... };
```

```CPP
// No initialization, contain garbage values and behave unpredictably.
std::queue< Type > queue_name;
```

```CPP
Container< Type > cont_name = { ... };
// Copy the content of the cont_name.
std::queue< Type, Container< Type > > queue_name( cont_name );
```

```CPP
// Move the content of the underlying container.
std::queue< Type, Container< Type > > queue_name( Container< Type >{ ... } );
```

```CPP
// Aggregate Initialization.
std::queue< Type > queue_name1 = { ... };
// Copy constructor.
std::queue< Type > queue_name2( queue_name1 );
```

```CPP
// Aggregate Initialization.
std::queue< Type > queue_name1 = { ... };
// Copy constructor.
std::queue< Type > queue_name2 = queue_name1;
```

```CPP
// Move constructor.
std::queue< Type > queue_name( { ... } );
```

```CPP
std::queue< Type >* queue_ptr = new std::queue< Type >;
```

```CPP
std::queue< Type, Container< Type > >* queue_ptr = new std::queue< Type >( Container< Type >{ ... } );
```

```CPP
// Aggregate Initialization.
std::queue< Type > queue_name = { ... };
std::queue< Type >* queue_ptr = new std::queue< Type >( queue_name );
```

```CPP
std::queue< Type >* queue_ptr = new std::queue< Type >{ ... };
```

### Syntax for Deleting `std::queue` Pointers

```CPP
delete queue_ptr;
```

### Members and Related Stuffs

#### Links

1. [`std::queue` in cplusplus](https://cplusplus.com/reference/list/list/).
2. [`std::queue` in cppreference](https://en.cppreference.com/w/cpp/container/list).

#### Template Parameters

## Priority Queues

### Explanation

### Declaration Syntax

### Initialization Syntax

### Syntax for Deleting `std::priority_queue` Pointers

### Members and Related Stuffs

#### Links

1. [`std::priority_queue` in cplusplus](https://cplusplus.com/reference/list/list/).
2. [`std::priority_queue` in cppreference](https://en.cppreference.com/w/cpp/container/list).

#### Template Parameters

## Deques

### Explanation

### Declaration Syntax

### Initialization Syntax

### Syntax for Deleting `std::deque` Pointers

### Members and Related Stuffs

#### Links

1. [`std::deque` in cplusplus](https://cplusplus.com/reference/list/list/).
2. [`std::deque` in cppreference](https://en.cppreference.com/w/cpp/container/list).

#### Template Parameters

## Sets

### Explanation

### Declaration Syntax

### Initialization Syntax


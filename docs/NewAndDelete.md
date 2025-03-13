<!-- vim-markdown-toc GFM -->

- [`new` and `delete`](#new-and-delete)
  - [`new`](#new)
    - [Explanation](#explanation)
    - [Syntax](#syntax)
  - [`new( address )`](#new-address-)
    - [Explanation](#explanation-1)
    - [Syntax](#syntax-1)
  - [`delete`](#delete)
    - [Explanation](#explanation-2)
    - [Syntax](#syntax-2)
  - [`::operator new( size )`](#operator-new-size-)
    - [Explanation](#explanation-3)
    - [Syntax](#syntax-3)
  - [`::operator delete( ptr )`](#operator-delete-ptr-)
    - [Explanation](#explanation-4)
    - [Syntax](#syntax-4)
- [`malloc`](#malloc)
- [`calloc`](#calloc)
- [`realloc`](#realloc)
- [`free`](#free)
- [Pointers](#pointers)
- [Notes](#notes)

<!-- vim-markdown-toc -->

### `new` and `delete`

#### `new`

##### Explanation

1. The `new` operator **dynamically allocates memory** for an object and **calls
   its constructor**.
2. It **returns a `void` pointer** to the allocated memory.
3. `new` operator:
   - Memory allocation: Calls `::operator new(size)` to allocate memory for the
     object.
   - Object initialization: Calls the constructor to initialize the object.
   - Allocator usage:
     - Calls the allocator’s `allocate` function to allocate memory.
     - Calls the allocator’s `construct` function to initialize the object.
4. `new[]` operator:
   - Memory allocation: Calls :`:operator new[](size)` to allocate memory for an
     array of elements.
   - Element initialization: Calls the constructor for each element in the
     array.
   - Allocator usage:
     - Calls the allocator’s allocate function to `allocate` memory for the
       array.
     - Calls the allocator’s `construct` function to initialize each element.

##### Syntax

```CPP
Type* ptr = new Type;   // For a single object.
```

```CPP
Type* arr_ptr = new Type[size];   // For an array objects.
```

#### `new( address )`

##### Explanation

1. The placement `new` operator allows you to **construct an object at a
   specified memory address**, which is useful for **optimizing memory usage**
   or **working with pre-allocated memory**.
2. It also **calls the constructor** of the object and **returns a `void`
   pointer** to the allocated memory.

##### Syntax

```CPP
Type* ptr = new( address ) Type;   // For a single object.
```

```CPP
Type* arr_ptr = new( address ) Type[size];   // For an array objects.
```

```CPP
// Allocate memory on the stack.
// Its lifetime is managed by its scope.
// `delete` should not be used to `delete` it.
char buffer[sizeof( ClassName )];
Type* arr_ptr = new( buffer ) ClassName();
```

#### `delete`

##### Explanation

1. The `delete` operator **deallocates memory** that was previously **allocated
   with `new`**, **calling the destructor** of the object **before releasing**
   the memory.
2. After calling `delete`, it's a good practice to set the pointer to `nullptr`
   to avoid dangling pointers.
3. `delete` operator:
   - Object destruction:
     - Calls the destructor to destroy the object.
   - Allocator usage:
     - Calls the allocator’s `destroy` function to destroy the object.
     - Calls the allocator’s `deallocate` function to deallocate memory.
   - Memory deallocation:
     - Calls `::operator delete(ptr)` to deallocate memory for the object.
4. `delete[]` operator:
   - Object destruction:
     - Calls the destructor for each element in the array.
   - Allocator usage:
     - Calls the allocator’s `destroy` function to destroy each object.
     - Calls the allocator’s `deallocate` function to deallocate memory.
   - Memory deallocation:
     - Calls `::operator delete[](ptr)` to deallocate memory for the array.

##### Syntax

```CPP
delete ptr;   // For a single object created with `new`.
ptr = nullptr;   // Good practice to avoid dangling pointers.
```

```CPP
delete[] arr_ptr;   // For an array object created with `new[]`.
arr_ptr = nullptr;   // Good practice to avoid dangling pointers.
```

#### `::operator new( size )`

##### Explanation

1. `::operator new` is **a global operator function** that **allocates** raw
   memory **without initializing** it.
2. It's similar to `malloc`, but it **can be overridden** to customize memory
   allocation for user-defined types.
3. It does **not call constructors** and **only allocates memory**.
4. **`::operator delete`** should be used to free memory allocated with
   **`::operator new`**.

##### Syntax

```CPP
// Declaration syntax.
void* ptr = ::operator new( size_t size );
```

```CPP
// Its usage syntax.
Type* ptr = static_cast< Type* >( ::operator new( num * sizeof( Type ) ) );
```

#### `::operator delete( ptr )`

##### Explanation

1. `::operator delete` is **a global operator function** that **deallocates
   memory** previously **allocated with `::operator new`**.
2. It's similar to `free`, but it **can be overridden** to customize memory
   deallocation for user-defined types.
3. `::operator delete` does **not call destructors** and **only frees the
   memory**.
4. After calling `::operator delete`, it's a good practice to set the pointer to
   `nullptr` to avoid dangling pointers.

##### Syntax

```CPP
// Declaration syntax.
void operator delete( void* ptr ) noexcept;
```

```CPP
// Its usage syntax.
::operator delete( ptr );
ptr = nullptr;   // Good practice to avoid dangling pointers.
```

### `malloc`

1. [`malloc`](./SomeCFunctionsAndOperators.md#malloc)

### `calloc`

1. [`calloc`](./SomeCFunctionsAndOperators.md#calloc)

### `realloc`

1. [`realloc`](./SomeCFunctionsAndOperators.md#realloc)

### `free`

1. [`free`](./SomeCFunctionsAndOperators.md#free)

### Pointers

1. [Pointers](./CPPPerface.md#pointers)

### Notes

1. When a temporary object is created using `new`, `malloc`, or `calloc` and is
   passed to a function or object, the function or object is responsible for
   destroying the temporary object.
2. In fact, when `new`, `malloc`, or `calloc` is called within a pair of
   parentheses, the owner of the parentheses is the caller of `new`, `malloc`,
   or `calloc`.
3. The caller is responsible for destroying the dynamic memory.

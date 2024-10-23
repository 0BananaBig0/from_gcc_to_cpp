<!-- vim-markdown-toc GFM -->

- [`new` and `delete`](#new-and-delete)
  - [`new`](#new)
    - [Syntax](#syntax)
    - [Explanation](#explanation)
  - [`new( address )`](#new-address-)
    - [Syntax](#syntax-1)
    - [Explanation](#explanation-1)
  - [`delete`](#delete)
    - [Syntax](#syntax-2)
    - [Explanation](#explanation-2)
  - [`::operator new( size )`](#operator-new-size-)
    - [Syntax](#syntax-3)
    - [Explanation](#explanation-3)
  - [`operator delete(ptr)`](#operator-deleteptr)
    - [Syntax](#syntax-4)
    - [Explanation](#explanation-4)
  - [`malloc`](#malloc)
    - [Syntax](#syntax-5)
    - [Explanation](#explanation-5)
  - [`calloc`](#calloc)
    - [Syntax](#syntax-6)
    - [Explanation](#explanation-6)
  - [`realloc`](#realloc)
    - [Syntax](#syntax-7)
    - [Explanation](#explanation-7)
  - [`free`](#free)
    - [Syntax](#syntax-8)
    - [Explanation](#explanation-8)
  - [Notes](#notes)

<!-- vim-markdown-toc -->

### `new` and `delete`

#### `new`

##### Syntax

```CPP
Type* ptr = new Type;   // For a single object
```

```CPP
Type* arr_ptr = new Type[size];   // For an array of objects
```

##### Explanation

1. The `new` operator **dynamically allocates memory** for an object and **calls its constructor**.
2. It **returns a `void` pointer** to the allocated memory.

#### `new( address )`

##### Syntax

```CPP
Type* ptr = new( address ) Type;   // For a single object
```

```CPP
Type* arr_ptr = new( address ) Type[size];   // For an array of objects
```

##### Explanation

1. The placement `new` operator allows you to **construct an object at a specified memory address**,
   which is useful for **optimizing memory usage** or **working with pre-allocated memory**.
2. It also **calls the constructor** of the object and **returns a `void` pointer** to the allocated
   memory.

#### `delete`

##### Syntax

```CPP
delete ptr;   // For a single object
ptr = nullptr;   // Good practice to avoid dangling pointers
```

```CPP
delete[] arr_ptr;   // For an array of objects
arr_ptr = nullptr;   // Good practice to avoid dangling pointers
```

##### Explanation

1. The `delete` operator **deallocates memory** that was previously **allocated with `new`**,
   **calling the destructor** of the object **before releasing** the memory.
2. After calling `delete`, it's a good practice to set the pointer to `nullptr` to avoid dangling
   pointers.

#### `::operator new( size )`

##### Syntax

```CPP
// Its declaration syntax
void* ptr = ::operator new( size_t size );
```

```CPP
// Its usage syntax
Type* ptr = static_cast< Type* >( ::operator new( num * sizeof( Type ) ) );
```

##### Explanation

1. `::operator new` is **a global operator function** that **allocates** raw memory **without
   initializing** it.
2. It's similar to `malloc`, but it **can be overridden** to customize memory allocation for
   user-defined types.
3. It does **not call constructors** and **only allocates memory**.
4. **`::operator delete`** should be used to free memory allocated with **`::operator new`**.

#### `operator delete(ptr)`

##### Syntax

```CPP
// Its declaration syntax
void operator delete( void* ptr ) noexcept;
```

```CPP
// Its usage syntax
::operator delete( ptr );
ptr = nullptr;   // Good practice to avoid dangling pointers
```

##### Explanation

1. `::operator delete` is **a global operator function** that **deallocates memory** previously
   **allocated with `::operator new`**.
2. It's similar to `free`, but it **can be overridden** to customize memory deallocation for
   user-defined types.
3. `::operator delete` does **not call destructors** and **only frees the memory**.
4. After calling `::operator delete`, it's a good practice to set the pointer to `nullptr` to avoid
   dangling pointers.

#### `malloc`

##### Syntax

```CPP
// Its declaration syntax
void* ptr = malloc( size_t size );
```

```CPP
// Its usage syntax
Type* ptr = (Type*)malloc( num * sizeof( Type )size );
```

##### Explanation

1. `malloc (memory allocation)` is **a function** that **allocates** a specified number of bytes of
   **memory** **without initializing** it.
2. It **returns a `void` pointer** to the allocated memory.
3. When using `malloc` to allocate memory for an object, **no constructor function will be called**.
4. `free` should be used to deallocate memory allocated with `malloc`.

#### `calloc`

##### Syntax

```CPP
// Its declaration syntax
void* ptr = calloc( size_t num, size_t size );
```

```CPP
// Its usage syntax
Type* ptr = (Type*)calloc( num, sizeof( Type ) );
```

##### Explanation

1. `calloc` (contiguous allocation) is **a function** that **allocates** a specified number of bytes
   of **memory** and **initializes** all bits **to zero**.
2. It **returns a `void` pointer** to the allocated memory.
3. When using `calloc` to allocate memory for an object, **no constructor function will be called**.
4. `free` should be used to deallocate memory allocated with `calloc`.

#### `realloc`

##### Syntax

```CPP
// Its declaration syntax
void* realloc( void* ptr, size_t new_size );
```

```CPP
// Its usage syntax
Type* ptr = (Type*)malloc( num1 * sizeof( Type ) );
Type* new_ptr = (Type*)realloc( ptr, num2 * sizeof( Type ) );
```

##### Explanation

1. The `realloc` function is used to **resize a previously allocated memory block**.
2. It can either **expand** or **shrink** **the size** of the memory block.
3. If the block is **expanded**, `realloc` may **move the block to a new location** in memory, and
   it **preserves the contents** of the original memory up to the lesser of the new or old size.
4. It **returns a `void` pointer** to the resized memory.
5. `free` should be used to deallocate memory resized with `calloc`.

#### `free`

##### Syntax

```CPP
// Its declaration syntax
void free( void* ptr );
```

```CPP
// Its usage syntax
// Free the allocated memory
free( ptr );
ptr = NULL;   // Good practice to avoid dangling pointers
```

##### Explanation

1. The `free` function is used to **deallocate memory** that was previously **allocated with
   `malloc`, `calloc`, or `realloc`**.
2. It releases **the memory back to the system**, allowing it to be reused.
3. When using `free` to deallocate memory for an object, **no destructor function will be called**
4. After calling `free`, it's a good practice to set the pointer to `NULL` to avoid dangling
   pointers.

#### Notes

1. It is important to ensure that memory is **deallocated** using the **corresponding** operator
   that was used for **allocation** to **avoid undefined behavior**.

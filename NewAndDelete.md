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
  - [`operator delete( ptr )`](#operator-delete-ptr-)
    - [Syntax](#syntax-4)
    - [Explanation](#explanation-4)
- [`malloc`](#malloc)
- [`calloc`](#calloc)
- [`realloc`](#realloc)
- [`free`](#free)

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

#### `operator delete( ptr )`

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

### `malloc`

### `calloc`

### `realloc`

### `free`

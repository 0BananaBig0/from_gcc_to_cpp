<!-- vim-markdown-toc GFM -->

- [Some C Functions and Operators](#some-c-functions-and-operators)
  - [`sizeof`](#sizeof)
    - [Syntax](#syntax)
    - [Explanation](#explanation)
  - [`strlen`](#strlen)
    - [Syntax](#syntax-1)
    - [Explanation](#explanation-1)
  - [`malloc`](#malloc)
    - [Syntax](#syntax-2)
    - [Explanation](#explanation-2)
  - [`calloc`](#calloc)
    - [Syntax](#syntax-3)
    - [Explanation](#explanation-3)
  - [`realloc`](#realloc)
    - [Syntax](#syntax-4)
    - [Explanation](#explanation-4)
  - [`free`](#free)
    - [Syntax](#syntax-5)
    - [Explanation](#explanation-5)
  - [`strcpy`](#strcpy)
    - [Syntax](#syntax-6)
    - [Explanation](#explanation-6)
  - [`memcpy` ( Shallow Copy )](#memcpy--shallow-copy-)
    - [Syntax](#syntax-7)
    - [Explanation](#explanation-7)
  - [`memset`](#memset)
    - [Syntax](#syntax-8)
    - [Explanation](#explanation-8)

<!-- vim-markdown-toc -->

## Some C Functions and Operators

### `sizeof`

#### Syntax

```CPP
sizeof( type )
```

```CPP
sizeof variable
```

```CPP
sizeof( expression )
```

#### Explanation

1. `sizeof` is **a compile-time operator** that **returns the size**, in bytes, **of a type or
   object**. It can be used with types, variables, or expressions.
2. The result is of type `size_t`, which is an unsigned integral type.

### `strlen`

#### Syntax

```CPP
// Its declaration syntax
size_t strlen( const char *str );
```

```CPP
// Its usage syntax
size_t len = strlen( str );
```

#### Explanation

1. `strlen` is **a function** that returns **the length of a C-style string** (a null-terminated
   array of characters).
2. It counts **the number of characters** in the string, **excluding** the **null** terminator.

### `malloc`

#### Syntax

```CPP
// Its declaration syntax
void* ptr = malloc( size_t size );
```

```CPP
// Its usage syntax
Type* ptr = (Type*)malloc( num * sizeof( Type ) );
```

#### Explanation

1. `malloc (memory allocation)` is **a function** that **allocates** a specified number of bytes of
   **memory** **without initializing** it.
2. It **returns a `void` pointer** to the allocated memory.
3. When using `malloc` to allocate memory for an object, **no constructor function will be called**.
4. `free` should be used to deallocate memory allocated with `malloc`.

### `calloc`

#### Syntax

```CPP
// Its declaration syntax
void* ptr = calloc( size_t num, size_t size );
```

```CPP
// Its usage syntax
Type* ptr = (Type*)calloc( num, sizeof( Type ) );
```

#### Explanation

1. `calloc` (contiguous allocation) is **a function** that **allocates** a specified number of bytes
   of **memory** and **initializes** all bits **to zero**.
2. It **returns a `void` pointer** to the allocated memory.
3. When using `calloc` to allocate memory for an object, **no constructor function will be called**.
4. `free` should be used to deallocate memory allocated with `calloc`.

### `realloc`

#### Syntax

```CPP
// Its declaration syntax
void* realloc( void* ptr, size_t new_size );
```

```CPP
// Its usage syntax
Type* ptr = (Type*)malloc( num1 * sizeof( Type ) );
Type* new_ptr = (Type*)realloc( ptr, num2 * sizeof( Type ) );
```

#### Explanation

1. The `realloc` function is used to **resize a previously allocated memory block**.
2. It can either **expand** or **shrink** **the size** of the memory block.
3. If the block is **expanded**, `realloc` may **move the block to a new location** in memory, and
   it **preserves the contents** of the original memory up to the lesser of the new or old size.
4. It **returns a `void` pointer** to the resized memory.
5. `free` should be used to deallocate memory resized with `calloc`.

### `free`

#### Syntax

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

#### Explanation

1. The `free` function is used to **deallocate memory** that was previously **allocated with
   `malloc`, `calloc`, or `realloc`**.
2. It releases **the memory back to the system**, allowing it to be reused.
3. When using `free` to deallocate memory for an object, **no destructor function will be called**
4. After calling `free`, it's a good practice to set the pointer to `NULL` to avoid dangling
   pointers.

### `strcpy`

#### Syntax

```CPP
// Its declaration syntax
char* strcpy( char* destination, const char* source );
```

```CPP
// Its usage syntax
strcpy( dest, sour_str );
```

#### Explanation

1. The `strcpy` function **copies the C-string** pointed to by source (**including** the **null**
   terminator) to the array pointed to by destination.
2. The destination array must be large enough to hold the copied string.
3. If the destination is not large enough, it can lead to buffer overflow, resulting in undefined
   behavior.

### `memcpy` ( Shallow Copy )

#### Syntax

```CPP
// Its declaration syntax
void* memcpy( void* destination, const void* source, size_t num );
```

```CPP
// Its usage syntax, for a string
// +1 to include null terminator
memcpy( dest, sour, strlen( sour ) + 1 );
```

```CPP
// Its usage syntax, for a non-string array
memcpy( dest, sour, strlen( sour ) );
```

#### Explanation

1. The `memcpy` function **copies `num` bytes** from the memory area pointed to **by source** to the
   memory area pointed to **by destination**.
2. It's important to ensure that the destination has enough space to accommodate the copied bytes.
3. Unlike `strcpy`, `memcpy` does **not stop at a null terminator**, making it suitable for raw
   memory copying.

### `memset`

#### Syntax

```CPP
// Its declaration syntax
void* memset( void* ptr, int value, size_t num );
```

```CPP
// Its usage syntax
memcpy( ptr, val, num );
```

#### Explanation

1. The `memset` function sets **the first `num` bytes** of the memory area pointed to by ptr **to
   the specified value**.
2. This is commonly used to **initialize or reset a block of memory**, such as clearing an array or
   setting a structure to zero.
3. The parameter `int value` in `memset` is treated as **an unsigned char** when setting the bytes
   in memory

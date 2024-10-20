<!-- vim-markdown-toc GFM -->

- [Char and String](#char-and-string)
  - [Char](#char)
    - [Syntax](#syntax)
    - [Explanation](#explanation)
    - [Char Types](#char-types)
  - [A Raw String or a Char **Array**](#a-raw-string-or-a-char-array)
    - [Syntax](#syntax-1)
    - [Explanation](#explanation-1)
  - [A `std::string`](#a-stdstring)
      - [Declaration Syntax](#declaration-syntax)
      - [Initialization Syntax](#initialization-syntax)
    - [Explanation](#explanation-2)
    - [Member Functions](#member-functions)
    - [String Types in STL](#string-types-in-stl)
    - [Small String optimization](#small-string-optimization)
    - [How to Make Strings Faster in C++: C++17](#how-to-make-strings-faster-in-c-c17)
  - [`std::string_view`](#stdstring_view)
    - [Syntax](#syntax-2)
    - [Explanation](#explanation-3)
    - [Member Functions](#member-functions-1)
  - [`std::literals` Namespace](#stdliterals-namespace)

<!-- vim-markdown-toc -->
## Char and String

### Char

#### Syntax

```CPP
char var_name = 'a letter';
```

```CPP
char var_name;
var_name = 'a letter';
```

#### Explanation

1. A char is a fundamental data type in C++ that stores a single character. It can represent
   letters, digits, punctuation, and other symbols.
2. The value is enclosed in **single quotes (`'`)**. The size of a char is typically **one byte**,
   allowing for 256 different values (0 to 255), which correspond to the **ASCII character set**.
3. `'a letter'`: A `char` literal, a `char` type value.

#### Char Types

1. `char`, `wchar_t`, `char16_t`, and others represent **different character types** in C++. While
   they all store character data, there are notable **differences** in **their size** and **intended
   use**.

### A Raw String or a Char **Array**

#### Syntax

```CPP
// Implicit conversion occurs,
// "a string" is a const chary array.
char var_name[] = "a string";
```

```CPP
char var_name[letter_count + 1] = "a string";
```

```CPP
// `'\0'` or `0` should be explicitly included at the end.
char var_name[] = { 'a letter', 'a letter', ..., '\0' };
```

```CPP
// `'\0'` or `0` should be explicitly included at the end.
char var_name[letter_count + 1] = { 'a letter', 'a letter', ..., '\0' };
```

```CPP
char var_name[] = "a string";
char* var_ptr = var_name; // Allowed, a non-const `char` pointer points to a non-const `char` array..
```

```CPP
// A string literal is a `const char` array. When using a pointer to reference it, use a `const char` pointer.
const char* var_ptr =  "a string";
// char* var_ptr = "a string"; // Not allowed, an undefined operation.
char var_name =  var_ptr[index];
```

#### Explanation

1. A raw string or a character array is **a sequence of characters** **terminated by a null
   character** (`'\0'`).
2. This means there is **a termination character** called **null**(**zero value**) at the end of a
   string-type variable by default, which indicates where **the end of the string** is.
3. The value is enclosed in **double quotes** (`"`) and the **size** of the string is determined by
   **the number of characters plus one** for the null terminator.
4. `"a string"`: A string literal, a `const char` array.
5. A string literal is **stored** in the **read-only section** of memory. However, if it is used to
   **initialize a non-const char array**, its **contents** will be **copied to the array**, which
   can then be **modified like any other array**.
6. When **single quotes** or **memcpy** are used to assign or copy values to a char array or a char
   pointer, **`'\0'` or `0`** **should be explicitly included** at the end.
7. A char array is a type of **array**, meaning that **all syntax applicable to arrays** is **also
   suitable for char arrays**.

### A `std::string`

##### Declaration Syntax

```CPP
std::string var_name;
```

##### Initialization Syntax

```CPP
// Direct initialization
std::string var_name = "a string";
```

```CPP
// Constructor initialization
std::string var_name( "a string" );
```

```CPP
// Without related parameterized constructors and all members are public, Aggregate Initialization
// With related parameterized constructors, Parameterized Constructor or Uniform Initialization or Brace Initialization
std::string var_name{ "a string" };
```

```CPP
// Concatenation
std::string var_name = std::string( "a string" ) + "another string";
// += has been overloaded in std::string type
var_name += "..."; // Allowed
// Error: a string literal is a `const char` array. Two arrays cannot be concatenated without overloading the `+` operator.
// std::string var_name = "a string" + "another string"; // Not allowed
```

#### Explanation

1. std::string is **a class** in the C++ STL that represents **a sequence of characters**.
2. It has several features, including the following:
   - **Dynamic Sizing**: std::string can grow and shrink in size automatically, allowing for easy
     modifications without the need for manual memory management.
   - **Memory Management**: It handles memory allocation and deallocation internally, reducing the
     risk of memory leaks and buffer overflows.
   - **Null-Termination**: Unlike C-style strings, which require a null terminator to indicate the
     end of the string, std::string **manages this internally**.
   - **Compatibility**: It can easily be converted to and from C-style strings using the `c_str()`
     member function.
3. The `std::string` type is **safer** than the char pointer or the char array, but **slower** than
   the latter.

#### Member Functions

1. [`std::string` in cplusplus](https://cplusplus.com/reference/string/string/).
2. [`std::string` in cppreference](https://en.cppreference.com/w/cpp/string/basic_string).

#### String Types in STL

1. `std::string`, `std::wstring`, `std::u32string` and others represent **different string types**
   in C++. While they all store character sequences, there are notable **differences** in
   **character encoding**, **size of characters**, and **intended use**.

#### Small String optimization

1. C++ STL **stores a string** with **a small size** depending on how to implement the standard
   library, usually which is **smaller than 16 characters**, **on stack**.
2. **Otherwise**, it stores a string **on heap**.
3. Therefore, if the string is **small enough**, we **define** it **as a `std::string`** type instad
   of const char pointer type. However, if the code compiled in **debug mode**, even the string is
   **small enough**, it **still** causes **a head allocation**.

#### How to Make Strings Faster in C++: C++17

1. Use **`std::string_view`** to **get a substring** of a `std::string`, instead of
   `std::string::substr()`.
2. Use **const char pointer** to **store a string**, instead of `std::string`. `std::string`
   requires one memory allocation, while const char pointer does not.
3. When **a `const char` pointer** is passed **to** a function whose argument is **a
   `const std::string` reference**, **one memory allocation** occurs. However, if the argument of
   the function is changed from a `const std::string` reference to **a `std::string_view`**, **no
   memory allocation** occurs.
4. Every time, **a char pointer or a char array** is **converted into a `std::string` implicitly**,
   **although** the argument of the function is a `std::string` **reference**, **one memory
   allocation occurs**.

### `std::string_view`

#### Syntax

```CPP
// Direct initialization
std::string_view var_name = "a string";
```

```CPP
// Constructor initialization
std::string_view var_name( "a string" );
```

```CPP
// Without related parameterized constructors and all members are public, Aggregate Initialization
// With related parameterized constructors, Parameterized Constructor or Uniform Initialization or Brace Initialization
std::string_view var_name{ "a string" };
```

#### Explanation

1. `std::string_view` is a lightweight, **non-owning reference** to a sequence of characters in C++.
2. It provides a way to **efficiently** work with strings **without copying** them, making it
   particularly **useful for accessing substrings** or **interfacing with C-style strings**.
3. Since it does **not manage the memory** it points to, **users must ensure** that **the referenced
   data remains valid** for the duration of the `string_view`.
4. **This class** allows for **read-only access** to character sequences, **improving performance**
   in scenarios where **string immutability** is required.

#### Member Functions

1. [`std::string_view` in cplusplus]().
2. [`std::string_view` in cppreference](https://en.cppreference.com/w/cpp/string/basic_string_view).

### `std::literals` Namespace
1. [`std::literals` in cplusplus]().
1. [`std::literals` in cppreference](https://en.cppreference.com/w/cpp/symbol_index/literals).

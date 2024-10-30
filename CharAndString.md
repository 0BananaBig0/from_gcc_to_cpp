<!-- vim-markdown-toc GFM -->

- [Char and String](#char-and-string)
  - [Char](#char)
    - [Explanation](#explanation)
    - [Syntax](#syntax)
    - [Char Types](#char-types)
  - [A Raw String or a Char **Array**](#a-raw-string-or-a-char-array)
    - [Explanation](#explanation-1)
    - [Syntax](#syntax-1)
  - [A `std::string`](#a-stdstring)
    - [Explanation](#explanation-2)
    - [Declaration Syntax](#declaration-syntax)
    - [Initialization Syntax](#initialization-syntax)
    - [Members and Related Stuffs](#members-and-related-stuffs)
      - [Links](#links)
      - [Template Parameters](#template-parameters)
      - [Member Types](#member-types)
      - [Member Functions](#member-functions)
      - [Constants](#constants)
      - [Non-member Functions](#non-member-functions)
      - [Numeric Conversions](#numeric-conversions)
      - [Literals](#literals)
      - [Helper Classes](#helper-classes)
    - [String Types in STL](#string-types-in-stl)
    - [Small String optimization](#small-string-optimization)
    - [How to Make Strings Faster in C++: C++17](#how-to-make-strings-faster-in-c-c17)
  - [`std::string_view`](#stdstring_view)
    - [Explanation](#explanation-3)
    - [Syntax](#syntax-2)
    - [Member Functions](#member-functions-1)
      - [Links](#links-1)
      - [Template Parameters](#template-parameters-1)
      - [Member Types](#member-types-1)
      - [Member Functions](#member-functions-2)
      - [Constants](#constants-1)
      - [Non-member Functions](#non-member-functions-1)
      - [Literals](#literals-1)
      - [Helper Classes](#helper-classes-1)
      - [Helper Templates](#helper-templates)
  - [`std::literals` Namespace](#stdliterals-namespace)

<!-- vim-markdown-toc -->

## Char and String

### Char

#### Explanation

1. A char is a fundamental data type in C++ that stores a single character. It can represent
   letters, digits, punctuation, and other symbols.
2. The value is enclosed in **single quotes (`'`)**. The size of a char is typically **one byte**,
   allowing for 256 different values (0 to 255), which correspond to the **ASCII character set**.
3. `'a letter'`: A `char` literal, a `char` type value.

#### Syntax

```CPP
char var_name = 'a letter';
```

```CPP
char var_name;
var_name = 'a letter';
```

#### Char Types

1. `char`, `wchar_t`, `char16_t`, and others represent **different character types** in C++. While
   they all store character data, there are notable **differences** in **their size** and **intended
   use**.

### A Raw String or a Char **Array**

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

### A `std::string`

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

#### Declaration Syntax

```CPP
std::string var_name;
```

#### Initialization Syntax

```CPP
// Direct initialization
std::string var_name = "a string";
```

```CPP
// Constructor initialization
std::string var_name( "a string" );
```

```CPP
// Initializer list constructor.
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

#### Members and Related Stuffs

##### Links

1. [`std::string` in cplusplus](https://cplusplus.com/reference/string/string/).
2. [`std::string` in cppreference](https://en.cppreference.com/w/cpp/string/basic_string).

##### Template Parameters

1. `CharT`: Character type
2. `Traits`: Traits class specifying the operations on the character type.
3. `Allocator`: Allocator type used to allocate internal storage.

##### Member Types

1. `traits_type`: `Traits`.
2. `value_type`: `CharT`.
3. `allocator_type`: `Allocator`.
4. `size_type`: `Allocator::size_type` (until C++11),
   `std::allocator_traits< Allocator >::size_type` (since C++11).
5. `difference_type`: `Allocator::difference_type` (until C++11),
   `std::allocator_traits< Allocator >::difference_type` (since C++11).
6. `reference`: `value_type&`.
7. `const_reference`: `const value_type&`.
8. `pointer`: `Allocator::pointer` (until C++11), `std::allocator_traits< Allocator >::pointer`
   (since C++11).
9. `const_pointer`: `Allocator::const_pointer` (until C++11),
   `std::allocator_traits< Allocator >::const_pointer` (since C++11).
10. `iterator`: `LegacyRandomAccessIterator` and `LegacyContiguousIterator` to `value_type` (until
    C++20), `LegacyRandomAccessIterator`, `contiguous_iterator`, and `ConstexprIterator` to
    `value_type` (since C++20).
11. `const_iterator`: `LegacyRandomAccessIterator` and `LegacyContiguousIterator` to
    `const value_type` (until C++20), `LegacyRandomAccessIterator`, `contiguous_iterator`, and
    `ConstexprIterator` to `const value_type` (since C++20).
12. `reverse_iterator`: `std::reverse_iterator< iterator >`.
13. `const_reverse_iterator`: `std::reverse_iterator< const_iterator >`.

##### Member Functions

1. (constructor): Constructs a basic_string (public member function).
2. (destructor): Destroys the string, deallocating internal storage if used (public member
   function).
3. `operator=`: Assigns values to the string (public member function).
4. `assign`: Assign characters to a string (public member function).
5. `assign_range` (C++23): Assign a range of characters to a string (public member function).
6. `get_allocator`: Returns the associated allocator (public member function).
7. `at`: Accesses the specified character with bounds checking (public member function).
8. `operator[]`: Accesses the specified character (public member function).
9. `front` (DR): Accesses the first character (public member function).
10. `back` (DR): Accesses the last character (public member function).
11. `data`: Returns a pointer to the first character of a string (public member function).
12. `c_str`: Returns a non-modifiable standard C character array version of the string (public
    member function).
13. `operator basic_string_view` (C++17): Returns a non-modifiable string_view into the entire
    string (public member function).
14. `begin`, `cbegin`: Returns an iterator to the beginning (public member function).
15. `end`, `cend`: Returns an iterator to the end (public member function).
16. `rbegin`, `crbegin`: Returns a reverse iterator to the beginning (public member function).
17. `rend`, `crend`: Returns a reverse iterator to the end (public member function).
18. `empty`: Checks whether the string is empty (public member function).
19. `size`, `length`: Returns the number of characters (public member function).
20. `max_size`: Returns the maximum number of characters (public member function).
21. `reserve`: Reserves storage (public member function).
22. `capacity`: Returns the number of characters that can be held in currently allocated storage
    (public member function).
23. `shrink_to_fit` (DR): Reduces memory usage by freeing unused memory (public member function).
24. `clear`: Clears the contents (public member function).
25. `insert`: Inserts characters (public member function).
26. `insert_range` (C++23): Inserts a range of characters (public member function).
27. `erase`: Removes characters (public member function).
28. `push_back`: Appends a character to the end (public member function).
29. `pop_back` (DR): Removes the last character (public member function).
30. `append`: Appends characters to the end (public member function).
31. `append_range` (C++23): Appends a range of characters to the end (public member function).
32. `operator+=`: Appends characters to the end (public member function).
33. `replace`: Replaces specified portion of a string (public member function).
34. `replace_with_range` (C++23): Replaces specified portion of a string with a range of characters
    (public member function).
35. `copy`: Copies characters (public member function).
36. `resize`: Changes the number of characters stored (public member function).
37. `resize_and_overwrite` (C++23): Changes the number of characters stored and possibly overwrites
    indeterminate contents via user-provided operation (public member function).
38. `swap`: Swaps the contents (public member function).
39. `find`: Finds the first occurrence of the given substring (public member function).
40. `rfind`: Find the last occurrence of a substring (public member function).
41. `find_first_of`: Find first occurrence of characters (public member function).
42. `find_first_not_of`: Find first absence of characters (public member function).
43. `find_last_of`: Find last occurrence of characters (public member function).
44. `find_last_not_of`: Find last absence of characters (public member function).
45. `compare`: Compares two strings (public member function).
46. `starts_with` (C++20): Checks if the string starts with the given prefix (public member
    function).
47. `ends_with` (C++20): Checks if the string ends with the given suffix (public member function).
48. `contains` (C++23): Checks if the string contains the given substring or character (pub`lic
    member function).
49. `substr`: Returns a substring (public member function).

##### Constants

1. npos` [`static`]: Special value. The exact meaning depends on the context (public static member
   constant).

##### Non-member Functions

1. `operator+`: Concatenates two strings, a string and a char, or a string and string_view (function
   template).
2. `operator==/!=/</>/<=/>=` (removed in C++20), `operator<=>` (C++20): Lexicographically compares
   two strings (function template).
3. `std::swap( std::basic_string )`: Specializes the std::swap algorithm (function template).
4. `erase( std::basic_string )`, `erase_if( std::basic_string )` (C++20): Erases all elements
   satisfying specific criteria (function template).
5. `operator<<`, `operator>>`: Performs stream input and output on strings (function template).
6. `getline`: Read data from an I/O stream into a string (function template).

##### Numeric Conversions

1. `stoi`, `stol`, `stoll`: Converts a string to a signed integer (function).
2. `stoul`, `stoull`: Converts a string to an unsigned integer (function).
3. `stof`, `stod`, `stold`: Converts a string to a floating point value (function).
4. `to_string`: Converts an integral or floating-point value to string (function).
5. `to_wstring`: Converts an integral or floating-point value to wstring (function).

##### Literals

1. Defined in inline namespace `std::literals::string_literals`.

- `operator""s` (C++14): Converts a character array literal to basic_string (function).

##### Helper Classes

1. `std::hash< std::basic_string >`: Hash support for strings (class template specialization).

#### String Types in STL

1. `std::string`, `std::wstring`, `std::u32string` and others represent **different string types**
   in C++.
2. While they all store character sequences, there are notable **differences** in **character
   encoding**, **size of characters**, and **intended use**.

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

#### Explanation

1. `std::string_view` is a lightweight, **non-owning reference** to a sequence of characters in C++.
2. It provides a way to **efficiently** work with strings **without copying** them, making it
   particularly **useful for accessing substrings** or **interfacing with C-style strings**.
3. Since it does **not manage the memory** it points to, **users must ensure** that **the referenced
   data remains valid** for the duration of the `string_view`.
4. **This class** allows for **read-only access** to character sequences, **improving performance**
   in scenarios where **string immutability** is required.

#### Syntax

```CPP
// Direct initialization.
std::string_view var_name = "a string";
```

```CPP
// Constructor initialization.
std::string_view var_name( "a string" );
```

```CPP
// Initializer list constructor.
std::string_view var_name{ "a string" };
```

#### Member Functions

##### Links

1. [`std::string_view` in cplusplus]().
2. [`std::string_view` in cppreference](https://en.cppreference.com/w/cpp/string/basic_string_view).

##### Template Parameters

1. `CharT`: Character type.
2. `Traits`: CharTraits class specifying the operations on the character type. Like for
   `std::basic_string`, `Traits::char_type` must name the same type as `CharT` or the program is
   ill-formed.

##### Member Types

1. `traits_type: `Traits`.
2. `value_type`: CharT`.
3. `pointer`: `CharT*`.
4. `const_pointer`: `const CharT*`.
5. `reference`: `CharT&`.
6. `const_reference`: `const CharT&`.
7. `const_iterator`: Implementation-defined constant `LegacyRandomAccessIterator`, and
   `LegacyContiguousIterator` (until C++20), `ConstexprIterator`, and `contiguous_iterator` (since
   C++20) whose `value_type` is `CharT`.
8. `iterator`: `const_iterator`.
9. `const_reverse_iterator`: `std::reverse_iterator< const_iterator >`.
10. `reverse_iterator`: `const_reverse_iterator`.
11. `size_type`: `std::size_t`.
12. `difference_type`: `std::ptrdiff_t`.
13. Notes:

- `iterator` and `const_iterator` are the same type because string views are views into constant
  character sequences.
- All requirements on the `iterator` types of a Container applies to the `iterator` and
  `const_iterator` types of `basic_string_view` as well.

##### Member Functions

1. (constructor): Constructs a `basic_string_view` (public member function).
2. `operator=`: Assigns a view (public member function).
3. `begin`, `cbegin`: Returns an iterator to the beginning (public member function).
4. `end`, `cend`: Returns an iterator to the end (public member function).
5. `rbegin`, `crbegin`: Returns a reverse iterator to the beginning (public member function).
6. `rend`, `crend`: Returns a reverse iterator to the end (public member function).
7. `operator[]`: Accesses the specified character (public member function).
8. `at`: Accesses the specified character with bounds checking (public member function).
9. `front`: Accesses the first character (public member function).
10. `back`: Accesses the last character (public member function).
11. `data`: Returns a pointer to the first character of a view (public member function).
12. `size`, `length`: Returns the number of characters (public member function).
13. `max_size`: Returns the maximum number of characters (public member function).
14. `empty`: Checks whether the view is empty (public member function).
15. `remove_prefix`: Shrinks the view by moving its start forward (public member function).
16. `remove_suffix`: Shrinks the view by moving its end backward (public member function).
17. `swap`: Swaps the contents (public member function).
18. `copy`: Copies characters (public member function).
19. `substr`: Returns a substring (public member function).
20. `compare`: Compares two views (public member function).
21. `starts_with` (C++20): Checks if the string view starts with the given prefix (public member
    function).
22. `ends_with` (C++20): Checks if the string view ends with the given suffix (public member
    function).
23. `contains` (C++23): Checks if the string view contains the given substring or character (public
    member function).
24. `find`: Find characters in the view (public member function).
25. `rfind`: Find the last occurrence of a substring (public member function).
26. `find_first_of`: Find first occurrence of characters (public member function).
27. `find_last_of`: Find last occurrence of characters (public member function).
28. `find_first_not_of`: Find first absence of characters (public member function).
29. `find_last_not_of`: Find last absence of characters (public member function).

##### Constants

1. `npos` [`static`]: Special value. The exact meaning depends on the context (public static member
   constant).

##### Non-member Functions

1. `operator==` (C++17), `operator!=/</>/<=/>=` (removed in C++20), `operator<=>` (C++20):
   Lexicographically compares two string views (function template).
2. `operator<<` (C++17): Performs stream output on string views (function template).

##### Literals

1. Defined in inline namespace `std::literals::string_view_literals`.
   - `operator""sv` (C++17): Creates a string view of a character array literal (function).

##### Helper Classes

1. `std::hash< std::string_view >` (C++17), `std::hash< std::wstring_view >` (C++17),
   `std::hash< std::u8string_view >` (C++20), `std::hash< std::u16string_view >` (C++17),
   `std::hash< std::u32string_view >` (C++17): Hash support for string views (class template
   specialization).

##### Helper Templates

1. `template< class CharT, class Traits > inline constexpr bool ranges::enable_borrowed_range< std::basic_string_view< CharT, Traits > > = true;`
   (since C++20): This specialization of ranges::enable_borrowed_range makes basic_string_view
   satisfy borrowed_range.
2. `template< class CharT, class Traits > inline constexpr bool ranges::enable_view< std::basic_string_view < CharT, Traits > > = true;`
   (since C++20): This specialization of `ranges::enable_view` makes `basic_string_view` satisfy
   view.

### `std::literals` Namespace

1. [`std::literals` in cplusplus]().
2. [`std::literals` in cppreference](https://en.cppreference.com/w/cpp/symbol_index/literals).

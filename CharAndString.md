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
     <!--    2) std::string type: It is implemented by a const char-type pointer, but has some difference. -->
     <!--    string, wstring, u32string, ... There is a little difference between them when assigning values -->
     <!--    to them. -->
     <!--    std::string string_name = "" + ""; // not allowed -->
     <!--    std::string string_name = std::string("") + ""; // allowed -->
     <!--    std::string string_name = ""; string_name += ""; // allowed -->
     <!--    += has been overloaded in std::string type. -->
     <!--    7) std::string_literals namespace: Very useful; -->
     <!--    8) performance: the std::string type is safer than the const char* pointer type, but slower than the latter. -->
     <!-- (57) how to make string faster in C++: C++17 -->
     <!--   1) use std::string_view to get a substring of a std::string, instead of std::string::substr(). -->
     <!--   2) use const char* to store a string, instead of std::string. std::string requires one memory allocation, while const char* does not. -->
     <!--   3) When passing a const char* to a function whose argument is a const std::string reference, one memory allocation occurs. However, if we change the argument of the function from a const std::string reference to a std::string_view, no memory allocation occurs. Every time, a const char* or a const char array is converted into a std::string implicitly, although the argument of the function is a std::string reference, a memory allocation occurs. -->
     <!-- (60) small string optimization: C++ standard library stores a string with a small size depending on how to implement the standard library, usually which is smaller than 16 characters, on stack. Otherwise, it stores a string on heap. Therefore, if the string is small enough, we define it as a std::string type instad of const char* type. However, if we compile our code in debug mode, even the string is small enough, it still causes a head allocation. -->

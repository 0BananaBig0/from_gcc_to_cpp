<!-- vim-markdown-toc GFM -->

- [`<iostream>`](#iostream)
  - [Explanation](#explanation)
  - [`std::cin` and `std::wcin`](#stdcin-and-stdwcin)
  - [`std::cin`](#stdcin)
  - [`std::wcin`](#stdwcin)
    - [Syntax](#syntax)
    - [Links](#links)
    - [Notes](#notes)
  - [`std::cout` and `std::wcout`](#stdcout-and-stdwcout)
    - [`std::cout`](#stdcout)
    - [`std::wcout`](#stdwcout)
    - [Syntax](#syntax-1)
    - [Links](#links-1)
    - [Notes](#notes-1)
  - [`std::cerr` and `std::wcerr`](#stdcerr-and-stdwcerr)
    - [`std::cerr`](#stdcerr)
    - [`std::wcerr`](#stdwcerr)
    - [Syntax](#syntax-2)
    - [Links](#links-2)
  - [`std::clog` and `std::wclog`](#stdclog-and-stdwclog)
    - [`std::clog`](#stdclog)
    - [`std::wclog`](#stdwclog)
    - [Syntax](#syntax-3)
    - [Links](#links-3)
- [`<ostream>`](#ostream)
  - [`std::endl`, `std::ends` and `std::flush`](#stdendl-stdends-and-stdflush)
    - [`std::endl`](#stdendl)
    - [`std::ends`](#stdends)
    - [`std::flush`](#stdflush)
    - [Syntax](#syntax-4)
- [`<fstream>`](#fstream)
  - [Explanation](#explanation-1)
  - [`std::ifstream`, `std::ofstream` and `std::fstream`](#stdifstream-stdofstream-and-stdfstream)
    - [`std::ifstream`](#stdifstream)
    - [`std::ofstream`](#stdofstream)
    - [`std::fstream`](#stdfstream)
    - [Declaration Syntax](#declaration-syntax)
    - [Initialization Syntax](#initialization-syntax)
    - [Usage Syntax](#usage-syntax)
    - [Members and Related Stuffs](#members-and-related-stuffs)
      - [Links](#links-4)
      - [Member Types](#member-types)
      - [Member Functions](#member-functions)
      - [Member Functions Inherited from `std::basic_istream` (for `std::ifstream` and `std::fstream`)](#member-functions-inherited-from-stdbasic_istream-for-stdifstream-and-stdfstream)
      - [Member Classes Inherited from `std::basic_istream` (for `std::ifstream` and `std::fstream`)](#member-classes-inherited-from-stdbasic_istream-for-stdifstream-and-stdfstream)
      - [Member Functions Inherited from `std::basic_istream` (for `std::ofstream` and `std::fstream`)](#member-functions-inherited-from-stdbasic_istream-for-stdofstream-and-stdfstream)
      - [Member Classes Inherited from `std::basic_istream` (for `std::ofstream` and `std::fstream`)](#member-classes-inherited-from-stdbasic_istream-for-stdofstream-and-stdfstream)
      - [All Stuffs Inherited from `std::std::basic_ios`](#all-stuffs-inherited-from-stdstdbasic_ios)
      - [All Stuffs Inherited from `std::ios_base`](#all-stuffs-inherited-from-stdios_base)
      - [Non-member Functions](#non-member-functions)
- [`std::getline`](#stdgetline)
  - [Explanation](#explanation-2)
  - [Syntax](#syntax-5)
  - [Links](#links-5)
  - [Notes](#notes-2)

<!-- vim-markdown-toc -->

## `<iostream>`

### Explanation

1. The`iostream` library provides functionalities for **handling input and
   output operations** in C++.
2. It includes **both wide and narrow character streams** for interacting with
   data, allowing for flexibility in **handling different encodings**, such as
   single-byte characters (ASCII) and multi-byte characters (UTF-16, UTF-32).

### `std::cin` and `std::wcin`

### `std::cin`

1. `std::cin` is the standard input stream used to read data from the standard
   input (usually the keyboard) for narrow character types (`char`).
2. Typically, it's used for reading user input in the form of various data types
   (e.g., integers, strings).
3. It waits for user input before processing it and may buffer the input to
   optimize performance.

### `std::wcin`

1. `std::wcin` is the wide-character equivalent of `std::cin`, used for reading
   wide characters (`wchar_t`) from standard input. This is useful for reading
   internationalized or Unicode data.
2. It's used to read wide-character data, often necessary for handling non-ASCII
   characters or multi-byte encodings.
3. Similar to `std::cin`, its input is buffered and processed after the user
   types it.

#### Syntax

```CPP
// Declaration syntax.
extern std::istream cin;
extern std::wistream wcin;
```

```CPP
// Usage syntax.
Type var_name;
std::cin >> var_name;           // Narrow character input
WType wvar_name;
std::wcin >> wvar_name;      // Wide character input
```

#### Links

1. [`std::cin` in cplusplus](https://cplusplus.com/reference/iostream/cin/).
2. [`std::wcin` in cplusplus](https://cplusplus.com/reference/iostream/wcin/).
3. [`std::cin` and `std::wcin` in cppreference](https://en.cppreference.com/w/cpp/io/cin).

#### Notes

1. `std::cin >> std::boolalpha;` allows users to enter the strings `"true"` and
   `"false"` as input for a boolean variable. Otherwise, `std::cin` enters a
   failure mode and stores a zero value in the boolean variable.
2. However, when `std::boolalpha` is enabled for input, numeric values will no
   longer be accepted (they evaluate to false and cause `std::cin` to enter
   failure mode).
3. Enabling `std::boolalpha` for input will only allow lower-cased false or true
   to be accepted. Variations with capital letters will not be accepted. 0 and 1
   will also no longer be accepted.
4. `std::cin >> char_var;` cannot store a space character into `char_var`, but
   `std::cin.get(char_var)` can.
5. `std::cint >> std::ws;` discards leading whitespace from an input stream.

### `std::cout` and `std::wcout`

#### `std::cout`

1. `std::cout` is the standard output stream used for writing data to the
   console, typically using narrow characters (`char`).
2. It's used to display output to the user, such as text, numbers, or formatted
   data.
3. Data written to `std::cout` is stored in memory and written to the console
   when the buffer is full or flushed.

#### `std::wcout`

1. `std::wcout` is the wide-character output stream for writing wide characters
   (`wchar_t`) to the console.
2. It's used for outputting wide-character data, necessary when working with
   non-ASCII or multi-byte character sets, such as internationalized text.
3. Like `std::cout`, data is buffered before being output to the console.

#### Syntax

```CPP
// Declaration syntax.
extern std::ostream cout;
extern std::wostream wcout;
```

```CPP
// Usage syntax.
std::cout << "Message";         // Narrow character output
std::wcout << L"Message";       // Wide character output
```

#### Links

1. [`std::cout` in cplusplus](https://cplusplus.com/reference/iostream/cout/).
2. [`std::wcout` in cplusplus](https://cplusplus.com/reference/iostream/wcout/).
3. [`std::cout` and `std::wcout` in cppreference](https://en.cppreference.com/w/cpp/io/cout).

#### Notes

1. To disable the buffering of `std::cout` for debugging purposes, add the
   following code before the `main` function:
   ```CPP
   std::cout << std::unitbuf; // enable automatic flushing for std::cout (for debugging)
   ```
2. When outputting floating point numbers, `std::cout` has a default precision
   of 6 -- that is, it assumes all floating point variables are only significant
   to 6 digits (the minimum precision of a `float`), and hence it will truncate
   anything after that.
3. We can override the default precision that `std::cout` shows by using an
   output manipulator function named `std::setprecision()`. Output manipulators
   alter how data is output, and are defined in the `iomanip` header.

### `std::cerr` and `std::wcerr`

#### `std::cerr`

1. `std::cerr` is used for outputting error messages to the standard error
   stream (`stderr`), typically **without buffering**.
2. It's commonly used for reporting errors, warnings, or diagnostics.
3. It ensures that error messages are immediately displayed, regardless of
   buffering.

#### `std::wcerr`

1. `std::wcerr` is the wide-character version of `std::cerr`, used for
   outputting error messages in wide-character format (`wchar_t`).
2. It's used when you need to output wide-character error messages.
3. Just like `std::cerr`, it outputs error messages immediately.

#### Syntax

```CPP
extern std::ostream cerr;
extern std::wostream wcerr;
```

```CPP
// Usage syntax.
std::cerr << "Error occurred";    // Narrow character error output
std::wcerr << L"Error occurred";  // Wide character error output
```

#### Links

1. [`std::cerr` in cplusplus](https://cplusplus.com/reference/iostream/cerr/).
2. [`std::wcerr` in cplusplus](https://cplusplus.com/reference/iostream/wcerr/).
3. [`std::cerr` and `std::wcerr` in cppreference](https://en.cppreference.com/w/cpp/io/cerr).

### `std::clog` and `std::wclog`

#### `std::clog`

1. `std::clog` is used for logging information to the standard error stream
   (`stderr`), typically buffered.
2. It's commonly used for logging messages, warnings, or diagnostic data.
3. It stores the log messages in memory before outputting them.

#### `std::wclog`

1. `std::wclog` is the wide-character version of `std::clog`, used for logging
   wide-character data.
2. It's used when the log messages contain wide-character data.
3. Like `std::clog`, it buffers log messages before outputting them.

#### Syntax

```CPP
// Declaration syntax.
extern std::ostream clog;
extern std::wostream wclog;
```

```CPP
// Usage syntax.
std::clog << "Log message";       // Narrow character log output
std::wclog << L"Log message";     // Wide character log output
```

#### Links

1. [`std::clog` in cplusplus](https://cplusplus.com/reference/iostream/clog/).
2. [`std::wclog` in cplusplus](https://cplusplus.com/reference/iostream/wclog/).
3. [`std::clog` and `std::wclog` in cppreference](https://en.cppreference.com/w/cpp/io/clog).

## `<ostream>`

### `std::endl`, `std::ends` and `std::flush`

#### `std::endl`

1. `std::endl` inserts a newline character (`\n`) into the output stream and
   flushes the stream, ensuring immediate output.
2. It often used when you need to print a newline and flush the output
   immediately (e.g., after displaying a message).
3. It causes a flush of the output stream, in addition to inserting a newline
   character.
4. `std::endl` is slightly slower than `\n` due to additional flushing.

#### `std::ends`

1. `std::ends` inserts a null character (`'\0'`) into the output stream.
2. It is commonly used when working with C-style strings, where a null
   terminator is needed to mark the end of the string.
3. It's useful when building strings that need to be null-terminated,
   particularly for compatibility with C-style string functions or libraries
   that expect a null terminator.
4. It can be used in conjunction with `std::ostringstream` or other streams when
   constructing such strings.
5. It does not force a flush of the output buffer.
6. It simply appends the null character to the stream's content without
   affecting the buffer state.

#### `std::flush`

1. `std::flush` forces the output stream to flush, ensuring any buffered data is
   immediately written out, without inserting a newline.
2. It's used when you want to ensure that all output is immediately written, but
   without adding a newline.
3. It forces a flush of the output stream, but does not insert any characters
   into the stream.

#### Syntax

```CPP
IOObject << "Message" << std::endl;  // Newline and flush
IOObject << "Message" << std::flush; // Flush without newline
```

```CPP
std::ostringstream oss;
oss << "Hello, World" << std::ends;   // Adds a null character after the text
std::cout << oss.str().c_str();       // Displays the content as a C-style string
```

## `<fstream>`

### Explanation

1. The `<fstream>` header in C++ provides classes to perform file-based input
   and output operations.
2. It defines `std::ifstream`, `std::ofstream`, and `std::fstream`, each suited
   to specific file handling tasks.
3. These classes support text and binary I/O and are built on top of the basic
   iostream functionality.

### `std::ifstream`, `std::ofstream` and `std::fstream`

#### `std::ifstream`

1. `std::ifstream` is a file input stream class used to read data from files.
2. It provides input operations similar to `std::cin` but specifically for file
   reading.
3. It's primarily used to open a file in read mode. Once opened, the file data
   can be read line by line or as individual characters.
4. It uses a buffer to read chunks of data, allowing efficient input operations
   by reducing file access time.
5. It is a non-copyable class.
6. `std::wifstream` is the wide-character equivalent of `std::ifstream`, used to
   read data from files.

#### `std::ofstream`

1. `std::ofstream` is a file output stream class used to write data to files.
2. It behaves similarly to `std::cout` but writes output to a file instead of
   the console.
3. It's commonly used to open a file in write mode.
4. Text and data can be written to the file, either as individual characters or
   lines.
5. It buffers output data for efficient file writing by reducing the number of
   write operations.
6. It is a non-copyable class.
7. `std::wofstream` is the wide-character equivalent of `std::ofstream`, used to
   write data to files.

#### `std::fstream`

1. `std::fstream` is a file stream class that supports both input and output
   operations.
2. It allows reading from and writing to the same file.
3. Typically, it's used when a file requires both reading and writing.
4. It can be opened in various modes (read-only, write-only, or both).
5. It uses a buffer to handle I/O operations efficiently, reducing direct file
   access calls.
6. It is a non-copyable class.
7. `std::wfstream` is the wide-character equivalent of `std::fstream`, providing
   both input and output operations.

#### Declaration Syntax

```CPP
std::ifstream file;
```

```CPP
std::ofstream file;
```

```CPP
std::fstream file;
```

#### Initialization Syntax

```CPP
std::ifstream file( "filename.txt" );   // Opens in read mode
```

```CPP
std::ifstream file1( "filename.txt" );   // Opens in read mode
// Move constructor.
std::ifstream file2( std::move( file1 ) );   // Opens in read mode
```

```CPP
std::ofstream file( "filename.txt" );   // Opens in write mode
```

```CPP
std::ofstream file1( "filename.txt" );   // Opens in write mode
// Move construcotr.
std::ofstream file2( std::move( file1 ) );   // Opens in write mode
```

```CPP
std::fstream file( "filename.txt",
                   std::ios::in | std::ios::out );   // Opens in read-write mode
```

```CPP
std::fstream file1( "filename.txt",
                   std::ios::in | std::ios::out );   // Opens in read-write mode
// Move constructor.
std::fstream file2( std::move( file1 ) );   // Opens in read-write mode
```

#### Usage Syntax

```CPP
std::ifstream file( "filename.txt" );
if( file.is_open() ) {
   std::string line;
   while( std::getline( file, line ) ) {
      std::cout << line << std::endl;
   };
   file.close();
};
```

```CPP
std::ofstream file( "filename.txt" );
if( file.is_open() ) {
   file << "Hello, World!" << std::endl;
   file.close();
};
```

```CPP
std::fstream file( "filename.txt", std::ios::in | std::ios::out );
if( file.is_open() ) {
   // Reading
   std::string line;
   while( std::getline( file, line ) ) {
      std::cout << line << std::endl;
   };

   // Writing
   file.clear();                     // Clear flags before writing after reading
   file.seekp( 0, std::ios::end );   // Move write pointer to end
   file << "Appending text" << std::endl;
   file.close();
};
```

#### Members and Related Stuffs

##### Links

1. [`std::ifstream` in cplusplus](https://cplusplus.com/reference/fstream/ifstream/).
2. [`std::wifstream` in cplusplus](https://cplusplus.com/reference/fstream/wifstream/).
3. [`std::ifstream` and `std::wifstream` in cppreference](https://en.cppreference.com/w/cpp/io/basic_ifstream).
4. [`std::ofstream` in cplusplus](https://cplusplus.com/reference/fstream/ofstream/).
5. [`std::wofstream` in cplusplus](https://cplusplus.com/reference/fstream/wofstream/).
6. [`std::ofstream` and `std::wofstream` in cppreference](https://en.cppreference.com/w/cpp/io/basic_ofstream).
7. [`std::fstream` in cplusplus](https://cplusplus.com/reference/fstream/fstream/).
8. [`std::wfstream` in cplusplus](https://cplusplus.com/reference/fstream/wfstream/).
9. [`std::fstream` and `std::wfstream` in cppreference](https://en.cppreference.com/w/cpp/io/basic_fstream).

##### Member Types

1. `char_type`: `CharT`
2. `traits_type`: `Traits`; the program is ill-formed if `Traits::char_type` is
   not `CharT`.
3. `int_type`: `Traits::int_type`.
4. `pos_type`: `Traits::pos_type`.
5. `off_type`: `Traits::off_type`.
6. `native_handle_type` (C++26): Implementation-defined type that is
   `TriviallyCopyable` and `semiregular`.

##### Member Functions

1. (constructor): Constructs the file stream (public member function).
2. (destructor) [`virtual`] (implicitly declared): Destructs the
   ifstream/ofstream/fstream and the associated buffer, closes the file (virtual
   public member function).
3. `operator=`: Moves the file stream (public member function).
4. `swap`: Swaps two file streams (public member function).
5. `rdbuf`: Returns the underlying raw file device object (public member
   function).
6. `native_handle` (C++26): Returns the underlying implementation-defined handle
   (public member function).
7. `is_open`: Checks if the stream has an associated file (public member
   function).
8. `open`: Opens a file and associates it with the stream (public member
   function).
9. `close`: Closes the associated file (public member function).

##### Member Functions Inherited from `std::basic_istream` (for `std::ifstream` and `std::fstream`)

1. `operator>>`: Extracts formatted data (public member function of
   `std::basic_istream< CharT, Traits >`).
2. `get`: Extracts characters (public member function of
   `std::basic_istream< CharT, Traits >`).
3. `peek`: Reads the next character without extracting it (public member
   function of `std::basic_istream< CharT, Traits >`).
4. `unget`: Unextracts a character (public member function of
   `std::basic_istream< CharT, Traits >`).
5. `putback`: Puts a character into the input stream (public member function of
   `std::basic_istream< CharT, Traits >`).
6. `getline`: Extracts characters until the given character is found (public
   member function of `std::basic_istream< CharT, Traits >`).
7. `ignore`: Extracts and discards characters until the given character is found
   (public member function of `std::basic_istream< CharT, Traits >`).
8. `read`: Extracts blocks of characters (public member function of
   `std::basic_istream< CharT, Traits >`).
9. `readsome`: Extracts already available blocks of characters (public member
   function of `std::basic_istream< CharT, Traits >`).
10. `gcount`: Returns the number of characters extracted by the last unformatted
    input operation (public member function of
    `std::basic_istream< CharT, Traits >`).
11. `tellg`: Returns the input position indicator (public member function of
    `std::basic_istream< CharT, Traits >`).
12. `seekg`: Sets the input position indicator (public member function of
    `std::basic_istream< CharT, Traits >`).
13. `sync`: Synchronizes with the underlying storage device (public member
    function of `std::basic_istream< CharT, Traits >`).

##### Member Classes Inherited from `std::basic_istream` (for `std::ifstream` and `std::fstream`)

1. `sentry`: Implements basic logic for preparation of the stream for input
   operations (public member class of `std::basic_istream< CharT,Traits >`).

##### Member Functions Inherited from `std::basic_istream` (for `std::ofstream` and `std::fstream`)

1. `operator<<`: Inserts formatted data (public member function of
   `std::basic_ostream< CharT, Traits >`).
2. `put`: Inserts a character (public member function of
   `std::basic_ostream< CharT, Traits >`).
3. `write`: Inserts blocks of characters (public member function of
   `std::basic_ostream< CharT, Traits >`).
4. `tellp`: Returns the output position indicator (public member function of
   `std::basic_ostream< CharT, Traits >`).
5. `seekp`: Sets the output position indicator (public member function of
   `std::basic_ostream< CharT, Traits >`).
6. `flush`: Synchronizes with the underlying storage device (public member
   function of `std::basic_ostream< CharT, Traits >`).

##### Member Classes Inherited from `std::basic_istream` (for `std::ofstream` and `std::fstream`)

1. `sentry`: Implements basic logic for preparation of the stream for output
   operations (public member class of `std::basic_ostream< CharT,Traits >`).

##### All Stuffs Inherited from `std::std::basic_ios`

1. [`std::fstream` in cplusplus](https://cplusplus.com/reference/fstream/fstream/).
2. [`std::wfstream` in cplusplus](https://cplusplus.com/reference/fstream/wfstream/).
3. [`std::fstream` and `std::wfstream` in cppreference](https://en.cppreference.com/w/cpp/io/basic_fstream).

##### All Stuffs Inherited from `std::ios_base`

1. [`std::fstream` in cplusplus](https://cplusplus.com/reference/fstream/fstream/).
2. [`std::wfstream` in cplusplus](https://cplusplus.com/reference/fstream/wfstream/).
3. [`std::fstream` and `std::wfstream` in cppreference](https://en.cppreference.com/w/cpp/io/basic_fstream).

##### Non-member Functions

1. `std::swap( std::ifstream )`: specializes the `std::swap` algorithm (function
   template).

## `std::getline`

### Explanation

1. `std::getline` is a function that reads characters from an input stream and
   places them into a string.
2. It's defined in `<string>`.

### Syntax

```CPP
// Definitions.
template< class CharT, class Traits, class Allocator >
std::basic_istream< CharT, Traits >& getline(
   std::basic_istream< CharT, Traits >& input,
   std::basic_string< CharT, Traits, Allocator >& str,
   CharT delim );   // ( 1 )

template< class CharT, class Traits, class Allocator >
std::basic_istream< CharT, Traits >& getline(
   std::basic_istream< CharT, Traits >&& input,
   std::basic_string< CharT, Traits, Allocator >& str,
   CharT delim );   // ( 2 )( since C++ 11 )

template< class CharT, class Traits, class Allocator >
std::basic_istream< CharT, Traits >& getline(
   std::basic_istream< CharT, Traits >& input,
   std::basic_string< CharT, Traits, Allocator >& str );   // ( 3 )

template< class CharT, class Traits, class Allocator >
std::basic_istream< CharT, Traits >& getline(
   std::basic_istream< CharT, Traits >&& input,
   std::basic_string< CharT, Traits, Allocator >& str );   // ( 4 )
```

```CPP
// Used to get the whole line from `std::cin`.
std::getline( std::cin >> std::ws, var_name );
```

```CPP
// A special case.
#include <iostream>
#include <string>

int main() {
   std::cout << "Pick 1 or 2: ";
   int choice{};
   std::cin >> choice;

   std::cout << "Now enter your name: ";
   std::string name{};
   std::getline( std::cin >> std::ws, name );   // note: added std::ws here.
   // std::getline( std::cin, name );   // note: no std::ws here, not get what you want.

   std::cout << "Hello, " << name << ", you picked " << choice << '\n';

   return 0;
}
```

### Links

1. [`std::line` in cplusplus](https://cplusplus.com/reference/string/string/getline/).
2. [`std::line` in cppreference](https://en.cppreference.com/w/cpp/string/basic_string/getline).

### Notes

1. If using `std::getline()` to read strings, use `std::cin >> std::ws` input
   manipulator to ignore leading whitespace. This needs to be done for each
   `std::getline()` call, as `std::ws` is not preserved across calls.
2. When extracting to a variable, the extraction operator (`>>`) ignores leading
   whitespace. It stops extracting when encountering non-leading whitespace.
   `std::getline()` does not ignore leading whitespace. If you want it to ignore
   leading whitespace, pass `std::cin >> std::ws` as the first argument. It
   stops extracting when encountering a newline.

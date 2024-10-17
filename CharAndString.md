(13) string: There is a termination character called null(zero value) at the end of a string-type
   variable by default, which indicates where the end of the string is. A string is stored in the
   read-only section of memory.
   1) char type: char, wchar_t, char16_t, ... There is a little difference between them when
   assigning values to them.
   2) std::string type: It is implemented by a const char-type pointer, but has some difference.
   string, wstring, u32string, ... There is a little difference between them when assigning values
   to them.
   3) '': Char, char type.
   4) "": String, const char array type. We should use a const char pointer to store it.
   std::string string_name = "" + ""; // not allowed
   std::string string_name = std::string("") + ""; // allowed
   std::string string_name = ""; string_name += ""; // allowed
   += has been overloaded in std::string type.
   5) char array type: A char array requires us to write '\0' or 0 at the end if we use '' or memcpy to assign or copy values to it.
   Without '\0' or 0 at the end, its values are unknown. Also, we can use "" to assign values to a char array, like char array_name[] = "";.
   The data of the char-array-type variable is also stored in the read-only section of memory, but we can modify it.
   6) char pointer type: A string is stored in the read-only section of memory, so char* string_name = ""; is not allowed which is a
   undefined operation. However, char* charPointerName; is allowed and defined. A char pointer also requires us to write '\0' or 0 at
   the end if we use '' or memcpy to assign or copy values to it. Without '\0' or 0 at the end, its values are unknown.
   7) std::string_literals namespace: Very useful;
   8) performance: the std::string type is safer than the const char* pointer type, but slower than the latter.
(57) how to make string faster in C++: C++17
  1) use std::string_view to get a substring of a std::string, instead of std::string::substr().
  2) use const char* to store a string, instead of std::string. std::string requires one memory allocation, while const char* does not.
  3) When passing a const char* to a function whose argument is a const std::string reference, one memory allocation occurs. However, if we change the argument of the function from a const std::string reference to a std::string_view, no memory allocation occurs. Every time, a const char* or a const char array is converted into a std::string implicitly, although the argument of the function is a std::string reference, a memory allocation occurs.
(60) small string optimization: C++ standard library stores a string with a small size depending on how to implement the standard library, usually which is smaller than 16 characters, on stack. Otherwise, it stores a string on heap. Therefore, if the string is small enough, we define it as a std::string type instad of const char* type. However, if we compile our code in debug mode, even the string is small enough, it still causes a head allocation.

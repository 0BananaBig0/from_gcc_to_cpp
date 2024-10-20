(43) type punning: It is a programming technique used to treat a data type as if it were a different
data type, usually without explicit type conversion. This often involves using pointers, unions, or
other low-level mechanisms to reinterpret the bits of a value as a different type. It is often
recommended to avoid type punning unless absolutely necessary, and to use safer alternatives like:
standard conversions, std::bit_cast and serialization. It can achieve specific goals like low-level
optimization, treating a struct/class as an array, treating Type1 memory as Type2 memory at the same
memory address or interfacing with hardware. However, developers must be aware of the risks, including
undefined behavior and portability issues, and use safer alternatives whenever possible.
(44) union: All members in a union share the same memory. Usually, we use an anonymous union. We can
use it to convert a variable to different types of variables.
   1) Type punning:
   struct Vector2 {
      float x,y;
   };
   struct Vector4 {
      union {
         struct {
            float x, y, z, w;
         };
         struct {
            Vector2 a, b;
         };
      };
   };
   2) Use different member names in different situations.
   struct Vector3 {
      union {
         struct {
            float x, y, z;
         };
         struct {
            float r, g, b;
         };
      };
   };
(54) std::any: It is a new feature introduced in C++17 that allows us store any data in one variable.
std::variant is type safer than std::any. When used to store small-sized variables, typically up to
32 bytes depending on its implementation, it functions similarly to std::variant. However, if larger
sizes are required, dynamic allocations are necessary, which can impact performance. This feature is
not useful, and few programmers use it.
  std::any var_name;
  var_name = Type1_val;
  var_name = Type2_val;


```CPP
  auto& val1_name = std::any_cast<Type1&>(var_name); // better than the next statement, will be optimized.
  // auto& val1_name = std::any_cast<Type1&>(var_name);
  auto& val2_name = std::any_cast<Type2&>(var_name);
```
(53) multiple types of data in single variable: It is a new feature introduced in C++ that allows us
to list various types for a variable, as well as assign and reassign it to different types of values.
It functions similarly to a class or a structure, rather than a union. While a union is more efficient,
it is type safer. In some cases, using std::variant helps us obtain more information rather than just
optional data, such as when reading a file.
  std::variant<Type1, Type2, Type3, ... > var_name; // var_name.index();
  var_name = Type1_value;
  if( auto value = std::get_if<Type1>(data) ) {
    std::cout << *value << std::endl; ...
    // or std::cout << std::get<Type1>(var_name) << std::endl;
    ...
  };
  var_name = Type2_value;
  if( auto value = std::get_if<Type2>(data) ) {
    std::cout << *value << std::endl; ...
    // or std::cout << std::get<Type2>(var_name) << std::endl;
    ...
  };
  ...

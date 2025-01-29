<!-- vim-markdown-toc GFM -->

- [`std::bind`](#stdbind)
  - [Explanation](#explanation)
  - [Syntax](#syntax)
  - [Usage](#usage)
  - [Links](#links)
- [`std::function`](#stdfunction)
  - [Explanation](#explanation-1)
  - [Syntax](#syntax-1)
  - [Usage](#usage-1)
  - [Links](#links-1)

<!-- vim-markdown-toc -->

## `std::bind`

### Explanation

1. `std::bind` is **a function adapter** in C++ that allows you to **create a
   callable object by binding one or more arguments to a function or function
   object**.
2. It is part of the `<functional>` header and provides a way to create a new
   function that can be invoked with a specific set of arguments, while leaving
   some arguments unbound.
3. `std::bind` is useful when you need to adapt a function to match a specific
   signature for algorithms or event-driven programming.
4. It can also be used to create a function that calls another function with a
   fixed set of arguments, reducing the need to repeatedly pass those arguments.

### Syntax

```CPP
// (1) (since C++11) (constexpr since C++20).
template< class F, class... Args >
/* unspecified */ bind( F&& f, Args&&... args );
// (2) (since C++11) (constexpr since C++20).
template< class R, class F, class... Args >
/* unspecified */ bind( F&& f, Args&&... args );
```

### Usage

1. Partial function application:
   ```CPP
   RetType funName( Type1 para1, Type2 para2, ... ) { ...; };
   Type2 arg2;
   auto boundName = std::bind( funName, arg2, std::placeholders::_1, ... );
   ```
2. Working with callbacks or functional interfaces:
   ```CPP
   RetType funName( Type1 para1, Type2 para2, ... ) { ...; };
   auto boundName = std::bind( funName, arg1, arg2, ... );
   std::thread thread_name( boundName );
   ```
3. Binding member functions:
   ```CPP
   class ClassName {
      public:
         RetType funcName( Type1 para1, ... ) const { ...; };
   };
   int main() {
      ClassName obj_name;
      auto boundName = std::bind( &ClassName::funcName, obj_name, arg1, ... );
      boundName();
      return 0;
   };
   ```
4. Reordering arguments:
   ```CPP
   RetType funcName( Type1 para1, Type2 para2, ... ) { ...; };
   int main() {
      auto boundName = std::bind(
         funcName, std::placeholders::_2, std::placeholders::_1, ... );
      boundName( arg2, arg1 );
   };
   ```
5. Avoiding verbose lambda expressions.
6. Compatibility with legacy code: `std::bind1st/std::bind2nd` (from C++98).

### Links

1. [`std::bind` in cplusplus](https://cplusplus.com/reference/functional/bind/).
2. [`std::bind` in cppreference](https://en.cppreference.com/w/cpp/utility/functional/bind).

## `std::function`

### Explanation

1. `std::function` is **a template class** in C++ that provides **a type-safe
   wrapper** for any callable entity, including functions, function pointers,
   and function objects.
2. It is part of the <functional> header and allows you to store and invoke
   callable objects with a specific signature.
3. `std::function` is useful for scenarios where you need to store or pass
   around functions as first-class objects, such as callback functions, event
   handlers, or when working with algorithms that require generic function
   signatures.
4. For high-performance code where overhead is a concern, function pointers or
   direct calls may be more suitable.

### Syntax

```CPP
// (1) (since C++11).
template< class > class function; /* undefined */
// (2) (since C++11).
template< class R, class... Args > class function< R( Args... ) >;
```

### Usage

1. Type-erased function wrapper:
   ```CPP
   RetType funcName( Type1 para1, Type2 para2, ... ) { ...; };
   int main() {
      std::function< RetType( Type1, Type2, ... ) > func = funcName;
      func();   // Calls funcName().
   };
   ```
2. Storing different types of callables:
   ```CPP
   RetType funcName1() { ...; };
   struct FuncName2 {
         RetType operator()( ... ) const { ...; };
   };
   int main() {
      std::function< RetType( ... ) > f1 = funcName1;          // Function pointer.
      std::function< RetType( ... ) > f2 = FuncName2( ... );   // Functor.
      std::function< RetType( ... ) > f3 = [...]( ... ) {      // Lambda.
         ...;
      };
      f1();   // Calls funcName1.
      f2();   // Calls FuncName2().
      f3();   // Calls the lambda.
      return 0;
   };
   ```
3. Use in callbacks and event handlers.
4. Memory and performance considerations: Dynamic memory allocation.
5. Function composition and higher-order functions.
6. Use in containers.
7. Flexible function signatures.
8. Passing functions as arguments.
9. Using `std::function` with member functions:
   ```CPP
   class ClassName {
      public:
         RetType funcName( Type1 para1, Type2 para2, ... ) const { ...; };
   };
   int main() {
      ClassName obj_name;
      std::function< RetType( const ClassName&, Type1, Type2, ... ) > obj_nameFunc
         = &ClassName::funcName;
      obj_nameFunc( obj_name, arg1, arg2, ... );
   };
   ```

### Links

1. [`std::function` in cplusplus](https://cplusplus.com/reference/functional/function/).
2. [`std::function` in cppreference](https://en.cppreference.com/w/cpp/utility/functional/function).

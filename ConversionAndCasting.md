(19) implicit conversion: It is only allowed to happen once; It happens automatically; The compiler
   ensures that the conversion is valid and safe. However, implicit conversions can sometimes lead
   to unexpected behavior, especially if there’s data loss (e.g., converting a double to an int might
   lose the fractional part). When we copy an object to another object with the assignment operator
   after the object has been defined and the implicit conversion happens, the assignment operator
   overload and possibly the constructor will be invoked.
(20) explicit conversion/type casting: The explicit can disable implicit conversion. Programmers
   manually specify the type to which they want to convert a value. There’s no guarantee that the
   conversion is safe, and the programmer must ensure the correctness.
(46) casting: Learning it through practice rather than theory.
   1) C-style casting: Recommend. C-style casting can vary based on the specific context. The compiler
   may not optimize C-style casts as effectively since they lack explicit intent, making it harder for
   the compiler to understand what type conversions are valid.
   Type1 name1 = (Type2) name2/value1;
   Type1 name1 = value1; Type2 name2 = (Type2) name1/value2;
   2) C++-style casting: We recommend using C++-style casting if you are starting a new project from
   scratch, if your project is small, or if you are a C++ beginner, as it is a safer option. When
   using these casts, it’s important to be aware of whether they involve runtime checks or compile-time
   checks. The distinct names of these casts make it convenient to search for them in our code.
   Furthermore, all functions provided by C++-style casting can be implemented using C-style casting.
      1, static_cast: Used for well-defined conversions between related types without runtime checks.
      It is safer than C-style casting but still requires caution, especially during downcasting. This
      cast involves compile-time checks and is generally efficient, as it can be optimized by the compiler.
      2, dynamic_cast: Designed for safe, runtime-checked downcasting in polymorphic hierarchies. It
      ensures that the cast is valid at runtime, making it the safest option for casting within class
      hierarchies. However, this added safety can result in slower performance compared to static_cast.
      The runtime check in dynamic_cast is implemented using the Run-Time Type Information (RTTI)
      mechanism in C++, which includes type information and the virtual table (vtable). Its downcasting
      workflow involves RTTI lookup, hierarchy traversal, and pointer adjustment.
      Because it slows down performance, we can use a macro to determine whether to use it in debug mode
      or release mode. Also, we should check if RTTI is enabled in our compiler.
      class BaseClass {
            // dynamic_cast requires at least one virtual function.
            virtual void printName(){};
      };
      class SubClass1: public BaseClass {};
      class SubClass2: public BaseClass {};
      int main() {
         BaseClass* base_ptr1 = new SubClass1();
         BaseClass* base_ptr2 = new SubClass2();
         SubClass1* sub1_ptr = dynamic_cast< SubClass1* >( base_ptr1 );
         if( !sub1_ptr ) {
            std::cout << "" << std::endl;
            return 0;
         };
         // The following cast is not recommended, slow; it will be checked at runtime to prevent potential crashes.
         SubClass2* sub2_ptr = dynamic_cast< SubClass2* >( base_ptr1 );
         if( !sub2_ptr ) {
            std::cout << "" << std::endl;
            return 0;
         };
      };
      3, const_cast: Used for adding or removing const or volatile qualifiers. It should be used
      sparingly and only when necessary, as misuse can easily lead to undefined behavior. This cast
      involves compile-time checks and typically incurs minimal performance overhead since it only
      modifies type qualifiers without altering the underlying object.
      4, reinterpret_cast: Intended for low-level reinterpretation of an object’s bit pattern. It is
      the most powerful and dangerous cast, used in situations where other casts are insufficient.
      While it can achieve results similar to type punning, it comes with significant caveats regarding
      safety and portability. Its performance is generally comparable to C-style casting, as it does
      not perform any type checks and simply reinterprets the bits.
  auto& val1_name = std::any_cast<Type1&>(var_name); // better than the next statement, will be optimized.
  // auto& val1_name = std::any_cast<Type1&>(var_name);
  auto& val2_name = std::any_cast<Type2&>(var_name);
   7) void pointer: It is a special type of pointer that can point to any data type but cannot be
   dereferenced directly without first casting it to another pointer type. It is commonly used in
   function arguments for functions that need to handle different types of data. Functions like
   malloc and calloc return void pointer which must be cast to the appropriate type.

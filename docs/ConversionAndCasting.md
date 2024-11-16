<!-- vim-markdown-toc GFM -->

- [Conversion and Casting](#conversion-and-casting)
  - [Explanation](#explanation)
  - [Implicit Conversion](#implicit-conversion)
    - [Explanation](#explanation-1)
    - [Examples](#examples)
  - [Explicit Conversion (Type Casting)](#explicit-conversion-type-casting)
    - [Explanation](#explanation-2)
    - [C-style Casting (Recommend for Performance)](#c-style-casting-recommend-for-performance)
      - [Explanation](#explanation-3)
      - [Syntax](#syntax)
    - [C++-style Casting (Recommend for Safety)](#c-style-casting-recommend-for-safety)
      - [Explanation](#explanation-4)
      - [`static_cast` (Recommend for Safety and Performance)](#static_cast-recommend-for-safety-and-performance)
        - [Explanation](#explanation-5)
        - [Syntax](#syntax-1)
        - [Usage](#usage)
        - [Limitations](#limitations)
        - [Requirements for Using `static_cast`](#requirements-for-using-static_cast)
      - [`dynamic_cast` (Recommend for Safety but Not Recommend for Performance)](#dynamic_cast-recommend-for-safety-but-not-recommend-for-performance)
        - [Explanation](#explanation-6)
        - [Syntax](#syntax-2)
        - [Usage](#usage-1)
        - [Limitations](#limitations-1)
        - [Requirements for Using `dynamic_cast`](#requirements-for-using-dynamic_cast)
      - [`const_cast` (Recommend for Safety but Not Recommend for Performance)](#const_cast-recommend-for-safety-but-not-recommend-for-performance)
        - [Explanation](#explanation-7)
        - [Syntax](#syntax-3)
        - [Usage](#usage-2)
      - [`reinterpret_cast` (Recommend for Performance but Not Recommend for Safety)](#reinterpret_cast-recommend-for-performance-but-not-recommend-for-safety)
        - [Explanation](#explanation-8)
        - [Syntax](#syntax-4)
        - [Usage](#usage-3)
        - [Requirements for Using `reinterpret_cast`](#requirements-for-using-reinterpret_cast)
      - [Notes](#notes)
    - [`explicit`](#explicit)
      - [Explanation](#explanation-9)
      - [Syntax](#syntax-5)
  - [`std::bit_cast` (Recommended for Safety, Performance and Type Integrity)](#stdbit_cast-recommended-for-safety-performance-and-type-integrity)
    - [Explanation](#explanation-10)
    - [Syntax](#syntax-6)
    - [Usage](#usage-4)
    - [Requirements for Using `std::bit_cast`](#requirements-for-using-stdbit_cast)
  - [Differences between `std::bit_cast` and `reinterpret_cast`](#differences-between-stdbit_cast-and-reinterpret_cast)
    - [Safety and Type Checking](#safety-and-type-checking)
      - [`std::bit_cast`:](#stdbit_cast)
      - [`reinterpret_cast`:](#reinterpret_cast)
    - [Intent and Purpose](#intent-and-purpose)
      - [`std::bit_cast`:](#stdbit_cast-1)
      - [`reinterpret_cast`:](#reinterpret_cast-1)
    - [Performance](#performance)
      - [`std::bit_cast`:](#stdbit_cast-2)
      - [`reinterpret_cast`:](#reinterpret_cast-2)
    - [Requirements for Usage](#requirements-for-usage)
      - [`std::bit_cast`:](#stdbit_cast-3)
      - [`reinterpret_cast`:](#reinterpret_cast-3)
  - [Upcasting and Downcasting](#upcasting-and-downcasting)
    - [Explanation](#explanation-11)
    - [Upcasting](#upcasting)
    - [Downcasting](#downcasting)
  - [Notes](#notes-1)

<!-- vim-markdown-toc -->

## Conversion and Casting

### Explanation

1. In C++, conversion and casting refer to the mechanisms used to **convert a value from one data
   type to another**.
2. Conversion can occur **implicitly** or **explicitly**.
3. **Implicit conversion**, also known as **type coercion**, happens **automatically** when the
   compiler converts one data type to another **without requiring explicit instructions** from the
   programmer.
4. In contrast, **explicit conversion** **requires** the programmer to define the **conversion
   process**, which can be accomplished through various casting methods.
5. Conversion and casting can **impact performance**, especially in performance-critical
   applications.
6. When **a conversion occurs** between two types, **the impact on performance depends on how
   difficult it is to operate on those types**.
7. For example, converting between `int` and `float` can impact performance because operations on
   `float` are generally slower.
8. However, converting between `int` and `unsigned int` does not typically have a significant
   performance impact, as both are integer types.

### Implicit Conversion

#### Explanation

1.  Implicit conversion occurs when the compiler **automatically converts a value from one type to
    another**, usually in situations involving mixed-type expressions.
2.  It is **only** allowed to **happen once** and happens **automatically**.
3.  The **compiler ensures** that the conversion is **valid** and **safe**.
4.  However, implicit conversions can sometimes **lead to unexpected behavior**, especially if
    there’s **data loss** (e.g., converting a double to an int might lose the fractional part).
5.  When an **object** is **copied** using the **assignment operator**, if the source object is of
    **a different type**, **implicit conversion** may occur, invoking the **assignment operator
    overload** and potentially a **constructor**.

#### Examples

```CPP
class B {
   public:
      explicit B( Type mem ): _mem( mem ){};
      Type _mem;
};

class A {
   public:
      A(): _mem( initializer1 ) {};

      // Constructor for implicit conversion.
      A( const B& b ): _mem( b._mem ) {};

      // Assignment operator overload.
      A& operator=( const B& b ) {
         _mem = b._mem;
         return *this;
      };

      // Assignment operator overload.
      A& operator=( const A& other ) = default;

      Type _mem;
};

int main() {
   A a;                   // Default A.
   B b( initializer2 );   // B initialized with an initializer2.
   // Only A's assignment operator are invoked. In fact, it's also a implicit conversion.
   a = b;
};
```

```CPP
class B {
   public:
      explicit B( Type mem ): _mem( mem ){};
      Type _mem;
};

class A {
   public:
      A(): _mem( initializer1 ) {};

      // Constructor for implicit conversion.
      A( const B& b ): _mem( b._mem ) {};

      // Assignment operator overload.
      A& operator=( const A& other ) = default;

      Type _mem;
};

int main() {
   A a;                   // Default A.
   B b( initializer2 );   // B initialized with an initializer2.
   // First, implicit conversion: A's conversion constructor is invoked.
   // Second, assignment: A's default assignement operator is invoked.
   a = b;
};
```

### Explicit Conversion (Type Casting)

#### Explanation

1. **Explicit conversion**, or **type casting**, allows **programmers** to **define how a value
   should be converted from one type to another**.
2. This is crucial in scenarios where implicit conversion may lead to data loss or unintended
   behavior.
3. However, there’s **no guarantee** that the **conversion is safe**, and **programmers** must
   **ensure** the **correctness**.

#### C-style Casting (Recommend for Performance)

##### Explanation

1. C-style casting uses the syntax `(Type)initializer` to convert a variable or a value to the
   desired type.
2. While this method is **straightforward**, it can be **ambiguous** and may lead to **unexpected
   results** since it can **invoke multiple conversion methods**, including `static_cast`,
   `dynamic_cast`, `const_cast`, and `reinterpret_cast`, depending on the context.
3. In addition, the compiler may **not optimize C-style casts as effectively** since they **lack
   explicit intent**, making it harder for the compiler to understand what type conversions are
   valid.

##### Syntax

```CPP
( TargetType )initializer;
```

#### C++-style Casting (Recommend for Safety)

##### Explanation

1. C++ introduced several **specific casting operators** to provide **more clarity and safety** in
   type conversion. These are `static_cast`, `dynamic_cast`, `const_cast`, and `reinterpret_cast`.
2. These four casts do **not introduce any new functionality** to C++. All of them **can be
   implemented using C-style casting**.
3. They **merely clarify the intent** behind the cast.

##### `static_cast` (Recommend for Safety and Performance)

###### Explanation

1. `static_cast` is used for **safe, compile-time type conversion**.
2. It can be used for well-defined conversions between **related types**, such as upcasting and
   downcasting in **inheritance hierarchies**, **without runtime checks**.
3. It is **safer than C-style casting** but still **requires caution**, **especially** during
   **downcasting**.
4. This cast involves **compile-time checks** and is generally **efficient**, as it **can be
   optimized** by the compiler.

###### Syntax

```CPP
static_cast< TargetType >( initializer );
```

###### Usage

1. Primitive type conversion.
2. Pointer type conversion within inheritance.
3. Converting `void` pointer to another pointer type.
4. All implicit conversions.

###### Limitations

1. **Cannot** cast between **incompatible types**:
   - It only works with related types. For example, you cannot use `static_cast` to convert an
     **unrelated class** to another.
2. **No runtime type safety**:
   - If `static_cast` is used to **downcast in an inheritance hierarchy**, it **won't check the
     actual type at runtime**.
   - This can lead to **undefined behavior** if the object isn't of the expected type.
3. **Not** for casting **between pointers and non-pointers**:
   - You cannot cast between **objects and pointers** (e.g., from an integer to a pointer) with
     `static_cast`. For such conversions, `reinterpret_cast` is required.
4. **No removal** of **`const` or `volatile`** qualifiers:
   - `static_cast` **cannot add or remove `const` or `volatile` qualifiers**. Use `const_cast` for
     this purpose.

###### Requirements for Using `static_cast`

1. **Types** must be **compatible**:
   - The conversion must make sense in the context of the C++ type system (e.g., converting between
     base and derived classes, or between numeric types).
2. **Inheritance hierarchy**:
   - You can only cast pointers or references within the same class hierarchy (i.e., between base
     and derived classes).
3. **Known at compile time**:
   - The conversion must be determined at compile time, as `static_cast` does not involve any
     runtime checks.

##### `dynamic_cast` (Recommend for Safety but Not Recommend for Performance)

###### Explanation

1. `dynamic_cast` is designed for **safe, runtime-checked downcasting** in **polymorphic
   hierarchies**.
2. It ensures that the **cast** is **valid at runtime**, making it the safest option for casting
   within class hierarchies.
3. If the cast is **unsuccessful**, it **returns nullptr (for pointers)** or **throws an exception
   (for references, `std::bad_cast`)**, thus enhancing type safety.
4. However, this added safety can result in **slower performance** compared to `static_cast`.
5. The **runtime check** in `dynamic_cast` is **implemented** **using** the **Run-Time Type
   Information (RTTI)** mechanism in C++, which **includes type information** and **the virtual
   table (vtable)**.
6. Its **downcasting workflow** involves **RTTI lookup**, **hierarchy traversal**, and **pointer
   adjustment**.
7. `dynamic_cast` requires **at least one virtual function**.
8. Because it slows down performance, we can **use a macro to determine whether to use it in debug
   mode or release mode**.
9. Last, we should **check if RTTI is enabled** in our compiler. (GCC/G++ enables it by default,
   while MSVC does not.)

###### Syntax

```CPP
dynamic_cast< TargetType >( initializer );
```

###### Usage

1. Safe downcasting with pointers:
   ```CPP
   class Base {
      public:
         virtual Type funcName(){ ... };
         virtual ~Base()= default;
   };
   class Derived: public Base { ... };
   int main() {
      Base* base_ptr = new Derived();
      Derived* der_ptr = dynamic_cast< Derived* >( base_ptr );
      if( !der_ptr ) {
         std::cout << "Failed to cast to Derived." << std::endl;
         return 0;
      };
   };
   ```
2. Downcasting with references:
   ```CPP
   class Base {
      public:
         virtual Type funcName(){ ... };
         virtual ~Base() = default;
   };
   class Derived: public Base { ... };
   int main() {
      Base base;   // Not a Derived instance.
      try {
         // This will throw `std::bad_cast` because base is not of type Derived.
         Derived& der_ref = dynamic_cast< Derived& >( base );
      } catch( const std::bad_cast& e ) {
         std::cout << "Caught exception: " << e.what() << '\n';
      };
   };
   ```

###### Limitations

1. **Polymorphic** base class required:
   - `dynamic_cast` **only works** if the base class has **at least one virtual function**
     (typically a virtual destructor).
2. Slight **performance overhead**:
   - Since `dynamic_cast` performs runtime type checking, it is slower than `static_cast`,
     especially in complex class hierarchies.
3. **Works only on pointers and references**:
   - You cannot use `dynamic_cast` on regular objects. It only works on pointers or references.
4. Downcast safety depends on runtime type:
   - If the object **isn't** of the expected type, the cast will either **return nullptr (for
     pointers)** or **throw a `std::bad_cast` exception (for references)**.
5. **Requires RTTI (Run-Time Type Information)**:
   - RTTI must be enabled in the compiler (it’s usually enabled by default). If RTTI is disabled,
     `dynamic_cast` will not work.

###### Requirements for Using `dynamic_cast`

1. **Polymorphic** base class:
   - The base class involved in the cast must contain **at least one virtual function**, typically a
     virtual destructor.
2. **Pointer or reference** types:
   - `dynamic_cast` can **only** be used to **cast pointers or references**—it won't work for normal
     values.
3. **Valid object type at runtime**:
   - For downcasting, the object at runtime must match the derived type you're casting to;
     otherwise, the cast fails.

##### `const_cast` (Recommend for Safety but Not Recommend for Performance)

###### Explanation

1. `const_cast` is used for **adding or removing `const` or `volatile` qualifiers** from **a pointer
   or reference**.
2. It should be **used sparingly** and only when **necessary**, as **misuse** can easily lead to
   **undefined behavior**.
3. This cast involves **compile-time checks** and typically incurs **minimal performance overhead**
   since it only modifies type qualifiers without altering the underlying object.
4. `const_cast` **only adds or removes the `const` or `volatile` qualifiers**; it **doesn’t convert
   between unrelated types**.

###### Syntax

```CPP
const_cast< TargetType >( initializer );
```

###### Usage

1. Removing `const` to modify a non-const object.
2. Adding or removing `volatile`.

##### `reinterpret_cast` (Recommend for Performance but Not Recommend for Safety)

###### Explanation

1. `reinterpret_cast` is intended for **low-level reinterpretation** of an object’s bit pattern,
   which allows **conversion between incompatible types**.
2. It is the **most powerful and dangerous cast**, used in situations where other casts are
   insufficient.
3. This cast does **not check type compatibility** and can lead to **undefined behavior** if
   **misused**, so it should be used with caution.
4. While it can achieve results **similar to type punning**, it comes with significant **caveats
   regarding safety and portability**.
5. Its **performance** is generally **comparable to C-style casting**, as it does not perform any
   type checks and simply reinterprets the bits.
6. **Bit patterns** refer to **interpreting data as binary values** and considering **how many
   bytes** it occupies.

###### Syntax

```CPP
reinterpret_cast< TargetType >( initializer );
```

###### Usage

1. **Pointer type** conversions:
   - It is commonly used to convert one pointer type to another, even between unrelated types.
2. **Reference type** conversions:
   - Similar to pointers, `reinterpret_cast` can convert one reference type to another.
   - This allows for casting references of different types, but care must be taken to ensure the
     underlying object types are compatible.
3. Casting **between pointer and integer types**:
   - It can be used to cast pointers to integral types (e.g., `uintptr_t`) and vice versa.
   - **The integral types must be** either a **32-bit** unsigned or a **64-bit** **unsigned type**,
     depending on the system architecture.
4. **Interfacing with hardware or system-level code**:
   - Useful in systems programming or when dealing with low-level constructs, such as when
     interfacing with hardware or legacy C libraries.

###### Requirements for Using `reinterpret_cast`

1. **Pointer or reference** Types:
   - The expression being cast must be a pointer or reference type.
2. **Correctness** of the cast:
   - Ensure that the object being accessed through the cast pointer is **compatible with the
     target** type.
   - **Avoid** using `reinterpret_cast` on pointers of **unrelated types** unless you are sure of
     what you are doing.

##### Notes

1. We recommend **adopting C++-style casting** for **new projects**, **smaller codebases**, or if
   you are **new to C++**, as it offers a safer alternative.
2. It is essential to **understand** **whether** a particular cast **involves runtime or
   compile-time checks**.
3. The distinct naming of these casts **enhances code readability** and **facilitates easy
   identification during code searches**. (Search for their names to identify where explicit
   conversions occur.)
4. When **converting a `void` pointer type to a specific pointer type (or vice versa)**,
   **`static_cast` is the preferred choice**. It is best used for casting between `void` pointer
   type and other pointer types, provided there’s no need for low-level reinterpretation.

#### `explicit`

##### Explanation

1. The `explicit` keyword in C++ is used to **prevent implicit conversions** when defining
   **constructors** or **conversion operators**.
2. By marking a constructor `as explicit`, you ensure that it can only be called with a direct
   initialization, thus **avoiding unintended conversions** that might lead to errors.
3. This feature **enhances type safety** and **code readability** by making the programmer's
   intentions clear.

##### Syntax

```CPP
explicit ConstructorName( para_list );
```

```CPP
// Conversion operator.
// `const` function.
explicit operator TargetType() const {
    // Custom conversion logic here.
};
```

### `std::bit_cast` (Recommended for Safety, Performance and Type Integrity)

#### Explanation

1. `std::bit_cast` is designed for **safe reinterpretation** of **an object’s bit pattern**,
   allowing conversion **between types** of **the same size**.
2. It provides a type-safe mechanism for casting, ensuring that **the sizes of the source and target
   types** are **equal** **at compile time**.
3. This function is **less risky** than `reinterpret_cast`, as it **prevents undefined behavior**
   that can arise from size mismatches or type incompatibility.
4. `std::bit_cast` is ideal **for type punning** while maintaining safety and portability, making it
   a preferable choice for most use cases.
5. The **performance** is comparable to `reinterpret_cast`, as it also does **not incur overhead**
   from type checking, but it provides stronger guarantees about correctness.
6. Bit patterns refer to **interpreting data as binary values** and **considering how many bytes it
   occupies**, with `std::bit_cast` ensuring the integrity of those bits.

#### Syntax

```CPP
// Declaration syntax.
template< typename To, typename From >
constexpr To std::bit_cast( const From& src );
```

```CPP
// Usage syntax.
std::bit_cast< TargetType >( initializer );
```

#### Usage

1. **Reinterpreting fundamental types**:
   - Commonly used to reinterpret bit patterns between types **like integers and floating-point
     numbers**.
2. **Casting structs or classes**:
   - Can be used to **cast complex types** like structs or classes **to and from** **byte arrays or
     other types**, ensuring the bit representation is preserved.
3. **Safe type punning**:
   - Useful in scenarios where you need to access the underlying bit representation of an object
     without risking undefined behavior.

#### Requirements for Using `std::bit_cast`

1. Sametsize types:
   - **The source and target** types must be of **the same size**; **otherwise**, **a compile-time
     error will occur**.
2. Type compatibility:
   - While `std::bit_cast` does **not require types to be related**, it is crucial to ensure the
     types make sense for the intended interpretation of the data.
3. **Constexpr support**:
   - It **can** be **used in constant expressions**, making it suitable for scenarios that require
     **compile-time evaluations**.

### Differences between `std::bit_cast` and `reinterpret_cast`

#### Safety and Type Checking

##### `std::bit_cast`:

1. Type safety:
   - `std::bit_cast` ensures that the **source and destination** types are **the same size** **at
     compile time**.
   - If they are **not**, it will result in **a compilation error**.
2. Undefined behavior:
   - It **avoids undefined behavior** by enforcing size constraints and ensuring that both types can
     be safely represented with the same number of bits.

##### `reinterpret_cast`:

1. Type safety:
   - `reinterpret_cast` does **not perform any compile-time checks** on size or type compatibility.
   - It allows for **casting between unrelated types**, which can **lead to undefined behavior** if
     **misused**.
2. Undefined behavior:
   - If you attempt to **access the bits** of the reinterpreted type and **the sizes** are **not
     compatible**, it can **result in undefined behavior**.

#### Intent and Purpose

##### `std::bit_cast`:

1. Intent:
   - The primary intent of `std::bit_cast` is to **safely reinterpret the bit representation** of an
     object **without modifying its underlying data**.
   - It is used when you want to **change the type of the object** while preserving its bit pattern.
2. Use cases:
   - It is suitable for scenarios like **converting between integer types and floating-point types**
     or **safely casting structs to byte arrays**.

##### `reinterpret_cast`:

1. Intent:
   - `reinterpret_cast` is used for **low-level, potentially unsafe type conversions**.
   - It conveys a need for flexibility in **converting between pointer types, reference types, or
     even between pointers and integers**.
2. Use cases:
   - Commonly used in **systems programming**, **interfacing with hardware**, or when **interacting
     with legacy C libraries** where type safety is not a priority.

#### Performance

##### `std::bit_cast`:

1. Performance:
   - It has performance characteristics **similar to `reinterpret_cast`**, as it does not incur the
     overhead of type checks at runtime.
   - However, it provides stronger guarantees regarding type safety.

##### `reinterpret_cast`:

1. Performance:
   - Its performance is generally **comparable to C-style casting**, as it performs no safety checks
     and directly reinterprets the bits.

#### Requirements for Usage

##### `std::bit_cast`:

1. **Same size**:
   - The source and target types must be of the same size.
2. `constexpr` support:
   - **Can be used in constant expressions**.

##### `reinterpret_cast`:

1. Pointer or reference types:
   - The expression being cast **must be a pointer or reference type**.
2. **Correctness of the cast**:
   - **Users must ensure** that the object being accessed through the cast pointer is compatible
     with the target type.

### Upcasting and Downcasting

#### Explanation

1. Upcasting and downcasting are **terms** used to describe **type conversions within an inheritance
   hierarchy** (i.e., between a base class and its derived classes).
2. These casts typically involve **pointer or reference conversions**.

#### Upcasting

1. Upcasting refers to **casting a derived class object to a base class type**.
2. This conversion is **safe** and **performed implicitly** or **explicitly using `static_cast`**.
3. Since the derived class contains all the members of the base class, the cast will always succeed.
4. **Base class members** will be **accessible**, but **derived class-specific members** will be
   **hidden** **unless** the base class method is marked as **virtual** (allowing for polymorphism).

#### Downcasting

1. Downcasting refers to **casting a base class object to a derived class type**.
2. This is potentially **unsafe**, as the base class might not actually be an instance of the
   derived class.
3. Therefore, **`dynamic_cast` should be used** when performing downcasting to ensure runtime type
   safety.
4. **`dynamic_cast` should be used** for downcasting when you are **unsure** if the **base pointer
   refers to an instance** of the derived class.

### Notes

1. Learning this topic through practice rather than theory.

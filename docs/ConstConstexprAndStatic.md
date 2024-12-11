<!-- vim-markdown-toc GFM -->

- [`const`, `constexpr` and `static`](#const-constexpr-and-static)
  - [`const`](#const)
    - [Explanation](#explanation)
    - [Usage](#usage)
      - [`const` Variables](#const-variables)
        - [Explanation](#explanation-1)
        - [Syntax](#syntax)
      - [`const` Pointers](#const-pointers)
        - [Explanation](#explanation-2)
        - [Syntax](#syntax-1)
      - [`const` References](#const-references)
        - [Explanation](#explanation-3)
        - [Syntax](#syntax-2)
      - [`const` Member Variables](#const-member-variables)
        - [Explanation](#explanation-4)
        - [Syntax](#syntax-3)
      - [`const` Methods (`const` Member Functions)](#const-methods-const-member-functions)
        - [Explanation](#explanation-5)
        - [Syntax](#syntax-4)
      - [`const` Function Parameters](#const-function-parameters)
        - [Explanation](#explanation-6)
        - [Syntax](#syntax-5)
      - [`const` Return Values](#const-return-values)
        - [Explanation](#explanation-7)
        - [Syntax](#syntax-6)
      - [`const` Return Pointers](#const-return-pointers)
        - [Explanation](#explanation-8)
        - [Syntax](#syntax-7)
      - [`const` Return References](#const-return-references)
        - [Explanation](#explanation-9)
        - [Syntax](#syntax-8)
      - [`const` Instances of Classes](#const-instances-of-classes)
        - [Explanation](#explanation-10)
        - [Syntax](#syntax-9)
  - [`constexpr`](#constexpr)
    - [Explanation](#explanation-11)
    - [Allowed Elements (Valid Elements)](#allowed-elements-valid-elements)
    - [Disallowed Elements](#disallowed-elements)
    - [Usage](#usage-1)
      - [`constexpr` Variables](#constexpr-variables)
        - [Explanation](#explanation-12)
        - [Syntax](#syntax-10)
      - [`constexpr` Pointers](#constexpr-pointers)
        - [Explanation](#explanation-13)
        - [Syntax](#syntax-11)
      - [`constexpr` References](#constexpr-references)
        - [Explanation](#explanation-14)
        - [Syntax](#syntax-12)
      - [`constexpr` Member Variables](#constexpr-member-variables)
        - [Explanation](#explanation-15)
        - [Syntax](#syntax-13)
      - [`constexpr` Functions (`constexpr` Return Values)](#constexpr-functions-constexpr-return-values)
        - [Explanation](#explanation-16)
        - [Syntax](#syntax-14)
      - [`constexpr` Constructors (C++11 and later)](#constexpr-constructors-c11-and-later)
        - [Explanation](#explanation-17)
        - [Syntax](#syntax-15)
      - [`constexpr` Instances of Classes](#constexpr-instances-of-classes)
        - [Explanation](#explanation-18)
        - [Syntax](#syntax-16)
      - [User-defined Literals](#user-defined-literals)
        - [Explanation](#explanation-19)
        - [Syntax](#syntax-17)
      - [`constexpr` with `if` (C++17 and later)](#constexpr-with-if-c17-and-later)
        - [Explanation](#explanation-20)
        - [Syntax](#syntax-18)
  - [`static`](#static)
    - [Explanation](#explanation-21)
    - [Usage](#usage-2)
      - [`static` Local Variables](#static-local-variables)
        - [Explanation](#explanation-22)
        - [Syntax](#syntax-19)
      - [`static` Global Variables](#static-global-variables)
        - [Explanation](#explanation-23)
        - [Syntax](#syntax-20)
      - [`static` Member Variables](#static-member-variables)
        - [Explanation](#explanation-24)
        - [Syntax](#syntax-21)
      - [`static` Methods (`static` Member Functions)](#static-methods-static-member-functions)
        - [Explanation](#explanation-25)
        - [Syntax](#syntax-22)
      - [`static` Global Functions](#static-global-functions)
        - [Explanation](#explanation-26)
        - [Syntax](#syntax-23)
      - [`static` Instances of Classes](#static-instances-of-classes)
        - [Explanation](#explanation-27)
        - [Syntax](#syntax-24)

<!-- vim-markdown-toc -->

## `const`, `constexpr` and `static`

### `const`

#### Explanation

1. The `const` **keyword** is used to **declare constants or read-only variables**.
2. When a variable is declared as `const`, its value **cannot be modified** after it is initialized.
3. This concept is beneficial for **protecting data** from unintended changes and for **enhancing
   code readability and maintainability**.
4. However, it is **just a promise** that programmers should keep something constant and **can be
   broken**.

#### Usage

##### `const` Variables

###### Explanation

1. A `const` variable is **a variable** whose value **cannot be changed** after it has been
   initialized.
2. The keyword `const` stands for "constant" and is used to define variables that should remain
   unchanged throughout their lifespan.
3. A `const` variable must **be initialized when it is declared**.
4. It can be **evaluated at compile time** if it is **initialized with a constant expression**.
5. It can bind to **a literal value or a temporary result**.

###### Syntax

```CPP
const Type var_name = value;
```

##### `const` Pointers

###### Explanation

1. `const Type* pointer_name;` means **the value** pointed to cannot be altered through this
   pointer.
2. `Type* const pointer_name;` means **the pointer address itself** cannot be changed after it is
   initialized.

###### Syntax

1. Pointer to constant value: `const Type* ptr_name;`
2. Constant pointer: `Type* const ptr_name;`

##### `const` References

###### Explanation

1. A `const` reference is **a reference** that **points to a value but cannot modify it**.
2. `const` references are commonly **used to avoid copying large objects** in function parameters or
   to ensure a value isn’t modified when it’s passed as a reference.
3. **A `const` reference** can bind to **a literal value or a temporary result**.

###### Syntax

```CPP
const& Type var_name = value;
```

##### `const` Member Variables

###### Explanation

1. A `const` data member **must be initialized** when the object is **constructed** because its
   value **cannot be changed** after initialization.
2. There are only two way to initialize a `const` member:
   - **In-class initialization**:
     - In-class initialization works well **for constants of integral types (like int, char, etc.)
       or other literal types**.
     - For **non-integral types**, **initializer lists** must be used.
     - It can be **overridden** by the constructor.
   - **Constructor initializer lists**.

###### Syntax

```CPP
class ClassName {
   private:
      // In-class initialization.
      const Type _mem = initializer;
};
```

##### `const` Methods (`const` Member Functions)

###### Explanation

1. A `const` member method is **a member function of a class** that **does not modify the object**
   on which it is called.
2. This means the `const` member function **can't modify any non-mutable member variables** of the
   class or object.
3. In addition, a `const` function can **be overloaded** with other non-const functions, even if
   their names and parameter lists are the same.
4. This is possible because their signatures differ, as the **`const`** keyword **modifies the
   function signatures**.
5. However, if a member is of **pointer** type, **the value or object** the pointer points to does
   **not belong to the class**.
6. **Only the address** stored in the pointer **belongs to the class**.
7. Therefore, a `const` function can **still modify the pointed-to value or object**.

###### Syntax

```CPP
RetType funcName( para_list ) const;
```

##### `const` Function Parameters

###### Explanation

1. A `const` parameter is **a parameter** that **receives an argument** and **ensures** that the
   function **does not change the argument**.

###### Syntax

```CPP
void funcName( const Type para1, ... );
```

##### `const` Return Values

###### Explanation

1. **Returning a `const` value** from a function indicates that the returned value **cannot be
   modified** by the caller.
2. However, if **a `const`** return value **is assigned** to **a non-const** variable, it **becomes
   modifiable** once the **assignment operation** is complete.

###### Syntax

```CPP
const RetType funcName( para_list ) {
    // Function body.
};
```

##### `const` Return Pointers

###### Explanation

1. A function can return **a pointer to a constant value**, ensuring that **the value** being
   pointed to **cannot be modified** through the pointer.
2. To **assign a `const` return pointer to a variable**, the **variable** must likewise be **a
   pointer to `const`**.

###### Syntax

```CPP
const returnType* funcName() {
    // Function body
};
```

##### `const` Return References

###### Explanation

1. A function can return **a reference to a constant object**, allowing **efficient access** to the
   object while ensuring it **cannot be modified**.
2. To **assign a `const` return reference to a variable**, the **variable** must likewise be **a
   `const` reference**.

###### Syntax

```CPP
const returnType& funcName() {
    // Function body
};
```

##### `const` Instances of Classes

###### Explanation

1. A `const` instance **ensures** that none of its **non-mutable members can be modified** after
   initialization.
2. However, if a member is of **pointer** type, **the value or object** the pointer points to does
   **not belong to the class**.
3. Only the **address** stored in the pointer **belongs to the class**.
4. Therefore, a `const` instance **cannot ensure** that this **value or object remains unmodified**.
5. **Only const-qualified member functions can be called** on a `const` instance. These are
   functions that do not modify the object’s state.
6. A `const` instance can still **modify `mutable` members**.

###### Syntax

```CPP
const ClassName obj_ptr;
```

### `constexpr`

#### Explanation

1. The `constexpr` **keyword** is used to **declare variables and functions** that can be
   **evaluated at compile-time**.
2. This feature allows the compiler to perform calculations and allocate memory for certain
   constructs even before the program runs.
3. When a variable or function is declared as `constexpr`, **all elements related to it** should be
   **evaluated at compile time**. For example, the function cannot contain any runtime I/O
   operations, as they cannot be evaluated at compile time.
4. It enforces that **certain values and calculations** can be **performed at compile-time**,
   leading to significant performance improvements.
5. Any variable or object declared with the `constexpr` keyword is constant and **cannot be modified
   after it is initialized**.
6. It enhances **the code readabilit**.

#### Allowed Elements (Valid Elements)

1. Constant expressions (e.g., literals, `constexpr` variables).
2. Simple arithmetic operations.
3. Control flow statements (like if, switch, and loops) that do not depend on runtime values.

#### Disallowed Elements

1. Runtime I/O operations (e.g., std::cout).
2. Dynamic memory allocation.
3. Non-constexpr function calls (unless those functions are also `constexpr`).

#### Usage

##### `constexpr` Variables

###### Explanation

1. A `constexpr` variable is **a variable** that **must be initialized with an initializer** that
   can be fully **resolved at compile-time**.
2. The **initializer must** be **evaluated at compile time**.

###### Syntax

```CPP
constexpr Type var_name = initializer;
```

##### `constexpr` Pointers

###### Explanation

1. `constexpr` applies to the **pointer itself**, meaning **the address** stored in the pointer must
   **be a constant expression**.
2. The **address** stored in a `constexpr` pointer must **be known at compile-time**.

###### Syntax

```CPP
constexpr Type* var_name = initializer;
```

##### `constexpr` References

###### Explanation

1. A `constexpr` reference is **a constant reference** that can **be evaluated at compile time**.
2. It can bind to **a literal value or a temporary result**.
3. `constexpr` references are used when you need a reference to a compile-time constant expression.
4. To declare a `constexpr` reference, it must be a const reference, and it must refer to a constant
   expression.

###### Syntax

```CPP
constexpr& Type var_name = initializer;
```

##### `constexpr` Member Variables

###### Explanation

1. A `constexpr` member variable is **a variable** defined within a class that can be **initialized
   with constant expressions or a `constexpr` constructor**.
2. This allows them to be **evaluated at compile time**, which can lead to **performance
   improvements** and enable more complex compile-time computations.

###### Syntax

```CPP
class ClassName {
   public:
      constexpr ClassName( Type mem ): _mem( mem ) { ...; };
      ...;
   private:
      constexpr Type _mem = initializer;
      ...;
};
```

##### `constexpr` Functions (`constexpr` Return Values)

###### Explanation

1. A `constexpr` function is **a function** that will be **evaluated at compile-time** if **given
   compile-time constant arguments**.
2. If the result of a `constexpr` function is **assigned to** a variable, the best choice is to keep
   the variable as **a `constexpr` variable**.
3. This ensures that the variable is **initialized at compile time**, which means **the result** of
   the function is also **evaluated at compile time**.
4. Additionally, its **parameters** should be **`const` values** or **constant expressions** to
   ensure that the function is executed at compile time.
5. **`RetType`** must be **a literal type**, which includes integral types, floating-point types,
   pointers, and certain user-defined types.

###### Syntax

```CPP
constexpr RetType funcName( para_list ) {
    // Function body
};

constexpr RetType var_name = funcName( para_list );
```

##### `constexpr` Constructors (C++11 and later)

###### Explanation

1. A `constexpr` constructor is **a construcotr** that can be used to **create instances** of the
   class with **constant expressions**.
2. When a `constexpr` constructor is used to construct an object, the best choice is to keep the
   **object as a `constexpr` type**, and **its initializer** should be **evaluated at compile
   time**.
3. Only when all related elements can be evaluated at compile time can the constructor also be
   evaluated at compile time.

###### Syntax

```CPP
class ClassName {
   public:
      // Initialize member variables at compile-time.
      constexpr ClassName( para_list ): ... {};

   private:
      ...;
};

constexpr ClassName obj_name( para_list );
```

##### `constexpr` Instances of Classes

###### Explanation

1. A `constexpr` instance is **an object** that is **evaluated at compile-time**, if all its
   dependencies (constructors, functions, and data) are also `constexpr`.
2. A `constexpr` instance must remain **immutable**, meaning its state cannot change after
   initialization.
3. **All data members** must be **initialized** by **the `constexpr` constructor** since further
   modifications are not allowed.
4. The class **must have a `constexpr` constructor**.
5. All **member functions** invoked on a `constexpr` object **must also be `constexpr`**.
6. Data members used in `constexpr` evaluation must be integral constants or themselves `constexpr`.
7. A `constexpr` instance **is always `const`** implicitly, but the reverse is not true—`const`
   instances are not guaranteed to be evaluated at compile time.

###### Syntax

```CPP
constexpr ClassName obj_ptr;
```

##### User-defined Literals

###### Explanation

1. User-defined literals allow you to **create custom literal suffixes** that **extend the
   functionality of built-in literals**.
2. This feature lets you **define special behaviors for literals of various types**, including
   integers, floating-point numbers, and strings.
3. It's especially useful for **creating more readable code**, **adding context or units to
   values**, and **improving type safety**.
4. User-defined literals are **created by defining functions with specific naming and parameter
   rules**.
5. They **begin with an underscore** and **are appended to a literal to convert it into a specific
   type or to invoke custom logic**.

###### Syntax

```CPP
constexpr RetType operator"" _suffix_name( Type para, ... ) {
   // Do something that can be evaluated at compile time.
   return ...;
};
Type var_name = value_suffix_name;
```

##### `constexpr` with `if` (C++17 and later)

###### Explanation

1. `if constexpr` allows you to **conditionally compile code** depending on whether a condition is
   constant at compile time.
2. Its key feature is that **only the branch of the statement** that is **true** (according to the
   compile-time condition) **will be compiled**.
3. **The other branch** will **be discarded** entirely by the compiler.

###### Syntax

```CPP
if constexpr( expr1 ) {
   ...;
} else if constexpr( expr2 ) {
   ...;
} else {
   ...;
};
```

### `static`

#### Explanation

1. The `static` **keyword** in C++ is used to **change the storage duration and visibility** of
   variables and functions. It alters how variables are initialized and where they can be accessed.
2. All `static` elements are **initialized only once** and **persist until the program terminates**.
3. **Local** variables/objects: It **changes their lifetime** but does not change their scope.
4. **Global** variables/objects/function: It does not change their lifetime, but it **changes their
   scope** by limiting them to the file where they are defined or declared.
5. **Class members variables**: It **changes their scope and lifetime**. `static` data members are
   initialized outside the class definition.
6. **Class member function**: It does **not allow them to access non-static members**, except for
   `static` members.

#### Usage

##### `static` Local Variables

###### Explanation

1. A `static` local variable is **a `static` variable** declared within a function that **maintains
   its state between function calls**.
2. It has **local scope**, meaning it is **only accessible within the function where it is
   declared**.
3. The variable is **automatically initialized to zero** if **not explicitly initialized**.

###### Syntax

```CPP
RetType funcName() {
    // Initialized only once and retains value between calls.
    static Type count = val;
    ...;
};
```

##### `static` Global Variables

###### Explanation

1. A `static` global variable is declared outside of all functions and is **only accessible within
   the file** in which it is declared, **preventing name conflicts in other files**.
2. The variable is **automatically initialized to zero** if **not explicitly initialized**.

###### Syntax

```CPP
static Type var_name;
```

##### `static` Member Variables

###### Explanation

1. `static` members of a class belong to the class itself rather than any object instance and **can
   be accessed without an instance**. **`static` members** are **shared among all instances of that
   class**.
2. They are **accessed using the class name** instead of the object name.
3. `static` keyword **only changes their lifetime**; it does **not affect their visibility**.
4. **Non-inline or non-constexpr** `static` member variables should be **defined or initialized
   outside the class**.
5. **`inline` or `constexpr`** `static` member variables can be **defined or initialized inside or
   outside the class**.
6. In fact, `static` members are **`static` variables defined within a namespace**.

###### Syntax

```CPP
class ClassName {
   public:
      // Declaration of a static public class member.
      static Type1 _staticMember1;
      static Type2 _staticMember2;
      static inline Type3 _staticMember3;
      static constexpr Type4 _staticMember4;
      static inline Type5 _staticMember5 = val5;
      static constexpr Type6 _staticMember6 = val6;

   private:
      // Declaration of a static private class member.
      static Type7 _staticMember7;
      static Type8 _staticMember8;
      static inline Type9 _staticMember9;
      static constexpr Type10 _staticMember10;
      static inline Type11 _staticMember11 = val11;
      static constexpr Type12 _staticMember12 = val12;
};

// If the `ClassName` definition is in a header file, the following statement
// should be placed in the .cpp file to avoid One Definition Rule (ODR) violations.
// Providing definition and initialization for the static member.
Type1 ClassName::_staticMember1 = val1;
Type2 ClassName::_staticMember2 = val2;
Type3 ClassName::_staticMember3 = val3;
Type4 ClassName::_staticMember4 = val4;
Type7 ClassName::_staticMember7 = val7;
Type8 ClassName::_staticMember2 = val8;
Type9 ClassName::_staticMember9 = val9;
Type10 ClassName::_staticMember10 = val10;
```

##### `static` Methods (`static` Member Functions)

###### Explanation

1. A `static` member function is **a function** defined within a class that can **be called without
   creating an instance** of the class.
2. It **cannot access instance variables or instance methods** directly, since it **does not have a
   `this`** pointer.
3. This means it can **only access `static` data members** or other **`static` member functions**
   within the class.
4. It can be **called using the class name**.

###### Syntax

```CPP
class ClassName {
   public:
      static RetType funcName( para_list ){
         // Function body.
      };
};

RetType var_name = ClassName::funcName( para_list );
```

```CPP
class ClassName {
   public:
      static RetType funcName( para_list );
};

ClassName::funcName( para_list ){
   // Function body.
};

RetType var_name = ClassName::funcName( para_list );
```

##### `static` Global Functions

###### Explanation

1. A `static` global function is a function **limited in visibility to the file** where it is
   defined, which helps to **avoid name conflicts across different files**.

###### Syntax

```CPP
static RetType funcName() {
    // Function body.
};
```

##### `static` Instances of Classes

###### Explanation

1. A `static` instance of a class refers to **an object of the class** that has `static` storage
   duration.
2. It **persists** for the **entire duration** of the program (until the program terminates).
3. It is **initialized only once**, **the first time** its definition or block **is executed**.
4. It can be scoped to a function, class, or namespace, depending on where it is declared.
5. In fact, it's **a `static` variable**, a `static` local variable or a `static` global variable.

###### Syntax

```CPP
static ClassName obj_ptr;
```

<!-- vim-markdown-toc GFM -->

- [`const`, `constexpr` and `static`](#const-constexpr-and-static)
  - [1) `const`](#1-const)
    - [Explanation](#explanation)
    - [Usage](#usage)
      - [(1) `const` Variables](#1-const-variables)
        - [Explanation](#explanation-1)
        - [Syntax](#syntax)
      - [(2) `const` Pointers](#2-const-pointers)
        - [Explanation](#explanation-2)
        - [Syntax](#syntax-1)
      - [(3) `const` Member Variables](#3-const-member-variables)
        - [Explanation](#explanation-3)
        - [Syntax](#syntax-2)
      - [(4) `const` Methods or `const` Member Functions](#4-const-methods-or-const-member-functions)
        - [Explanation](#explanation-4)
        - [Syntax](#syntax-3)
      - [(5) `const` Function Parameters](#5-const-function-parameters)
        - [Explanation](#explanation-5)
        - [Syntax](#syntax-4)
      - [(6) `const` Return Values](#6-const-return-values)
        - [Explanation](#explanation-6)
        - [Syntax](#syntax-5)
      - [(7) `const` Return Pointers](#7-const-return-pointers)
        - [Explanation](#explanation-7)
        - [Syntax](#syntax-6)
      - [(8) `const` Return References](#8-const-return-references)
        - [Explanation](#explanation-8)
        - [Syntax](#syntax-7)
      - [(9) A `const` Instance of a `class`](#9-a-const-instance-of-a-class)
        - [Explanation](#explanation-9)
        - [Syntax](#syntax-8)
  - [2) `constexpr`](#2-constexpr)
    - [Explanation](#explanation-10)
    - [Allowed Elements or Valid Elements](#allowed-elements-or-valid-elements)
    - [Disallowed Elements](#disallowed-elements)
    - [Usage](#usage-1)
      - [(1) `constexpr` Variables](#1-constexpr-variables)
        - [Explanation](#explanation-11)
        - [Syntax](#syntax-9)
      - [(2) `constexpr` Pointers](#2-constexpr-pointers)
        - [Explanation](#explanation-12)
        - [Syntax](#syntax-10)
      - [(3) `constexpr` Member Variables](#3-constexpr-member-variables)
        - [Explanation](#explanation-13)
        - [Syntax](#syntax-11)
      - [(4) `constexpr` Functions or `constexpr` Return Values](#4-constexpr-functions-or-constexpr-return-values)
        - [Explanation](#explanation-14)
        - [Syntax](#syntax-12)
      - [(5) `constexpr` Constructors (C++11 and later):](#5-constexpr-constructors-c11-and-later)
        - [Explanation](#explanation-15)
        - [Syntax](#syntax-13)
      - [(6) A `constexpr` Instance of a `class`](#6-a-constexpr-instance-of-a-class)
        - [Explanation](#explanation-16)
        - [Syntax](#syntax-14)
  - [3) `static`](#3-static)
    - [Explanation](#explanation-17)
    - [Usage](#usage-2)
      - [(1) `static` Local Variables](#1-static-local-variables)
        - [Explanation](#explanation-18)
        - [Syntax](#syntax-15)
      - [(2) `static` Global Variables](#2-static-global-variables)
        - [Explanation](#explanation-19)
        - [Syntax](#syntax-16)
      - [(3) `static` Member Variables](#3-static-member-variables)
        - [Explanation](#explanation-20)
        - [Syntax](#syntax-17)
      - [(4) `static` Methods or `static` Member Function](#4-static-methods-or-static-member-function)
        - [Explanation](#explanation-21)
        - [Syntax](#syntax-18)
      - [(5) `static` Global Functions](#5-static-global-functions)
        - [Explanation](#explanation-22)
        - [Syntax](#syntax-19)
      - [(6) A `static` Instance of a `class`](#6-a-static-instance-of-a-class)
        - [Explanation](#explanation-23)
        - [Syntax](#syntax-20)

<!-- vim-markdown-toc -->

## `const`, `constexpr` and `static`

### 1) `const`

#### Explanation

1. The `const` **keyword** is used to **declare constants or read-only variables**.
2. When a variable is declared as `const`, its value **cannot be modified** after it is initialized.
3. This concept is beneficial for **protecting data** from unintended changes and for **enhancing
   code readability and maintainability**.
4. It is **just a promise** that we should keep something constant, but we **can still break it**.

#### Usage

##### (1) `const` Variables

###### Explanation

1. A `const` variable is **a variable** whose value **cannot be changed** after it has been
   initialized. The keyword `const` stands for "constant" and is used to define variables that
   should remain unchanged throughout their lifespan.
2. A const variable must **be initialized when it is declared**.
3. A const variable can be **evaluated at compile time** if it is **initialized with a constant
   expression**.

###### Syntax

```CPP
const Type var_name = value;
```

##### (2) `const` Pointers

###### Explanation

1. `const Type* pointer_name;` means **the value** pointed to cannot be altered through this
   pointer.
2. `Type* const pointer_name;` means **the pointer address itself** cannot be changed after it is
   initialized.

###### Syntax

1. Pointer to constant value: `const Type* ptr_name;`
2. Constant pointer: `Type* const ptr_name;`

##### (3) `const` Member Variables

###### Explanation

1. A `const` data member **must be initialized** when the object is **constructed** because its
   value **cannot be changed** after initialization.
2. There are only two way to initialize a const member:
   - **In-Class Initialization**: In-class initialization works well **for constants of integral
     types (like int, char, etc.) or other literal types**. For **non-integral types**, you must use
     **initializer lists**. It can be **overridden** by the constructor.
   - **Constructor initializer lists**.

###### Syntax

```CPP
class ClassName {
   private:
      const Type _mem = initializer; // In-Class Initialization
};
```

##### (4) `const` Methods or `const` Member Functions

###### Explanation

1. A const member method is **a member function of a class** that **does not modify the object** on
   which it is called.
2. This means the const member function **can't modify any non-mutable member variables** of the
   class or object.
3. In addition, a `const` function can **be overloaded** with other non-const functions, even if
   their names and parameter lists are the same. This is possible because their signatures differ,
   as the **const** keyword **modifies the function signatures**.
4. However, if a member is of **pointer** type, **the value or object** the pointer points to does
   **not belong to the class**. Only the **address** stored in the pointer **belongs to the class**.
   Therefore, a const function can **still modify the pointed-to value or object**.

###### Syntax

```CPP
RetType funcName( para_list ) const;
```

##### (5) `const` Function Parameters

###### Explanation

1. A const parameter is **a parameter** that receives an argument and **ensures** that the function
   **does not change the argument**.

###### Syntax

```CPP
void funcName( const Type para1, ... );
```

##### (6) `const` Return Values

###### Explanation

1. **Returning a `const` value** from a function indicates that the returned value **cannot be
   modified** by the caller.
2. However, if we **assign** a `const` return value **to a non-const variable**, we **can modify**
   the variable **after** the **assignment** is complete.

###### Syntax

```CPP
const RetType funcName( para_list ) {
    // Function body
};
```

##### (7) `const` Return Pointers

###### Explanation

1. A function can return **a pointer to a constant value**, ensuring that **the value** being
   pointed to **cannot be modified** through the pointer.
2. If we want to assign a `const` return pointer to a variable, that **variable** must also be **a
   pointer to `const`**.

###### Syntax

```CPP
const returnType* funcName() {
    // Function body
};
```

##### (8) `const` Return References

###### Explanation

1. A function can return **a reference to a constant object**, allowing **efficient access** to the
   object while ensuring it **cannot be modified**.
2. If we want to assign a `const` return reference to a variable, that **variable** must also be **a
   `const` reference**.

###### Syntax

```CPP
const returnType& funcName() {
    // Function body
};
```

##### (9) A `const` Instance of a `class`

###### Explanation

1. A `const` instance **ensures** that none of its **non-mutable members can be modified** after
   initialization.
2. However, if a member is of **pointer** type, **the value or object** the pointer points to does
   **not belong to the class**. Only the **address** stored in the pointer **belongs to the class**.
   Therefore, a const instance **cannot ensure** that this **value or object remains unmodified**.
3. **Only const-qualified member functions can be called** on a `const` instance. These are
   functions that do not modify the object’s state.
4. A `const` instance can still **modify `mutable` members**.

###### Syntax

```CPP
const ClassName obj_ptr;
```

### 2) `constexpr`

#### Explanation

1. The `constexpr` **keyword** is used to **declare variables and functions** that can be
   **evaluated at compile-time**. This feature allows the compiler to perform calculations and
   allocate memory for certain constructs even before the program runs.
2. When a variable or function is declared as `constexpr`, **all elements related to it** should be
   **evaluated at compile time**. For example, the function cannot contain any runtime I/O
   operations, as they cannot be evaluated at compile time.
3. It enforces that **certain values and calculations** can be **performed at compile-time**,
   leading to significant performance improvements.
4. It enhances the code readabilit.

#### Allowed Elements or Valid Elements

1. Constant expressions (e.g., literals, `constexpr` variables).
2. Simple arithmetic operations.
3. Control flow statements (like if, switch, and loops) that do not depend on runtime values.

#### Disallowed Elements

1. Runtime I/O operations (e.g., std::cout).
2. Dynamic memory allocation.
3. Non-constexpr function calls (unless those functions are also constexpr).

#### Usage

##### (1) `constexpr` Variables

###### Explanation

1. A constexpr variable is **a variable** that **must be initialized with an initializer** that can
   be fully **resolved at compile-time**.
2. The **initializer must** be **evaluated at compile time**.

###### Syntax

```CPP
constexpr Type var_name = initializer;
```

##### (2) `constexpr` Pointers

###### Explanation

1. `constexpr` applies to the **pointer itself**, meaning **the address** stored in the pointer must
   **be a constant expression**.
2. The **address** stored in a `constexpr` pointer must **be known at compile-time**.

###### Syntax

```CPP
Type var_name = initializer;
constexpr Type var_name = initializer;
```

##### (3) `constexpr` Member Variables

###### Explanation

1. A `constexpr` member variable is **a variable** defined within a class that can be **initialized
   with constant expressions**.
2. This allows them to be **evaluated at compile time**, which can lead to performance improvements
   and enable more complex compile-time computations.

###### Syntax

```CPP
class ClassName {
   public:
      constexpr Type _mem = initializer;
};
```

##### (4) `constexpr` Functions or `constexpr` Return Values

###### Explanation

1. A constexpr function is **a function** that will be **evaluated at compile-time** if **given
   compile-time constant arguments**.
2. If the result of a `constexpr` function is **assigned to** a variable, the best choice is to keep
   the variable as **a `constexpr` variable**. This ensures that the variable is **initialized at
   compile time**, which means **the result** of the function is also **evaluated at compile time**.
3. Additionally, its **parameters** should be **`const` values** or **constant expressions** to
   ensure that the function is executed at compile time.
4. **`RetType`** must be **a literal type**, which includes integral types, floating-point types,
   pointers, and certain user-defined types.

###### Syntax

```CPP
constexpr RetType funcName( para_list ) {
    // Function body
};

constexpr RetType var_name = funcName( para_list );
```

##### (5) `constexpr` Constructors (C++11 and later):

###### Explanation

1. A `constexpr` constructor is **a construcotr** that can be used to **create instances** of the
   class with **constant expressions**.
2. When a `constexpr` constructor is used to construct an object, the best choice is to keep the
   **object as a `constexpr` type**, and **its initializer** should be **evaluated at compile
   time**. Only when all related elements can be evaluated at compile time can the constructor also
   be evaluated at compile time.

###### Syntax

```CPP
class ClassName {
   public:
      // Initialize member variables at compile-time.
      constexpr ClassName( para_list ): ... {};

   private:
      ...
};

constexpr ClassName obj_name( para_list );
```

##### (6) A `constexpr` Instance of a `class`

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

### 3) `static`

#### Explanation

1. The `static` **keyword** in C++ is used to **change the storage duration and visibility** of
   variables and functions. It alters how variables are initialized and where they can be accessed.
2. All static elements are **initialized only once** and **persist until the program terminates**.
3. **Local** variables/objects: It **changes their lifetime** but does not change their scope.
4. **Global** variables/objects/function: It does not change their lifetime, but it **changes their
   scope** by limiting them to the file where they are defined or declared.
5. **Class members variables**: It **changes their scope and lifetime**. `static` data members are
   initialized outside the class definition.
6. **Class member function**: It does **not allow them to access non-static members**, except for
   static members.

#### Usage

##### (1) `static` Local Variables

###### Explanation

1. A static local variable is **a static variable** declared within a function that **maintains its
   state between function calls**.
2. It has **local scope**, meaning it is **only accessible within the function where it is
   declared**.
3. The variable is **automatically initialized to zero** if **not explicitly initialized**.

###### Syntax

```CPP
RetType funcName() {
    static Type count = val; // Initialized only once and retains value between calls.
    ...
};
```

##### (2) `static` Global Variables

###### Explanation

1. A static global variable is declared outside of all functions and is **only accessible within the
   file** in which it is declared, **preventing name conflicts in other files**.
2. The variable is **automatically initialized to zero** if **not explicitly initialized**.

###### Syntax

```CPP
static Type var_name;
```

##### (3) `static` Member Variables

###### Explanation

1. `static` members of a class belong to the class itself rather than any object instance and **can
   be accessed without an instance**. **`static` members** are **shared among all instances of that
   class**.
2. They are accessed **using the class name** instead of the object name.
3. `static` keyword **only changes their lifetime**; it does **not affect their visibility**.
4. We should **define or initialize it outside the class**.
5. In fact, static members are **static variables defined within a namespace**.

###### Syntax

```CPP
class ClassName {
   public:
      static Type1 _staticMember1;   // Declaration of a static public class member.

   private:
      static Type2 _staticMember2;   // Declaration of a static private class member.
};

// Providing definition and initialization for the static member.
Type1 ClassName::_staticMember1 = 0;
Type2 ClassName::_staticMember2 = 0;
```

##### (4) `static` Methods or `static` Member Function

###### Explanation

1. A static member function is **a function** defined within a class that can **be called without
   creating an instance** of the class.
2. It **cannot access instance variables or instance methods** directly, since it **does not have a
   `this`** pointer. This means it can **only access static data members** or other **static member
   functions** within the class.
3. It can be **called using the class name**.

###### Syntax

```CPP
class ClassName {
public:
    static RetType funcName( para_list ) {
        // Function body
    };
};

RetType var_name = ClassName::funcName( para_list );
```

##### (5) `static` Global Functions

###### Explanation

1. A static global function is a function **limited in visibility to the file** where it is defined,
   which helps to **avoid name conflicts across different files**.

###### Syntax

```CPP
static RetType funcName() {
    // Function body
};
```

##### (6) A `static` Instance of a `class`

###### Explanation

1. A static instance of a class refers to **an object of the class** that has static storage
   duration.
2. It **persists** for the **entire duration** of the program (until the program terminates).
3. It is **initialized only once**, **the first time** its definition or block **is executed**.
4. It can be scoped to a function, class, or namespace, depending on where it is declared.
5. In fact, it's **a static variable**, a static local variable or a static global variable.

###### Syntax

```CPP
static ClassName obj_ptr;
```
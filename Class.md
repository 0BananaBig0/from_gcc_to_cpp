<!-- vim-markdown-toc GFM -->

* [`class`](#class)
  * [Explanation](#explanation)
  * [Visibility](#visibility)
  * [Declaration Syntax](#declaration-syntax)
  * [Definition Syntax](#definition-syntax)
  * [Common Objects](#common-objects)
    * [Declaration Syntax](#declaration-syntax-1)
    * [Initialization Syntax](#initialization-syntax)
  * [Class Pointers](#class-pointers)
    * [Declaration Syntax](#declaration-syntax-2)
    * [Initialization Syntax](#initialization-syntax-1)
  * [Class Reference](#class-reference)
  * [A `const` Instance of a `class`](#a-const-instance-of-a-class)
    * [Syntax](#syntax)
    * [Explanation](#explanation-1)
  * [A `constexpr` Instance of a `class`](#a-constexpr-instance-of-a-class)
    * [Syntax](#syntax-1)
    * [Explanation](#explanation-2)
  * [A `static` Instance of a `class`](#a-static-instance-of-a-class)
    * [Syntax](#syntax-2)
    * [Explanation](#explanation-3)
  * [Member Variables](#member-variables)
    * [Explanation](#explanation-4)
    * [Syntax](#syntax-3)
    * [`this`](#this)
      * [Syntax](#syntax-4)
      * [Explanation](#explanation-5)
    * [`const` Member Variables](#const-member-variables)
    * [`constexpr` Member Variables](#constexpr-member-variables)
    * [`static` Member Variables](#static-member-variables)
    * [`mutable` Member Variables](#mutable-member-variables)
      * [Syntax](#syntax-5)
      * [Explanation](#explanation-6)
    * [Pointer Member Variables](#pointer-member-variables)
      * [Syntax](#syntax-6)
      * [Explanation](#explanation-7)
    * [Reference Member Variables](#reference-member-variables)
      * [Syntax](#syntax-7)
      * [Explanation](#explanation-8)
  * [Methods](#methods)
    * [Syntax](#syntax-8)
    * [Explanation](#explanation-9)
    * [`static` Methods](#static-methods)
    * [`const` Methods](#const-methods)
    * [`constexpr` Methods](#constexpr-methods)
    * [`virtual` Methods](#virtual-methods)
    * [Pure `virtual` Methods](#pure-virtual-methods)
    * [`override` Methods](#override-methods)
      * [Syntax](#syntax-9)
      * [Explanation](#explanation-10)
      * [Notes](#notes)
  * [Constructors](#constructors)
      * [Syntax](#syntax-10)
      * [Explanation](#explanation-11)
      * [Characteristics](#characteristics)
    * [Defalut Constructors and `default` Constructors](#defalut-constructors-and-default-constructors)
      * [Syntax](#syntax-11)
      * [Explanation](#explanation-12)
    * [Parameterized Constructors](#parameterized-constructors)
      * [Syntax](#syntax-12)
      * [Explanation](#explanation-13)
    * [Constructor Initializer Lists](#constructor-initializer-lists)
      * [Syntax](#syntax-13)
      * [Explanation](#explanation-14)
      * [Notes](#notes-1)
    * [Copy Constructors](#copy-constructors)
      * [Explanation](#explanation-15)
      * [Default Copy ( `default` ) ( Avoid ) ( Double Destructions )](#default-copy--default---avoid---double-destructions-)
        * [Syntax](#syntax-14)
        * [Explanation](#explanation-16)
      * [Shallow Copy ( e.g. `memcpy` ) ( Avoid ) ( Double Destructions )](#shallow-copy--eg-memcpy---avoid---double-destructions-)
        * [Syntax](#syntax-15)
        * [Explanation](#explanation-17)
      * [Deep Copy ( Recommend )](#deep-copy--recommend-)
        * [Syntax](#syntax-16)
        * [Explanation](#explanation-18)
    * [Move Constructors](#move-constructors)
      * [Explanation](#explanation-19)
      * [Default Move Constructor](#default-move-constructor)
        * [Syntax](#syntax-17)
        * [Explanation](#explanation-20)
      * [Custom Move Constructor](#custom-move-constructor)
      * [Syntax](#syntax-18)
      * [Explanation](#explanation-21)
    * [Conversion Constructors](#conversion-constructors)
      * [Syntax](#syntax-19)
      * [Explanation](#explanation-22)
    * [`virtual` Constructors](#virtual-constructors)
    * [`explicit` Constructors](#explicit-constructors)
  * [Destructors](#destructors)
    * [Syntax](#syntax-20)
    * [Explanation](#explanation-23)
    * [Default Destructors](#default-destructors)
      * [Syntax](#syntax-21)
      * [Explanation](#explanation-24)
    * [`virtual` Destructors](#virtual-destructors)
  * [Operator Overloading](#operator-overloading)
    * [Explanation](#explanation-25)
    * [Move-assignment Operator](#move-assignment-operator)
      * [Syntax](#syntax-22)
      * [Explanation](#explanation-26)
      * [Characteristics](#characteristics-1)
    * [Copy-assignment Operator](#copy-assignment-operator)
      * [Syntax](#syntax-23)
      * [Explanation](#explanation-27)
      * [Characteristics](#characteristics-2)
    * [Conversion Operator](#conversion-operator)
      * [Syntax](#syntax-24)
      * [Explanation](#explanation-28)
      * [Characteristics](#characteristics-3)
    * [`explicit` Conversion Operator](#explicit-conversion-operator)
      * [Syntax](#syntax-25)
      * [Explanation](#explanation-29)
      * [Characteristics](#characteristics-4)
  * [The Difference Between Construction and Assignement](#the-difference-between-construction-and-assignement)
  * [Inheritance](#inheritance)
    * [Explanation](#explanation-30)
    * [Definition Syntax](#definition-syntax-1)
    * [Initialization Syntax](#initialization-syntax-2)
    * [Characteristics](#characteristics-5)
    * [`virtual` Inheritance](#virtual-inheritance)
      * [Explanation](#explanation-31)
      * [Definition Syntax](#definition-syntax-2)
      * [Initialization Syntax](#initialization-syntax-3)
      * [Characteristics](#characteristics-6)
  * [`virtual`](#virtual)
  * [Abstract Classes](#abstract-classes)
      * [Explanation](#explanation-32)
      * [Characteristics](#characteristics-7)
  * [`friend`](#friend)
      * [Explanation](#explanation-33)
      * [Characteristics](#characteristics-8)
    * [`friend` Functions](#friend-functions)
      * [Syntax](#syntax-26)
      * [Explanation](#explanation-34)
      * [Characteristics](#characteristics-9)
      * [Syntax](#syntax-27)
    * [`friend` Classes](#friend-classes)
      * [Explanation](#explanation-35)
      * [Characteristics](#characteristics-10)
  * [`final`](#final)
      * [Explanation](#explanation-36)
      * [Characteristics](#characteristics-11)
    * [`final` Functions](#final-functions)
      * [Syntax](#syntax-28)
      * [Explanation](#explanation-37)
      * [Characteristics](#characteristics-12)
      * [Syntax](#syntax-29)
    * [`final` Classes](#final-classes)
      * [Explanation](#explanation-38)
      * [Characteristics](#characteristics-13)
    * [(6) `using`](#6-using)
      * [Purpose](#purpose)
      * [Example](#example)
    * [(2) `virtual`](#2-virtual)
      * [Purpose](#purpose-1)
      * [Example](#example-1)
      * [Characteristics](#characteristics-14)
        * [Summary](#summary)
        * [Advantages](#advantages)
        * [Disadvantages](#disadvantages)
        * [Notes](#notes-2)
  * [The Difference Between Hiding, Overloading, Overriding, and Overwriting](#the-difference-between-hiding-overloading-overriding-and-overwriting)
    * [(1) Hiding (Name Hiding)](#1-hiding-name-hiding)
      * [Explanation](#explanation-39)
      * [Example](#example-2)
      * [How to Access Hidden Function](#how-to-access-hidden-function)
    * [(2) Overloading](#2-overloading)
      * [Explanation](#explanation-40)
      * [Example](#example-3)
    * [(3) Overriding](#3-overriding)
      * [Explanation](#explanation-41)
      * [Example](#example-4)
    * [(4) Overwriting (Not a C++ Term)](#4-overwriting-not-a-c-term)
      * [Explanation](#explanation-42)
      * [Example](#example-5)

<!-- vim-markdown-toc -->
## `class`

### Explanation

1. A class is **a user-defined type** that serves as a blueprint for creating objects. It
   **encapsulates data members (variables) and member functions (methods)** that operate on these
   data. A class provides a way to group related behaviors and attributes into a cohesive unit,
   promoting data abstraction and encapsulation.
2. A class helps enforce encapsulation by limiting access to internal details and exposing only the
   necessary functionalities, making code more modular, reusable, and easier to maintain.
3. An **empty object** occupy **at least one byte** memory. Creating an object on the stack is
   faster than on the heap.

### Visibility

0. Make code more readable, not affect the performance.
1. `private`( **default visibility** ): The owner class, friend class.
2. `protected`: The owner class, friend class, sub-class.
3. `public`: All.

### Declaration Syntax

```CPP
class ClassName;
```

### Definition Syntax

```CPP
class ClassName {
};
```

### Common Objects

#### Declaration Syntax

```CPP
ClassName obj_name;
```

#### Initialization Syntax

```CPP
ClassName obj_name; // Default Constructor
```

```CPP
ClassName obj_name( parameters ); // Parameterized Constructor
```

```CPP
ClassName obj_name1( parameters ); // Parameterized Constructor
ClassName obj_name2( obj_name1 ); // Copy Constructor
```

```CPP
// Not Recommend, although the compiler may optimize it so that only one constructor is called.
// First, Parameterized Constructor
// Second, Copy Constructor
ClassName obj_name = ClassName( parameters );
```

```CPP
ClassName obj_name1( parameters ); // Parameterized Constructor
ClassName obj_name2( std::move( obj_name1 ) ); // Move Constructor
```

```CPP
ClassName obj_name = initializer; // Conversion Construcotr, Implicit Conversion
```

```CPP
// Without related parameterized and all members are public, Aggregate Initialization
// With related parameterized, Parameterized Constructor or Uniform Initialization or Brace Initialization
ClassName obj_name{ parameters };
```

```CPP
// When defining a class, assigning default values to its members.
class ClassName {
   public:
      ...;

   protected:
      ...;

   private:
      Type _member1 = initializer1;
      ...;
};
```

```CPP
class ClassName {
   public:
      // Move Constructor Definition
      ...;

      // Factory Methods for Initialization
      static ClassName createClassName() {
         return std::move(
            ClassName( paramters ) );   // Parameterized Constructor
      }

      ...;

   protected:
      ...;

   private:
      ...;
};

// First, create a temporary object with the parameterized constructor in the createClassName.
// Second, create `obj_name` with the move constructor.
ClassName obj_name = createClassName();
```

### Class Pointers

#### Declaration Syntax

```CPP
ClassName* obj_ptr;
```

#### Initialization Syntax

```CPP
ClassName* obj_ptr = new ClassName; // Default Constructor
```

```CPP
ClassName* obj_ptr = new ClassName( parameters ); // Parameterized Constructor
```

```CPP
ClassName obj_name; // Default Constructor
ClassName* obj_ptr = &obj_name;
```

### Class Reference

```CPP
ClassName obj_name; // Default Constructor
ClassName& obj_ref = &obj_name;
```

### A `const` Instance of a `class`

#### Syntax

```CPP
const ClassName obj_ptr;
```

#### Explanation

1. A `const` instance **ensures** that none of its **non-mutable members can be modified** after
   initialization.
2. However, if a member is of **pointer** type, **the value or object** the pointer points to does
   **not belong to the class**. Only the **address** stored in the pointer **belongs to the class**.
   Therefore, a const instance **cannot ensure** that this **value or object remains unmodified**.
3. **Only const-qualified member functions can be called** on a `const` instance. These are
   functions that do not modify the object’s state.
4. A `const` instance can still **modify `mutable` members**.

### A `constexpr` Instance of a `class`

#### Syntax

```CPP
constexpr ClassName obj_ptr;
```

#### Explanation

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

### A `static` Instance of a `class`

#### Syntax

```CPP
static ClassName obj_ptr;
```

#### Explanation

1. A static instance of a class refers to **an object of the class** that has static storage
   duration.
2. It **persists** for the **entire duration** of the program (until the program terminates).
3. It is **initialized only once**, **the first time** its definition or block **is executed**.
4. It can be scoped to a function, class, or namespace, depending on where it is declared.
5. In fact, it's **a static variable**, a static local variable or a static global variable.

### Member Variables

#### Explanation

1. Member variables, also known as **instance variables or fields**, are **attributes of a class**
   that hold data specific to the instances (objects) of that class. They define the state of an
   object.
2. Member variables **can be assigned default values** **when** they are **defined**.

#### Syntax

```CPP
class ClassName {
   private:
      Type _member;   // Declaration or Definition of a member variable
};
```

#### `this`

##### Syntax

```CPP
this->_member;
```

##### Explanation

1. `this` is **a pointer available** within a class's member function that points to the object that
   invoked the member function. It allows access to the calling object's members.
2. `this` is **implicitly passed** to all **non-static** member **functions**.
3. It can be useful for **disambiguation** when member variables and parameters have the same name.
4. It is **not available in static member functions** as there is no associated object.

#### `const` Member Variables

#### `constexpr` Member Variables

#### `static` Member Variables

#### `mutable` Member Variables

##### Syntax

```CPP
class ClassName {
   private:
      mutable Type _member;   // Declaration or Definition of a member variable
};
```

##### Explanation

1. `mutable` member variables **can be modified** even in **const member functions**. This allows
   certain aspects of an object to change while keeping its overall state constant.
2. Generally, they are used **for caching or lazy evaluation purposes**.
3. They **break the const-correctness** for that particular member variable.

#### Pointer Member Variables

##### Syntax

```CPP
class ClassName {
   private:
      Type* _member_ptr;   // Declaration or Definition of a member pointer
};
```

##### Explanation

1. Pointer member variables **hold memory addresses** of instances or other data types. They allow
   **dynamic memory management and manipulation** of resources.

#### Reference Member Variables

##### Syntax

```CPP
class ClassName {
   public:
      // Initialization through constructor
      explicit ClassName( Type& ref ): _memberRef( ref ) {}

   private:
      Type _member;
      // In-Class Initialization
      Type& _memberRef = _member;
};
```

##### Explanation

1. Reference member variables are **alternatives to pointers** that **refer to existing objects**.
   They **cannot be reassigned** once established.
2. Theyt must be **initialized when defined** and **cannot be null**.
3. There are only two way to initialize a const reference:
   - **In-Class Initialization**: It can be **overridden** by the constructor.
   - **Constructor Initialization**.

### Methods

#### Syntax

```CPP
// Declared and defined inside the class
class ClassName {
   public:
      ReturnType functionName( parameters ) { ... };
};
```

```CPP
// declared inside the class
class ClassName {
   public:
      ReturnType functionName( parameters ) { ... };
};

// Defined outside the class
ReturnType ClassName::functionName( parameters ) { ... };
```

#### Explanation

1. A method in C++ is **a function** that belongs to a class or struct. It is used to perform
   operations or manipulate the data members (attributes) of that class. Methods encapsulate
   behavior specific to an object of the class.
2. Methods **can be overloaded** by defining multiple versions with different parameter types.
3. Methods **defined inside** the class are **automatically considered inline**, improving
   performance by reducing function call overhead.

#### `static` Methods

#### `const` Methods

#### `constexpr` Methods

#### `virtual` Methods

#### Pure `virtual` Methods

#### `override` Methods

##### Syntax

```CPP
class BaseClassName {
   public:
      virtual ReturnType functionName( parameters ){
         // Virtual method in base class
      };
};

class DerivedClassName: public BaseClassName {
   public:
      ReturnType functionName( parameters ) override{
         // Override the base class method
      };
};
```

##### Explanation

1. `override` is **a keyword** used to **explicitly** indicate that a method in a derived class is
   meant to **override a virtual method** in the base class.
2. It **ensures** that the **method signature** in the derived class **matches** a virtual method in
   the base class. If the method signature does **not match**, the compiler will generate an
   **error**, which helps **prevent subtle bugs** caused by accidental method hiding.

##### Notes

1. You should **always use the override keyword when overriding functions** in a derived class, as
   it helps prevent errors.

### Constructors

##### Syntax

```CPP
class ClassName {
   public:
      ClassName( parameters ){
      };
};
```

##### Explanation

1. Constructors are **special member functions** of a class that are **automatically called when an
   object** of that class is **created**. They are used to **initialize** the object's properties
   and **set up** any necessary resources.

##### Characteristics

#### Defalut Constructors and `default` Constructors

##### Syntax

```CPP
class ClassName {
   public:
      // If no other constructors are defined,
      // this default constructor is provided by the compiler.
      ClassName(){ };
};
```

```CPP
class ClassName {
   public:
      // Default Constructor
      ClassName(){ ... };
};
```

```CPP
class ClassName {
   public:
      // Default Constructor
      ClassName() = default;
      // Default Constructor
      // Parameterized Constructor
      ClassName( parameters with default values ){
      };
};
```

##### Explanation

1. A default constructor is **a constructor** with **no parameters** or with **all parameters having
   default values**.
2. It is **called** when an object is **instantiated without any arguments**. It initializes data
   members to their default values (**primitive types remain uninitialized**).
3. If **no other constructors** are defined, the **compiler provides** a default constructor.
4. The `= default` syntax **explicitly requests** the compiler to generate **the default
   constructor**.

#### Parameterized Constructors

##### Syntax

```CPP
class ClassName {
   public:
      // Parameterized Constructor
      ClassName( parameters ){
      };
};
```

##### Explanation

1. A parameterized constructor is a type of **constructor** in a class that allows you to
   **initialize an object with specific values** upon creation.
2. Unlike a default constructor (which takes no arguments), a parameterized constructor **accepts
   one or more arguments** that enable you to set the initial state of an object with specific
   values.
3. It is **called** when an object is **instantiated with specific arguments**.

#### Constructor Initializer Lists

##### Syntax

```CPP
class ClassName {
   public:
      ClassName( Type1 para1, Type2 para2, ... ):
         _member1( para1 ), _member2( para2 ){};

   private:
      Type1 _member1;
      Type2 _member2;
};
```

##### Explanation

1. Constructor initializer lists are used to **initialize member variables** of a class in the
   constructor's initialization phase before the body of the constructor executes.
2. Member variables are **initialized in the order they are declared** in the class, **not the order
   they appear in the initializer list**.
3. Using initializer lists can be more **efficient**, as it allows **direct initialization** of the
   member variables, **avoiding unnecessary default construction** followed by assignment.
4. An initializer list is **required** to **initialize const and reference members**, as they cannot
   be assigned after construction.
5. If members are initialized in the constructor's **body**, those members are first
   default-initialized before being assigned, which can lead to **additional overhead** compared to
   direct initialization in the initializer list.

##### Notes

1. In the constructor initializer list, you'd better initialize the members in the order in which
   they are defined in the class. If a class has **a class or struct member**, we should **use the
   constructor initializer** to initialize the class or struct member; **otherwise**, the
   initialization will call the object's constructors **twice**: first the default constructor, and
   then the other constructor.

#### Copy Constructors

##### Explanation

1. A copy constructor is **a special constructor** that **initializes a new object as a copy of an
   existing object**. This is essential for managing resource ownership and ensuring that objects
   behave properly when passed, returned, or assigned.

##### Default Copy ( `default` ) ( Avoid ) ( Double Destructions )

###### Syntax

```CPP
class ClassName {
   public:
      // Compiler-generated default copy constructor
};
```

```CPP
class ClassName {
   public:
      // Default Copy Constructor
      ClassName( const ClassName& ) = default;
};
```

###### Explanation

1. A default copy constructor is **automatically generated** by the compiler if **no user-defined
   copy constructor** is present. It performs **a shallow copy** of the object's members.
2. For primitive types, this is a straightforward copy, but **for pointer members**, both the
   original and copied objects will **reference the same memory**.
3. This can lead to issues such as:
   - **Double destructions**: When **both objects** are **destroyed**, they attempt to **free the
     same memory location**, resulting in **undefined behavior**.
   - **Dangling pointers**: When **one object** is **deleted**, the other **retains a pointer to the
     deallocated memory**, leading to **program crashes if accessed**.
4. The copy is **performed quickly** since it merely copies the pointer (for pointer types) rather
   than the pointed-to values.
5. The default copy constructor is **typically marked as noexcept**, improving performance by
   ensuring compatibility with standard containers, such as `std::vector`.
6. The `= default` syntax **explicitly requests** the compiler to generate the **default copy
   constructor**.

##### Shallow Copy ( e.g. `memcpy` ) ( Avoid ) ( Double Destructions )

###### Syntax

```CPP
class ClassName {
   public:
      Type* _mem_ptr;

      // Shallow Copy Constructor
      ClassName( const ClassName& other ) {
         _mem_ptr = other._mem_ptr;
         ...
      };

      // Destructor
      ~ClassName() {
         // Free allocated memory; Error, double destruction
         delete _mem_ptr;
         ...
      };
};
```

###### Explanation

1. A shallow copy occurs when the copy constructor **simply copies the pointer values** instead of
   the data they point to. This can lead to **multiple instances** trying to **manage the same
   resource**.
2. This can lead to issues such as:
   - **Double destructions**: When **both objects** are **destroyed**, they attempt to **free the
     same memory location**, resulting in **undefined behavior**.
   - **Dangling pointers**: When **one object** is **deleted**, the other **retains a pointer to the
     deallocated memory**, leading to **program crashes if accessed**.
3. The copy is **performed quickly** since it merely copies the pointer (for pointer types) rather
   than the pointed-to values.

##### Deep Copy ( Recommend )

###### Syntax

```CPP
class ClassName {
   public:
      Type* _mem_ptr;

      // Deep Copy Constructor
      ClassName( const ClassName& other ) {
         _mem_ptr = new Type( *other._mem_ptr );
         ...
      };

      // Destructor
      ~ClassName() {
         // Free allocated memory;
         delete _mem_ptr;
         ...
      };

```

###### Explanation

1. A deep copy **ensures** that the copy constructor **creates a new instance** of any dynamically
   allocated memory, so that two objects do **not reference the same location**.
2. This **prevents** **double deletion** and **dangling pointer** issues, as each object manages its
   own memory independently.
3. Although **slower than shallow copying** due to memory allocation, deep copying is generally much
   **safer**, particularly for complex data structures.
4. When implementing a copy constructor, it is also **recommended** to **implement a corresponding
   copy assignment operator** to maintain consistent behavior and proper resource management.

#### Move Constructors

##### Explanation

1. A move constructor is a **constructor** that **transfers resources from one object to another**,
   rather than performing a deep copy. This enables **efficient** handling of temporary objects and
   **avoids unnecessary data copying**.
2. It is **ideal for rvalue references**, which represent temporary objects that do not need to
   retain their original state.
3. Move constructors **should be marked noexcept** to ensure **compatibility** with standard
   containers and to optimize **performance**.

##### Default Move Constructor

###### Syntax

```CPP
class ClassName {
   public:
      // Default Move Constructor
      ClassName( ClassName&& ) = default;
};
```

###### Explanation

1. The compiler **generates a default move constructor** only if:
   - The class does **not explicitly define a copy constructor, copy assignment operator, move
     constructor, or move assignment operator**.
   - **All** data members and base classes **are movable** (i.e., they also support move semantics).
2. The default move constructor **performs a shallow move**, transferring (not copying) each member
   from the source object to the destination. However, it treats all members as if they were
   primitive types, **performing a shallow transfer without resetting any pointer members of the
   original object to nullptr**. This can cause issues such as **double deletions and dangling
   pointers**.
3. While terms like "shallow move" and "deep move" are **not part of standard C++ terminology**,
   "unsafe copy" and "safe copy" better convey the risks and benefits of different copying
   strategies.
4. The default move constructor is **typically marked as noexcept**, improving performance by
   ensuring compatibility with standard containers, such as `std::vector`.
5. The `= default` syntax **explicitly requests** the compiler to generate the **default move
   constructor**.

##### Custom Move Constructor

##### Syntax

```CPP
class ClassName {
   public:
      Type* _mem_ptr;

      // Custom Move Constructor
      ClassName( ClassName&& other ) : _mem_ptr( std::move( other._mem_ptr ) {
         // Deep Move; Safe Move.
         other._mem_ptr = nullptr;
         ...
      };

      // Destructor
      ~ClassName() {
         // Free allocated memory;
         delete _mem_ptr;  // Leave 'other' in a valid state
         ...
      };
};
```

##### Explanation

1. A custom move constructor is **defined** when:
   - A class manages resources that **require special handling** (e.g., dynamic memory, file
     handles).
   - You need to **reset the original object to a valid state** (e.g., **nullptr**) after
     transferring ownership.
2. Move constructors **should be marked noexcept** to ensure **compatibility** with standard
   containers and to optimize **performance**. containers like `std::vector`.

#### Conversion Constructors

##### Syntax

```CPP
class ClassName {
   public:
      // Conversion constructor
      ClassName( Type parameter );
};
```

##### Explanation

1. A conversion constructor allows **implicit ( should avoid it with the `explicit` keyword)** or
   **explicit conversion** from a given type to the class type.
2. It takes **a single parameter** of a different type and **initializes an object** of the class
   with it.
3. These constructors **facilitate the integration of custom classes** with existing code by
   allowing automatic type conversion where appropriate.
4. When the target class holds additional information, conversion constructors ensure that
   initialization aligns with the class's intended use.

#### `virtual` Constructors

#### `explicit` Constructors

### Destructors

#### Syntax

```CPP
class ClassName {
   public:
      ~ClassName() {
      };   // Destructor
};
```

#### Explanation

1. A destructor is **a special member function** that is **automatically called** when an object
   **goes out of scope** or is **explicitly deleted**. Its primary purpose is to **release
   resources** (such as dynamically allocated memory or file handles) associated with the object.
2. If a class has **base classes** or member objects, their destructors are **called in reverse
   order of construction**.

#### Default Destructors

##### Syntax

```CPP
class ClassName {
   public:
      ~ClassName() = default;   // Default destructor
};
```

##### Explanation

1. A default destructor is **automatically generated** by the compiler if the class does **not
   explicitly define one**. It handles destruction according to the rules of the language, ensuring
   that all member variables and base classes are properly destroyed.
2. If the class **directly manages resources** (e.g., raw pointers), **a custom destructor** is
   **necessary** to **avoid resource leaks**.
3. The default destructor is **typically marked as noexcept**, improving performance by ensuring
   compatibility with standard containers, such as `std::vector`.
4. The `= default` syntax **explicitly requests** the compiler to generate the **default
   destructor**.

#### `virtual` Destructors

### Operator Overloading

#### Explanation

#### Move-assignment Operator

##### Syntax

##### Explanation

##### Characteristics

#### Copy-assignment Operator

##### Syntax

##### Explanation

##### Characteristics

#### Conversion Operator

##### Syntax

##### Explanation

##### Characteristics

#### `explicit` Conversion Operator

##### Syntax

##### Explanation

##### Characteristics

### The Difference Between Construction and Assignement

### Inheritance

#### Explanation

#### Definition Syntax

#### Initialization Syntax

#### Characteristics

#### `virtual` Inheritance

##### Explanation

##### Definition Syntax

##### Initialization Syntax

##### Characteristics

### `virtual`

### Abstract Classes

##### Explanation

##### Characteristics

### `friend`

##### Explanation

##### Characteristics

#### `friend` Functions

##### Syntax

##### Explanation

##### Characteristics

##### Syntax

#### `friend` Classes

##### Explanation

##### Characteristics

### `final`

##### Explanation

##### Characteristics

#### `final` Functions

##### Syntax

##### Explanation

##### Characteristics

##### Syntax

#### `final` Classes

##### Explanation

##### Characteristics

#### (6) `using`

##### Purpose

1. Brings a base class's function into the derived class's scope, especially useful for overloaded
   functions.

##### Example

```CPP
class Base {
   public:
      void show() { std::cout << "Base show" << std::endl; }

      void show( int i ) {
         std::cout << "Base show with int: " << i << std::endl;
      }
};

class Derived: public Base {
   public:
      using Base::show;   // Bring Base::show into scope

      void show( double d ) {   // Overload in Derived
         std::cout << "Derived show with double: " << d << std::endl;
      }
};

int main() {
   Derived d;
   d.show();         // Calls Base::show()
   d.show( 10 );     // Calls Base::show(int)
   d.show( 10.5 );   // Calls Derived::show(double)
}
```

#### (2) `virtual`

##### Purpose

1. Allows a member function in a base class to be overridden in derived classes, enabling
   **polymorphism**.

##### Example

```CPP
class Base {
   public:
      virtual void show() {   // Virtual function
         std::cout << "Base class show function called." << std::endl;
      }
};

class Derived: public Base {
   public:
      void show() override {   // Override base class function
         std::cout << "Derived class show function called." << std::endl;
      }
};

int main() {
   Base* b = new Derived();
   b->show();   // Calls Derived's show()
   delete b;
}
```

##### Characteristics

###### Summary

1. **Dynamic** binding: Virtual functions enable dynamic (or late) binding, meaning the function
   that gets called is determined at **runtime** based on the type of the object being referenced,
   not the type of the pointer/reference.
2. Base class declaration: To declare a function as virtual, you use the virtual keyword in the base
   class.
3. Overriding in derived classes: Derived classes can override virtual functions to provide their
   specific implementations.
4. **Base class pointers**: You can use a base class pointer to point to derived class objects. When
   you call a virtual function through the base class pointer, the derived class's version of the
   function is invoked.
5. Destructor: If a class contains **virtual functions**, it is a good practice to declare its
   **destructor as virtual**. This ensures that the derived class's destructor is called when an
   object is deleted through a base class pointer, preventing resource leaks.
6. Performance: Virtual functions introduce **a slight performance overhead** due to dynamic
   dispatch, as the program must look up the correct function to call at runtime. This is generally
   acceptable in exchange for the flexibility they provide.
7. Pure virtual functions: You can declare a virtual function as pure virtual by using `= 0`. This
   makes the **class abstract**, meaning it cannot be instantiated directly.

###### Advantages

1. **Polymorphism**: Virtual functions enable polymorphic behavior, allowing a program to treat
   objects of different derived classes through a base class pointer or reference. This makes it
   easier to write flexible and reusable code.
2. **Dynamic** binding: They provide dynamic (or late) binding, where the method that gets executed
   is determined at runtime based on the actual object type, rather than the type of
   reference/pointer. This allows for more dynamic and adaptable code structures.
3. Extensibility: Virtual functions make it easier to extend code. New derived classes can be added
   with their implementations of virtual functions without modifying existing code.
4. Interface Design: They allow the design of interfaces through abstract classes, promoting better
   software design practices. This encourages the implementation of consistent interfaces across
   different derived classes.
5. Improved code organization: By using virtual functions, you can organize your code better,
   separating interface from implementation and promoting code clarity and maintenance.

###### Disadvantages

1. Performance overhead: Virtual functions introduce **a performance penalty** due to the dynamic
   dispatch mechanism. The program must go through the **V table** to look up the correct function
   to call at runtime, which can be slower than static binding.
2. **Memory overhead**: Each class that uses virtual functions typically includes **a virtual table
   (vtable)**, which adds some memory overhead. Each object of such classes contains a pointer to
   the vtable, increasing the size of the object.
3. Complexity: The use of virtual functions can increase the complexity of code, particularly for
   developers who are not familiar with object-oriented principles. Understanding how virtual
   functions work is crucial to avoid pitfalls like object slicing.
4. **Debugging Challenges**: Debugging issues related to virtual functions can be more challenging,
   especially when it comes to understanding the flow of execution and object lifetimes in the
   presence of polymorphism.
5. Potential for Resource Leaks: If a base class has virtual functions, its destructor should also
   be virtual to ensure proper cleanup of derived class resources. Failing to declare a virtual
   destructor can lead to resource leaks.

###### Notes

1. In cases where performance is very important, you should avoid using virtual functions as much as
   possible.

### The Difference Between Hiding, Overloading, Overriding, and Overwriting

#### (1) Hiding (Name Hiding)

##### Explanation

1. Hiding occurs when **a derived class** declares a function (or variable) with **the same name**
   as a function (or variable) in **the base class**, regardless of the parameters. The base class
   function is hidden in the derived class scope, even if the signatures (parameter types) differ.
   This can lead to confusion or errors because the base class function is no longer accessible
   directly from the derived class.

##### Example

```CPP
class Base {
   public:
      void show() { std::cout << "Base class show" << std::endl; }
};

class Derived: public Base {
   public:
      void show( int x ) {
         std::cout << "Derived class show with a value " << x << std::endl;
      }
};

int main() {
   Derived d;
   d.show();   // Error: Base::show() is hidden by Derived::show(int)
}
```

##### How to Access Hidden Function

```CPP
   d.Base::show();   // Calls Base class show()
```

#### (2) Overloading

##### Explanation

1. Overloading occurs when **two or more functions** in **the same scope** have **the same name**
   but **different parameter types or numbers of parameters**. Additionally, **a normal function and
   a const function** can be considered overloaded. However, **the return type does not** play a
   role in distinguishing overloaded functions; you cannot overload functions solely based on
   different return types. Overloading is resolved at compile time (static polymorphism). C++ allows
   overloading based on the number of arguments, their types, or both.

##### Example

```CPP
class Example {
   public:
      void func( int x ) {
         std::cout << "Function with int: " << x << std::endl;
      }

      void func( double x ) {
         std::cout << "Function with double: " << x << std::endl;
      }

      void func( int x, double y ) {
         std::cout << "Function with int and double: " << x << ", " << y
                   << std::endl;
      }
};
```

#### (3) Overriding

##### Explanation

1. Overriding occurs when **a derived class** provides **its own implementation** of **a virtual
   function ( or a pure virtual function )** that is **already defined** in the base class. The
   function in the derived class must have **the same signature** as the base class's virtual
   function. Overriding is resolved at runtime (dynamic polymorphism).

##### Example

```CPP
class Base {
   public:
      virtual void show() { std::cout << "Base class show" << std::endl; }
};

class Derived: public Base {
   public:
      void show() override {   // This function overrides Base::show
         std::cout << "Derived class show" << std::endl;
      }
};

int main() {
   Base* obj = new Derived();
   obj->show();   // Calls Derived class show (runtime polymorphism)
}
```

#### (4) Overwriting (Not a C++ Term)

##### Explanation

1. Overwriting is **not a formal term in C++**. However, it is sometimes colloquially used to
   describe a situation where **a function or variable in a derived class replaces or redefines a
   function or variable from a base class**. This serves as a general description rather than a
   specific C++ concept. Additionally, the term "overwriting" typically refers to the process of
   **replacing an existing value in memory**, which includes assigning a new value to an existing
   variable to replace the old value and writing data to unintended memory locations, often
   resulting in undefined behavior or memory corruption. This can occur in various contexts, such as
   variables, function definitions, or data structures.

##### Example

```CPP
class Base {
   public:
      int _x = 10;
};

class Derived: public Base {
   public:
      int _x = 20;   // Overwrites Base::x
};
```

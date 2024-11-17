<!-- vim-markdown-toc GFM -->

- [Classes (`class`)](#classes-class)
  - [Explanation](#explanation)
  - [Visibility](#visibility)
  - [Declaration Syntax](#declaration-syntax)
  - [Definition Syntax](#definition-syntax)
  - [Common Objects](#common-objects)
    - [Declaration Syntax](#declaration-syntax-1)
    - [Initialization Syntax](#initialization-syntax)
    - [Limitations of Aggregate Initialization](#limitations-of-aggregate-initialization)
  - [Class Pointers](#class-pointers)
    - [Declaration Syntax](#declaration-syntax-2)
    - [Definition or Initialization Syntax](#definition-or-initialization-syntax)
  - [Class References](#class-references)
  - [`const` Instance of Classes](#const-instance-of-classes)
  - [`constexpr` Instances of Classes](#constexpr-instances-of-classes)
  - [`static` Instances of Classes](#static-instances-of-classes)
  - [Anonymous Classes](#anonymous-classes)
    - [Explanation](#explanation-1)
    - [Syntax](#syntax)
  - [Member Variables](#member-variables)
    - [Explanation](#explanation-2)
    - [Syntax](#syntax-1)
    - [`this`](#this)
      - [Explanation](#explanation-3)
      - [Syntax](#syntax-2)
    - [`const` Member Variables](#const-member-variables)
    - [`constexpr` Member Variables](#constexpr-member-variables)
    - [`static` Member Variables](#static-member-variables)
    - [`mutable` Member Variables](#mutable-member-variables)
      - [Explanation](#explanation-4)
      - [Syntax](#syntax-3)
    - [Pointer Member Variables](#pointer-member-variables)
      - [Explanation](#explanation-5)
      - [Syntax](#syntax-4)
    - [Reference Member Variables](#reference-member-variables)
      - [Explanation](#explanation-6)
      - [Syntax](#syntax-5)
  - [Methods](#methods)
    - [Explanation](#explanation-7)
    - [Syntax](#syntax-6)
    - [`const` Methods (`const` Member Functions)](#const-methods-const-member-functions)
    - [`constexpr` Methods (`constexprt` Member Functions)](#constexpr-methods-constexprt-member-functions)
    - [`static` Methods (`static` Member Functions)](#static-methods-static-member-functions)
    - [`virtual` Methods (`virtual` Functions) (`virtual` Memeber Functions)](#virtual-methods-virtual-functions-virtual-memeber-functions)
    - [Pure `virtual` Functions and Abstract Class](#pure-virtual-functions-and-abstract-class)
    - [`override` Methods](#override-methods)
      - [Explanation](#explanation-8)
      - [Syntax](#syntax-7)
      - [Notes](#notes)
  - [Constructors](#constructors)
      - [Explanation](#explanation-9)
      - [Syntax](#syntax-8)
    - [Defalut Constructors and `default` Constructors](#defalut-constructors-and-default-constructors)
      - [Explanation](#explanation-10)
      - [Syntax](#syntax-9)
    - [Parameterized Constructors](#parameterized-constructors)
      - [Explanation](#explanation-11)
      - [Syntax](#syntax-10)
    - [Constructor Initializer Lists](#constructor-initializer-lists)
      - [Explanation](#explanation-12)
      - [Syntax](#syntax-11)
      - [Notes](#notes-1)
    - [Copy Constructors](#copy-constructors)
      - [Explanation](#explanation-13)
      - [Default Copy (`default`) (Avoid) (Double Destructions)](#default-copy-default-avoid-double-destructions)
        - [Explanation](#explanation-14)
        - [Syntax](#syntax-12)
      - [Shallow Copy (e.g. `memcpy`) (Avoid) (Double Destructions)](#shallow-copy-eg-memcpy-avoid-double-destructions)
        - [Explanation](#explanation-15)
        - [Syntax](#syntax-13)
      - [Deep Copy (Recommend)](#deep-copy-recommend)
        - [Explanation](#explanation-16)
        - [Syntax](#syntax-14)
    - [Move Constructors](#move-constructors)
      - [Explanation](#explanation-17)
      - [Default Move Constructors](#default-move-constructors)
        - [Explanation](#explanation-18)
        - [Syntax](#syntax-15)
      - [Custom Move Constructor](#custom-move-constructor)
        - [Explanation](#explanation-19)
        - [Syntax](#syntax-16)
    - [Conversion Constructors](#conversion-constructors)
      - [Explanation](#explanation-20)
      - [Syntax](#syntax-17)
    - [`virtual` Constructors](#virtual-constructors)
    - [`explicit` Constructors](#explicit-constructors)
  - [Destructors](#destructors)
    - [Explanation](#explanation-21)
    - [Syntax](#syntax-18)
    - [Default Destructors](#default-destructors)
      - [Explanation](#explanation-22)
      - [Syntax](#syntax-19)
    - [`virtual` Destructors](#virtual-destructors)
  - [Operator Overloading](#operator-overloading)
    - [Copy-assignment Operator](#copy-assignment-operator)
    - [Move-assignment Operator](#move-assignment-operator)
    - [Conversion Operator](#conversion-operator)
    - [`explicit` Conversion Operator](#explicit-conversion-operator)
  - [How to Determine Which Constructor or Assignment Operator Is Invoked](#how-to-determine-which-constructor-or-assignment-operator-is-invoked)
  - [Inheritance](#inheritance)
    - [Explanation](#explanation-23)
    - [Definition Syntax](#definition-syntax-1)
      - [Code](#code)
      - [Categories](#categories)
    - [Initialization Syntax](#initialization-syntax-1)
      - [Code](#code-1)
      - [Explanation](#explanation-24)
    - [Construction Order](#construction-order)
    - [Destruction Order](#destruction-order)
    - [`virtual` Inheritance](#virtual-inheritance)
  - [`virtual`](#virtual)
      - [Explanation](#explanation-25)
    - [`virtual` Methods (`virtual` Functions) (`virtual` Memeber Functions)](#virtual-methods-virtual-functions-virtual-memeber-functions-1)
      - [Explanation](#explanation-26)
      - [Syntax](#syntax-20)
      - [Static Binding and Dynamic Binding](#static-binding-and-dynamic-binding)
      - [Polymorphism and Problems](#polymorphism-and-problems)
      - [Notes](#notes-2)
    - [Pure `virtual` Functions and Abstract Class](#pure-virtual-functions-and-abstract-class-1)
      - [Explanation](#explanation-27)
      - [Syntax](#syntax-21)
    - [`virtual` Destructors](#virtual-destructors-1)
      - [Explanation](#explanation-28)
      - [Syntax](#syntax-22)
      - [Notes](#notes-3)
    - [`virtual` Inheritance](#virtual-inheritance-1)
      - [Explanation](#explanation-29)
      - [Definition Syntax](#definition-syntax-2)
      - [Initialization Syntax](#initialization-syntax-2)
    - [Construction Order](#construction-order-1)
    - [Destruction Order](#destruction-order-1)
  - [`friend`](#friend)
      - [Explanation](#explanation-30)
    - [`friend` Functions](#friend-functions)
      - [Explanation](#explanation-31)
      - [Syntax](#syntax-23)
    - [`friend` Classes](#friend-classes)
      - [Explanation](#explanation-32)
      - [Syntax](#syntax-24)
  - [`final`](#final)
      - [Explanation](#explanation-33)
    - [`final` Functions](#final-functions)
      - [Explanation](#explanation-34)
      - [Syntax](#syntax-25)
    - [`final` Classes](#final-classes)
      - [Explanation](#explanation-35)
      - [Syntax](#syntax-26)
  - [`explicit`](#explicit)
  - [`using`](#using)
  - [Hiding, Overloading, Overriding, and Overwriting](#hiding-overloading-overriding-and-overwriting)
  - [Notes](#notes-4)

<!-- vim-markdown-toc -->

## Classes (`class`)

### Explanation

1. A class is **a user-defined type** that serves as a blueprint for creating objects.
2. It **encapsulates data members (variables) and member functions (methods)** that operate on these
   data.
3. A class provides a way to group related behaviors and attributes into a cohesive unit, promoting
   data abstraction and encapsulation.
4. A class helps enforce encapsulation by limiting access to internal details and exposing only the
   necessary functionalities, **making code more modular, reusable**, and **easier to maintain**.
5. An **empty object** occupy **at least one byte** memory. Creating an object on the stack is
   faster than on the heap.
6. **Structures( Stored as the class ) + Functions( Stored outside of the class ) = Classes**.

### Visibility

1. The visibility makes code more readable, **not affect the performance**.
2. `private`( **default visibility** ): The owner class, friend class.
3. `protected`: The owner class, friend class, sub-class.
4. `public`: All.

### Declaration Syntax

```CPP
class ClassName;
```

### Definition Syntax

```CPP
class ClassName {
   ...;
};
```

### Common Objects

#### Declaration Syntax

```CPP
ClassName obj_name;
```

#### Initialization Syntax

```CPP
// Default constructor.
ClassName obj_name;
```

```CPP
// Parameterized constructor.
ClassName obj_name( para_list );
```

```CPP
// Parameterized constructor.
ClassName obj_name1( para_list );
// Copy constructor.
ClassName obj_name2( obj_name1 );
```

```CPP
// Not recommend, although the compiler may optimize it so that only one constructor is called.
// First, parameterized constructor.
// Second, copy constructor.
ClassName obj_name = ClassName( para_list );
```

```CPP
// Parameterized constructor.
ClassName obj_name1( para_list );
// Move constructor.
ClassName obj_name2( std::move( obj_name1 ) );
```

```CPP
// Parameterized constructor.
ClassName obj_name1( para_list );
// Move constructor.
ClassName obj_name2 = std::move( obj_name1 );
```

```CPP
// Conversion construcotr, implicit conversion.
ClassName obj_name = initializer;
```

```CPP
// Without related parameterized constructors and all members are public, aggregate initialization.
// With related parameterized constructors, parameterized constructor or uniform initialization or brace initialization.
ClassName obj_name{ para_list };
```

```CPP
// With default construcotr, default constructor.
// Otherwise, aggregate initialization.
// All members are initialized to 0.
ClassName obj_name{ };
```

```CPP
// Aggregate initialization.
ClassName obj_name = { para_list };
```

```CPP
// When defining a class, assigning default values to its members.
class ClassName {
   private:
      Type _mem1 = initializer1;
      ...;
};
```

```CPP
class ClassName {
   public:
      // Move constructor definition.
      ...;

      // Factory methods for initialization.
      static ClassName createClassName() {
         return std::move(
            ClassName( para_list );   // Parameterized constructor.
      };

      ...;
};

// First, create a temporary object with the parameterized constructor in the createClassName.
// Second, create `obj_name` with the move constructor.
ClassName obj_name = ClassName::createClassName();
```

#### Limitations of Aggregate Initialization

1. **No user-defined constructors**: Aggregate initialization is only applicable to aggregate types
   that lack user-defined constructors. If a class has any constructor defined, aggregate
   initialization cannot be used.
2. **Public members only**: Only public members can be initialized via aggregate initialization.
   Private or protected members cannot be accessed.
3. **No default member initializers**: Default member initializers in aggregates are ignored during
   aggregate initialization, meaning you must explicitly specify values for all members.
4. **Order of initialization**: Members are initialized in the order they are declared. This can
   lead to issues if one member relies on another being initialized first.
5. **No designated initializers**: C++ does not support designated initializers (as in C99),
   preventing the ability to initialize specific members without initializing all preceding members.
6. **Type matching**: The types in the initializer list must match the types of the aggregate's
   members exactly. A mismatch results in a compilation error.
7. **No implicit conversions**: Aggregate initialization does not allow implicit type conversions,
   which can limit flexibility.
8. **No inheritance**: Aggregate initialization is not applicable for derived classes, limiting its
   use in inheritance scenarios.

### Class Pointers

#### Declaration Syntax

```CPP
ClassName* obj_ptr;
```

#### Definition or Initialization Syntax

```CPP
// Default constructor.
ClassName* obj_ptr = new ClassName;
```

```CPP
// Parameterized constructor.
ClassName* obj_ptr = new ClassName( para_list );
```

```CPP
// Default constructor.
ClassName obj_name;
ClassName* obj_ptr = &obj_name;
```

### Class References

```CPP
// Default constructor.
ClassName obj_name;
ClassName& obj_ref = &obj_name;
```

### `const` Instance of Classes

1. [`const` Instance of Classes](./ConstConstexprAndStatic.md#const-instances-of-classes)

### `constexpr` Instances of Classes

1. [`constexpr` Instances of Classes](./ConstConstexprAndStatic.md#constexpr-instances-of-classes)

### `static` Instances of Classes

1. [`static` Instances of Classes](./ConstConstexprAndStatic.md#static-instances-of-classes)

### Anonymous Classes

#### Explanation

1. An anonymous class (also known as an **unnamed class**) is **a class** that is **defined inline
   without a name**.
2. These classes are typically used for **creating objects on the fly** or **as part of data
   structures** without the need to define a separate named class

#### Syntax

```CPP
class {
  ...;
} obj_name;
```

```CPP
union {
      class {
            ...;
      };
      ...;
};
```

```CPP
// In this case, members should all be public.
class {
  ...;
} obj_name{ para_list };
```

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
      Type _mem;   // Declaration or definition of a member variable.
};
```

#### `this`

##### Explanation

1. `this` is **a pointer available** within a class's member function that points to the object that
   invoked the member function. It allows access to the calling object's members.
2. `this` is **implicitly passed** to all **non-static** member **functions**.
3. It can be useful for **disambiguation** when member variables and parameters have the same name.
4. It is **not available in `static` member functions** as there is no associated object.

##### Syntax

```CPP
this->_mem;
// (*this)._mem;
```

#### `const` Member Variables

1. [`const` Member Variables](./ConstConstexprAndStatic.md#const-member-variables)

#### `constexpr` Member Variables

1. [`constexpr` Member Variables](./ConstConstexprAndStatic.md#constexpr-member-variables)

#### `static` Member Variables

1. [`static` Member Variables](./ConstConstexprAndStatic.md#static-member-variables)

#### `mutable` Member Variables

##### Explanation

1. `mutable` member variables **can be modified** even in **const member functions**.
2. This allows certain aspects of an object to change while keeping its overall state constant.
3. Generally, they are used **for caching or lazy evaluation purposes**.
4. They **break the const-correctness** for that particular member variable.
5. In 90% of cases, the `mutable` keyword will be used in a class with the `const` keyword.

##### Syntax

```CPP
class ClassName {
   private:
      mutable Type _mem;   // Declaration or definition of a member variable.
};
```

#### Pointer Member Variables

##### Explanation

1. Pointer member variables **hold memory addresses** of instances or other data types.
2. They allow **dynamic memory management and manipulation** of resources.

##### Syntax

```CPP
class ClassName {
   private:
      Type* _mem_ptr;   // Declaration or definition of a member pointer.
};
```

#### Reference Member Variables

##### Explanation

1. Reference member variables are **alternatives to pointers** that **refer to existing objects**.
   They **cannot be reassigned** once established.
2. Theyt must be **initialized when defined** and **cannot be null**.
3. There are **only two ways to initialize** a reference member:
   - **In-Class Initialization**: It can be **overridden** by the constructor.
   - **Constructor Initialization**.
4. When **initializing a reference member** in a class, the reference **must be bound to** either
   **another member variable** of the class or **an external variable passed as a reference** during
   object construction.

##### Syntax

```CPP
class ClassName {
   public:
      // Initialization through constructor
      explicit ClassName( Type& ref ): _memRef( ref ) {};

   private:
      Type _mem;
      // In-Class Initialization
      Type& _memRef = _mem;
};
```

### Methods

#### Explanation

1. A method in C++ is **a function** that belongs to a class or struct.
2. It is used to perform operations or manipulate the data members (attributes) of that class.
3. Methods encapsulate behavior specific to an object of the class.
4. Methods **can be overloaded** by defining multiple versions with different parameter types.
5. Methods **defined inside** the class are **automatically considered inline**, improving
   performance by reducing function call overhead.

#### Syntax

```CPP
// Declared and defined inside the class.
class ClassName {
   public:
      RetType funcName( para_list ) { ... };
};
```

```CPP
// Declared inside the class.
class ClassName {
   public:
      RetType funcName( para_list ) { ... };
};

// Defined outside the class.
RetType ClassName::funcName( para_list ) { ... };
```

#### `const` Methods (`const` Member Functions)

1. [`const` Methods (`const` Member Functions)](./ConstConstexprAndStatic.md#const-methods-const-member-functions)

#### `constexpr` Methods (`constexprt` Member Functions)

1. [`constexpr` Functions (`constexpr` Return Values)](./ConstConstexprAndStatic.md#constexpr-functions-constexpr-return-values)

#### `static` Methods (`static` Member Functions)

1. [`static` Methods (`static` Member Functions)](./ConstConstexprAndStatic.md#static-methods-static-member-functions)

#### `virtual` Methods (`virtual` Functions) (`virtual` Memeber Functions)

1. [`virtual` Methods (`virtual` Functions) (`virtual` Memeber Functions)](#virtual-methods-virtual-functions-virtual-memeber-functions-1)

#### Pure `virtual` Functions and Abstract Class

1. [Pure `virtual` Functions and Abstract Class](#pure-virtual-functions-and-abstract-class-1)

#### `override` Methods

##### Explanation

1. `override` is **a keyword** used to **explicitly** indicate that **a method in a derived class**
   is meant to **override** **a `virtual` method in the base class**.
2. It **ensures** that the **method signature** in the derived class **matches** a `virtual` method
   in the base class. If the method signature does **not match**, the compiler will generate an
   **error**, which helps **prevent subtle bugs** caused by accidental method hiding.

##### Syntax

```CPP
class Base {
   public:
      virtual RetType funcName( para_list ){
         // `virtual` method in base class
      };
};

class Derived: public Base {
   public:
      RetType funcName( para_list ) override{
         // Override the base class method
      };
};
```

##### Notes

1. You should **always use the override keyword when overriding functions** in a derived class, as
   it helps prevent errors.

### Constructors

##### Explanation

1. Constructors are **special member functions** of a class that are **automatically called when an
   object** of that class is **created**.
2. They are used to **initialize** the object's properties and **set up** any necessary resources.

##### Syntax

```CPP
class ClassName {
   public:
      ClassName( para_list ){
      };
};
```

#### Defalut Constructors and `default` Constructors

##### Explanation

1. A default constructor is **a constructor** with **no parameters** or with **all parameters having
   default values**.
2. It is **called** when an object is **instantiated without any arguments**.
3. It initializes data members to their default values (**primitive types remain uninitialized**).
4. If **no other constructors** are defined, the **compiler provides** a default constructor.
5. The **non-customized** default constructor will **initialize** all **non-user-defined type**
   members **to** their **zero values**.
6. The `= default` syntax **explicitly requests** the compiler to generate **the default
   constructor**.

##### Syntax

```CPP
class ClassName {
   public:
      // If no other constructors are defined,
      // this default constructor is provided by the compiler.
      ClassName(){};
};
```

```CPP
class ClassName {
   public:
      // Default constructor.
      ClassName(){ ... };
};
```

```CPP
class ClassName {
   public:
      // Default constructor.
      ClassName() = default;
      // Default constructor.
      // Parameterized constructor.
      ClassName( parameters with default values ){
      };
};
```

#### Parameterized Constructors

##### Explanation

1. A parameterized constructor is a type of **constructor** in a class that allows you to
   **initialize an object with specific values** upon creation.
2. Unlike a default constructor (which takes no arguments), a parameterized constructor **accepts
   one or more arguments** that enable you to set the initial state of an object with specific
   values.
3. It is **called** when an object is **instantiated with specific arguments**.

##### Syntax

```CPP
class ClassName {
   public:
      // Parameterized constructor.
      ClassName( para_list ){
      };
};
```

#### Constructor Initializer Lists

##### Explanation

1. Constructor initializer lists are used to **initialize member variables** of a class in the
   constructor's initialization phase before the body of the constructor executes.
2. Member variables are **initialized in the order they are declared** in the class, **not the order
   they appear in the initializer list**.
3. Using initializer lists can be more **efficient**, as it allows **direct initialization** of the
   member variables, **avoiding unnecessary default construction** followed by assignment.
4. An initializer list is **required** to **initialize `const` and reference members**, as they
   cannot be assigned after construction.
5. If members are **initialized in** the constructor's **body**, those members are first
   default-initialized before being assigned, which can lead to **additional overhead** compared to
   direct initialization in the initializer list.

##### Syntax

```CPP
class ClassName {
   public:
      ClassName( Type1 para1, Type2 para2, ... ):
         _mem1( para1 ), _mem2( para2 ), ...{};

   private:
      Type1 _mem1;
      Type2 _mem2;
      ...;
};
```

##### Notes

1. In the constructor initializer list, you'd better initialize the members in the order in which
   they are defined in the class.
2. If a class has **a class or struct member**, we should **use the constructor initializer** to
   initialize the class or struct member; **otherwise**, the **initialization** will call the
   object's constructors **twice**: first the default constructor, and then the other constructor.

#### Copy Constructors

##### Explanation

1. A copy constructor is **a special constructor** that **initializes a new object as a copy of an
   existing object**.
2. This is essential for managing resource ownership and ensuring that objects behave properly when
   passed, returned, or assigned.
3. **The parameter** of a copy constructor and copy assignment operator **should not be passed by
   value**, as this can lead to issues.
   - When passing the argument by value, the copy constructor will be called to create a temporary
     object for the parameter.
   - This temporary object creation requires another call to the copy constructor, which leads to a
     recursive cycle.
   - The cycle continues until the call stack overflows, causing a stack overflow error.
   - In other words, passing by value in the copy constructor or copy assignment operator **triggers
     an infinite loop**, as each invocation requires another copy of the argument, which again
     invokes the copy constructor.

##### Default Copy (`default`) (Avoid) (Double Destructions)

###### Explanation

1. A default copy constructor is **automatically generated** by the compiler if **no user-defined
   copy constructor** is present.
2. It performs **a shallow copy** of the object's members.
3. For primitive types, this is a straightforward copy, but **for pointer members**, both the
   original and copied objects will **reference the same memory**.
4. This can lead to issues such as:
   - **Double destructions**: When **both objects** are **destroyed**, they attempt to **free the
     same memory location**, resulting in **undefined behavior**.
   - **Dangling pointers**: When **one object** is **deleted**, the other **retains a pointer to the
     deallocated memory**, leading to **program crashes if accessed**.
5. The copy is **performed quickly** since it merely copies the pointer (for pointer types) rather
   than the pointed-to values.
6. The default copy constructor is **typically marked as noexcept**, improving performance by
   ensuring compatibility with standard containers, such as `std::vector`.
7. The `= default` syntax **explicitly requests** the compiler to generate the **default copy
   constructor**.

###### Syntax

```CPP
class ClassName {
   public:
      // Compiler-generated default copy constructor.
};
```

```CPP
class ClassName {
   public:
      // Default copy constructor.
      ClassName( const ClassName& ) = default;
};
```

##### Shallow Copy (e.g. `memcpy`) (Avoid) (Double Destructions)

###### Explanation

1. A shallow copy occurs when the copy constructor **simply copies the pointer values** instead of
   the data they point to.
2. This can lead to **multiple instances** trying to **manage the same resource**.
3. This can lead to issues such as:
   - **Double destructions**: When **both objects** are **destroyed**, they attempt to **free the
     same memory location**, resulting in **undefined behavior**.
   - **Dangling pointers**: When **one object** is **deleted**, the other **retains a pointer to the
     deallocated memory**, leading to **program crashes if accessed**.
4. The copy is **performed quickly** since it merely copies the pointer (for pointer types) rather
   than the pointed-to values.

###### Syntax

```CPP
class ClassName {
   public:
      Type* _mem_ptr;

      // Shallow copy constructor.
      ClassName( const ClassName& other ) {
         _mem_ptr = other._mem_ptr;
         ...;
      };

      // Destructor.
      ~ClassName() {
         // Free allocated memory: Error, double destruction.
         delete _mem_ptr;
         ...;
      };
};
```

##### Deep Copy (Recommend)

###### Explanation

1. A deep copy **ensures** that the copy constructor **creates a new instance** of any dynamically
   allocated memory, so that two objects do **not reference the same location**.
2. This **prevents** **double deletion** and **dangling pointer** issues, as each object manages its
   own memory independently.
3. Although **slower than shallow copying** due to memory allocation, deep copying is generally much
   **safer**, particularly for complex data structures.
4. When implementing a copy constructor, it is also **recommended** to **implement a corresponding
   copy assignment operator** to maintain consistent behavior and proper resource management.

###### Syntax

```CPP
class ClassName {
   public:
      Type* _mem_ptr;

      // Deep copy constructor.
      ClassName( const ClassName& other ) {
         _mem_ptr = new Type( *other._mem_ptr );
         ...;
      };

      // Destructor
      ~ClassName() {
         // Free allocated memory.
         delete _mem_ptr;
         ...;
      };
```

#### Move Constructors

##### Explanation

1. A move constructor is **a constructor** that **transfers resources from one object to another**,
   rather than performing a deep copy.
2. This enables **efficient** handling of temporary objects and **avoids unnecessary data copying**.
3. It is **ideal for rvalue references**, which represent temporary objects that do not need to
   retain their original state.
4. Move constructors **should be marked noexcept** to ensure **compatibility** with standard
   containers and to optimize **performance**.
5. Move constructors **behave similarly to shallow copy constructors** but use move semantics and
   rvalue references.
6. **A shallow move** resembles **a shallow copy** but **without** assigning all pointers in the
   source object to **`nullptr`**, whereas **a deep move** resembles **a shallow copy** **with** all
   pointers in the source object being assigned to **`nullptr`**.

##### Default Move Constructors

###### Explanation

1. The compiler **generates a default move constructor** only if:
   - The class does **not explicitly define a copy constructor, copy assignment operator, move
     constructor, or move assignment operator**.
   - **All** data members and base classes **are movable** (i.e., they also support move semantics).
2. The default move constructor **performs a shallow move**, transferring (not copying) each member
   from the source object to the destination.
3. However, it treats all members as if they were primitive types, **performing a shallow transfer
   without resetting any pointer members of the original object to `nullptr`**.
4. This can cause issues such as **double deletions** and **dangling pointers**.
5. While terms like "shallow move" and "deep move" are **not part of standard C++ terminology**,
   "unsafe move" and "safe move" better convey the risks and benefits of different copying
   strategies.
6. The default move constructor is **typically marked as noexcept**, improving performance by
   ensuring compatibility with standard containers, such as `std::vector`.
7. The `= default` syntax **explicitly requests** the compiler to generate the **default move
   constructor**.

###### Syntax

```CPP
class ClassName {
   public:
      // Compiler-generated default move constructor.
};
```

```CPP
class ClassName {
   public:
      // Default move constructor.
      ClassName( ClassName&& ) = default;
};
```

##### Custom Move Constructor

###### Explanation

1. A custom move constructor is **defined** under the following circumstances:
   - When a class manages resources that **necessitate specialized management**, such as dynamic
     memory allocation or file handles.
   - When there is a need to **reset the original object to a valid state** (e.g., to `nullptr`)
     following the transfer of ownership.
2. Move constructors **should be marked `noexcept`** to ensure **compatibility** with standard
   containers and to optimize **performance**. containers like `std::vector`.

###### Syntax

```CPP
class ClassName {
   public:
      Type* _mem_ptr;

      // Custom move constructor.
      ClassName( ClassName&& other ) noexcept: _mem_ptr( std::move( other._mem_ptr ) {
         // Deep move. Safe move.
         other._mem_ptr = nullptr;
         ...;
      };

      // Destructor.
      ~ClassName() {
         // Free allocated memory.
         delete _mem_ptr;   // Leave 'other' in a valid state
         ...;
      };
};
```

#### Conversion Constructors

##### Explanation

1. A conversion constructor allows **implicit (should avoid it with the `explicit` keyword)** or
   **explicit conversion** from a given type to the class type.
2. It takes **a single parameter** of a different type and **initializes an object** of the class
   with it.
3. These constructors **facilitate the integration of custom classes** with existing code by
   allowing automatic type conversion where appropriate.
4. When the target class holds additional information, conversion constructors ensure that
   initialization aligns with the class's intended use.

##### Syntax

```CPP
class ClassName {
   public:
      // Conversion constructor.
      ClassName( Type para_name );
};
```

#### `virtual` Constructors

1. The concept of a "`virtual` constructor" does not exist.

#### `explicit` Constructors

1. [`explicit`](./ConversionAndCasting.md#explicit)

### Destructors

#### Explanation

1. A destructor is **a special member function** that is **automatically called** when an object
   **goes out of scope** or is **explicitly deleted**.
2. Its primary purpose is to **release resources** (such as dynamically allocated memory or file
   handles) associated with the object.
3. If a class has **base classes** or member objects, their destructors are **called in reverse
   order of construction**.

#### Syntax

```CPP
class ClassName {
   public:
      ~ClassName() {
      };   // Destructor.
};
```

#### Default Destructors

##### Explanation

1. A default destructor is **automatically generated** by the compiler if the class does **not
   explicitly define one**.
2. It handles destruction according to the rules of the language, ensuring that all member variables
   and base classes are properly destroyed.
3. If the class **directly manages resources** (e.g., raw pointers), **a custom destructor** is
   **necessary** to **avoid resource leaks**.
4. The default destructor is **typically marked as noexcept**, improving performance by ensuring
   compatibility with standard containers, such as `std::vector`.
5. The `= default` syntax **explicitly requests** the compiler to generate the **default
   destructor**.

##### Syntax

```CPP
class ClassName {
   public:
      // Default destructor.
      ~ClassName() = default;
};
```

#### `virtual` Destructors

1. [`virtual` Destructors](#virtual-destructors-1)

### Operator Overloading

1. [Operator Overloading](./Operators.md#operator-overloading)

#### Copy-assignment Operator

1. [Copy-assignment Operator](./Operators.md#copy-assignment-operator)

#### Move-assignment Operator

1. [Move-assignment Operator](./Operators.md#move-assignment-operator)

#### Conversion Operator

1. [Conversion Operator](./Operators.md#conversion-operator)

#### `explicit` Conversion Operator

1. [`explicit` Conversion Operator](./Operators.md#explicit-conversion-operator)

### How to Determine Which Constructor or Assignment Operator Is Invoked

1. If an object is **being defined**, the appropriate **constructor** will be called:
   - **No argument**: **default** constructor.
   - **Single** argument of a different type: **conversion** constructor.
   - **Single** argument of the same type (**lvalue reference**): **copy** constructor.
   - **Single** argument of the same type (**rvalue reference**): **move** constructor.
   - **Multiple** arguments: parameterized constructor.
2. If an object **already exists** and is assigned a new object, the **assignment operator** will be
   called:
   - Same type (**lvalue reference**): **copy**-assignment operator.
   - Same type (**rvalue reference**): **move**-assignment operator.

### Inheritance

#### Explanation

1. Inheritance allows **a class** to **acquire the properties** and **behaviors** of **another**
   class.
2. It promotes **code reuse** and establishes a hierarchical relationship between a base class and
   one or more derived classes.
3. C++ supports **multiple inheritance** and **`virtual` inheritance** to address complexities
   arising from overlapping base classes.
4. Inheritance also facilitates **polymorphism**, enabling derived classes to **override `virtual`
   functions**.

#### Definition Syntax

##### Code

```CPP
class public Base{
   // Members of base class.
};

class Derived: public Base {
      // Members of derived class.
};
```

```CPP
template< class T, ... >
class public Base{
   // Members of base class.
};

template< class T, ... >
class Derived: public Base< class T, ... > {
      // Members of derived class.
};
```

##### Categories

1. `public` inheritance: The **visibility** of base class members remains **unchanged** in the
   derived class.
2. `protected` inheritance: **Public members** of the base class **become protected** in the derived
   class.
3. `private` inheritance: **All** base class members (public and protected) **become private** in
   the derived class.

#### Initialization Syntax

##### Code

```CPP
class Derived: public Base {
   public:
      Derived( para_list1 ): Base( para_list2 ), ... {};

   private:
      ...;
};
```

##### Explanation

1. When creating a derived class object, constructor delegation allows initializing the base class
   part of the object.
2. The **initialization** of **the base class members** must be done via an **initializer list** in
   the derived class constructor.

#### Construction Order

1. **Base** class constructor: Called first, initializing the base portion of the object.
2. **Derived** class constructor: Called after the base class constructor.
3. Member initializations: Member variables of the **derived** class are **initialized after** the
   **base** class part.

#### Destruction Order

1. **Derived** class destructor: Called first to release resources specific to the derived class.
2. **Base** class destructor: Called last to release resources inherited from the base class.

#### `virtual` Inheritance

1. [`virtual` Inheritance](#virtual-inheritance-1)

### `virtual`

##### Explanation

1. The `virtual` keyword in C++ is integral to **enabling dynamic polymorphism** and ensuring the
   **correct behavior** of objects in **inheritance** hierarchies.

#### `virtual` Methods (`virtual` Functions) (`virtual` Memeber Functions)

##### Explanation

1. A `virtual` method is **a member function** declared with **the `virtual` keyword in a base
   class**, allowing **derived classes** to provide their **own implementation**.
2. When invoked through **a base class pointer or reference**, the function from the most derived
   class is called, **enabling runtime polymorphism**.
3. `virtual` methods **ensure dynamic dispatch** by resolving function calls **at runtime** based on
   the object's actual type.
4. They **can be overridden** in derived classes using the same function signature.
5. The **`override`** keyword is **optional** but **recommended**, as it ensures that the derived
   class correctly overrides a `virtual` function.
6. If a derived class does **not override** the `virtual` function, the **base class's
   implementation** will be invoked.

##### Syntax

```CPP
class Base {
   public:
      virtual RetType funcName() const {
         // Base class implementation.
      };
};

class Derived: public Base {
   public:
      // Override keyword for clarity.
      RetType funcName() const override{
         // Derived class implementation.
      };
};
```

##### Static Binding and Dynamic Binding

##### Polymorphism and Problems

1. **Polymorphism**:
   - `virtual` functions enable polymorphic behavior, allowing a program to treat objects of
     different derived classes through a base class pointer or reference.
   - This allows **different objects** to be operated on **using the same interface**, meaning **the
     same operation** can **be applied to different objects**, **exhibiting different behaviors**.
   - This makes it easier to write flexible and reusable code.
2. **Performance overhead**:
   - `virtual` functions introduce **a performance penalty** due to the dynamic dispatch mechanism.
   - The program must go through the **V table** to look up the correct function to call at runtime,
     which can be slower than static binding.
3. **Memory overhead**:
   - Each class that uses `virtual` functions typically includes **a `virtual` table (vtable)**,
     which adds some memory overhead.
   - Each object of such classes contains a pointer to the vtable, increasing the size of the
     object.
4. **Debugging Challenges**:
   - Debugging issues related to `virtual` functions can be more challenging, especially when it
     comes to understanding the flow of execution and object lifetimes in the presence of
     polymorphism.
5. **Potential for Resource Leaks**:
   - If a **base** class has **`virtual` functions**, its **destructor** should also be
     **`virtual`** to ensure proper cleanup of derived class resources.
   - Failing to declare a `virtual` destructor can lead to resource leaks.
6. [Bindings](./Bindings.md)

##### Notes

1. In cases where **performance** is very important, you should **avoid using `virtual` functions**
   as much as possible.

#### Pure `virtual` Functions and Abstract Class

##### Explanation

1. A pure `virtual` function is declared by **assigning `= 0` to a `virtual` function**, indicating
   that it does **not provide any implementation** in the **base** class.
2. Pure `virtual` functions enforce a contract that derived classes must fulfill, promoting **design
   consistency**.
3. A class containing **at least one pure `virtual` function** is termed **an abstract class** and
   **cannot be instantiated**.
4. **The abstract class is not restricted to only contain `virtual` functions**.
5. If **a class only contains pure `virtual` functions**, it serves as **an interface** or **a base
   type** for deriving more specific implementations.
6. **All derived** classes **must override the pure `virtual` functions**; **otherwise**, they also
   become **abstract**.
7. **Abstract classes** may contain **non-virtual member functions** in addition to pure `virtual`
   ones.

##### Syntax

```CPP
class ClassName {
   public:
      // Pure `virtual` function.
      virtual RetType funcName const = 0;
};
```

#### `virtual` Destructors

##### Explanation

1. A `virtual` destructor **ensures** that when an **object** is **deleted** via a **base** class
   **pointer**, the **destructor of** the **derived** class is **invoked**, **followed** by the
   **base** class’s **destructor**.
2. This guarantees that **all resources** allocated by the derived class are **correctly released**,
   thereby **preventing memory leaks** and **ensuring complete destruction** of the object.
3. Destructors should **be declared `virtual` in any base class** intended for inheritance to
   **avoid undefined behavior** during object destruction.
4. **Without** a `virtual` destructor, **only** the **base** class **destructor** would **execute**,
   **leaving resources** specific to the derived class **unreleased**.
5. Although `virtual` destructors add **a slight performance overhead**, they are critical for
   **safe** and **correct resource management**.

##### Syntax

```CPP
class Base {
   public:
      virtual ~Base() {
         // Cleanup logic for the base class.
      };
};

class Derived: public Base {
   public:
      ~Derived() {
         // Cleanup logic for the derived class.
      };
};
```

##### Notes

1. It's used to **delete a subclass object** pointed to by a parent class pointer in **a polymorphic
   context**. A `virtual` destructor differs from other `virtual` functions.
2. The subclass's **`virtual` destructor does not override** its parent class's `virtual`
   destructor; both will be called.
3. If we allow our **class** to **be derived** into a subclass, we should **declare** its
   **destructor as `virtual`** to avoid issues like memory leaks.

#### `virtual` Inheritance

##### Explanation

1. `virtual` inheritance **prevents ambiguity** when a class **indirectly inherits from the same
   base class** **multiple times**.
2. It **ensures** that **only one instance of the base class** exists in the final derived class.
3. It **resolves the diamond inheritance problem**, where two base classes share a common ancestor.
4. The **base class constructor must be invoked** from the **most-derived class**.

##### Definition Syntax

```CPP
class Base {
      ...;
};
class A: virtual public Base {};
class B: virtual public Base {};
class Derived: public A,
               public B {};
```

##### Initialization Syntax

```CPP
class Derived: public A,
               public B {
   public:
      Derived( para_list1 ):
         Base( para_list2 ), A( para_list3 ), B( para_list4 ){};
};
```

#### Construction Order

1. **`virtual` base** class constructor: Called first, even if it's inherited indirectly.
2. **Other base** class constructors: Called next.
3. **Derived** class constructor: Called last.

#### Destruction Order

1. **Derived** class destructor: Invoked first.
2. **Non-virtual base** class destructors: Called next.
3. **`virtual` base** class destructor: Called last.

### `friend`

##### Explanation

1. The `friend` keyword **grants non-member functions** or **other classes** **access** to the
   **private** and **protected members** of a class.
2. The `friend` keyword is commonly used when specific functions or classes require access to a
   class's internal details but are not part of its public interface
3. Friendship in C++ is **not inherited**—a **derived** class does **not inherit the friendship
   relationships** of its base class.
4. Additionally, friendship is **unidirectional**: the class or function granted access does **not**
   automatically **reciprocate that privilege**.

#### `friend` Functions

##### Explanation

1. A friend function is **a non-member function** that is allowed **access** to the **private** and
   **protected** **members** of a class.
2. If the friend function needs **access to non-static non-public members**, the **class instance**
   should be **passed** to the **friend function**.
3. If the friend function **only** accesses **static** members or performs operations **unrelated to
   a specific object**, the **class instance** does **not** need to **be passed**.

##### Syntax

```CPP
class ClassName {
   public:
      // Friend function declaration.
      friend RetType funcName( const ClassName& obj );
};
```

```CPP
class ClassName {
   public:
      // Friend function declaration.
      friend RetType funcName();
};
```

#### `friend` Classes

##### Explanation

1. A friend class is **a non-member class** that is granted access to the **private** and
   **protected members** of **another** class.
2. If the member functions of the friend class need to **access non-static non-static members**, the
   **class instance** should be **passed** to **those functions**.
3. If the member functions of the friend class **access static members** or perform operations
   **unrelated to a specific object**, the class instance does **not** need to **be passed**.

##### Syntax

```CPP
class ClassA {
   public:
      friend class ClassB;   // Declaring ClassB as a friend
};

class ClassB {
   public:
      RetType funcName( const ClassA& obj ) { ... };
};
```

```CPP
class ClassA {
   public:
      friend class ClassB;   // Declaring ClassB as a friend
};

class ClassB {
   public:
      RetType funcName() { ... };
};
```

### `final`

##### Explanation

1. The final keyword in C++ is used to prevent further inheritance or overriding of classes and
   virtual functions.
2. It plays a crucial role in controlling the behavior of classes in the inheritance hierarchy.

#### `final` Functions

##### Explanation

1. A final function is **a `virtual` function** that **cannot be overridden** by any derived class.
2. The final specifier ensures that the function's implementation remains fixed in the class that
   declares it as final.
3. This feature can **improve performance** by **devirtualizing calls** to the final function, as
   the compiler can safely **inline such calls**, knowing that no further overrides exist and **not
   add this function to `vtable`**.

##### Syntax

```CPP
class Base {
   public:
      virtual RetType funcName() final;   // Declaration of a final function.
};
```

#### `final` Classes

##### Explanation

1. A final class is **a class** that **cannot be inherited** from. Declaring a class as final
   ensures that no further subclassing is allowed, which can prevent misuse of inheritance and
   unintended extensions of the class’s functionality.
2. Marking a class as final can **improve runtime performance**, as the compiler can **optimize
   calls** and **remove `virtual` dispatch overhead**.
3. Final classes are often used for **singleton patterns**, **utility classes**, or
   **performance-critical components** to **prevent inheritance overhead**.

##### Syntax

```CPP
class FinalClass final {};

// class Derived: public FinalClass {};   // Error: Cannot inherit from a final class
```

### `explicit`

1. [`explicit`](./ConversionAndCasting.md#explicit)

### `using`

1. [`using`](./UsingTypedefNameSpaces.md#using)

### Hiding, Overloading, Overriding, and Overwriting

1. [Hiding, Overloading, Overriding, and Overwriting](./HidingOverloadingOverridingAndOverwriting.md)

### Notes

1. All destructors of base classes (parent classes) should be declared as virtual functions.
2. All functions of base classes (parent classes) that you intend to override in derived classes
   need to be declared as virtual.
3. The parameter of a copy constructor and copy assignment operator should not be passed by value,
   as this can lead to a issue, an infinite loop.

<!-- vim-markdown-toc GFM -->

- [Preface](#preface)
- [Some Basic Concepts](#some-basic-concepts)
  - [1) Declaration](#1-declaration)
    - [General Explanation](#general-explanation)
    - [Forward Declaration](#forward-declaration)
  - [2) Definition](#2-definition)
  - [3) Variable, Instance and Object](#3-variable-instance-and-object)
    - [Variable](#variable)
      - [Explanation](#explanation)
      - [Characteristics](#characteristics)
    - [Instance](#instance)
      - [Explanation](#explanation-1)
      - [Characteristics](#characteristics-1)
    - [Object](#object)
      - [Explanation](#explanation-2)
      - [Characteristics](#characteristics-2)
    - [Relationships Between the Them](#relationships-between-the-them)
      - [Variable](#variable-1)
      - [Instance](#instance-1)
      - [Object](#object-1)
  - [4) Pointer and Reference](#4-pointer-and-reference)
    - [Pointer](#pointer)
    - [Reference](#reference)
  - [5) Parameter](#5-parameter)
  - [6) Argument](#6-argument)
  - [7) Expression](#7-expression)
    - [Explanation](#explanation-3)
    - [Types of Expressions in C++](#types-of-expressions-in-c)
  - [8) Lvalue and Rvalue: Value Categories in C++](#8-lvalue-and-rvalue-value-categories-in-c)
    - [Lvalue (Left Value)](#lvalue-left-value)
    - [Rvalue (Right Value)](#rvalue-right-value)
    - [Lvalue Reference (`Type&`)](#lvalue-reference-type)
      - [Explanation](#explanation-4)
      - [Usage](#usage)
      - [Notes](#notes)
    - [How to Identify Whether a Value is an Lvalue or an Rvalue](#how-to-identify-whether-a-value-is-an-lvalue-or-an-rvalue)
    - [Rvalue Reference (`Type&&`)](#rvalue-reference-type)
      - [Explanation](#explanation-5)
      - [Usage](#usage-1)
    - [Move Semantics](#move-semantics)
      - [Explanation](#explanation-6)
      - [Usage](#usage-2)
    - [`std::move`](#stdmove)
      - [Explanation](#explanation-7)
      - [Usage](#usage-3)
  - [9) Interface](#9-interface)
  - [10) Keyword](#10-keyword)
  - [11) Type Specifier](#11-type-specifier)
- [Some Small Knowledge](#some-small-knowledge)

<!-- vim-markdown-toc -->

## Preface

1. If you have sufficient experience with C++ projects, you can proceed with reading this additional
   summary. It may also be beneficial to revisit C++ tutorial videos and relearn the language from
   scratch.
2. Personally, I follow an influencer named Cherno, a game and game engine developer. He uploads
   numerous C++ tutorial series, from which I can learn various C++ techniques.
3. Additionally, if you have time, you can try implementing some standard libraries on your own. You
   don’t need to implement all their functions, just their core functionality. If you’re unsure how
   to implement them, you can search for online tutorials or examine the source code. Although the
   source code may be difficult to understand, studying it can still be beneficial.
4. Moreover, if you want to explore certain features or functions provided by C++, you can consult
   ChatGPT on topics like how to effectively use specific libraries or discover lesser-known
   functions. ChatGPT is a helpful tool for learning a wide range of topics. However, you shouldn't
   rely on it too heavily, as that might hinder your ability to study independently. Each time
   ChatGPT provides an answer, you should verify it and consider whether it is accurate, as ChatGPT
   does not guarantee 100% correctness. You should also read and internalize the results to retain
   the information.
5. You can also refer to C++ tutorial books or websites, such as `<<The C++ Programming Language>>`
   and `<<C++ Primer Plus>>`, [cppreference](https://en.cppreference.com/) ,
   [cplusplus](https://cplusplus.com/) and [tutorialspoint](https://www.tutorialspoint.com/) or a
   command `cppman` in Linux. When reading any tutorial, including this one, **focus on the basic
   concepts**, their definitions, explanations, and key characteristics, paying particular attention
   to the bold text, as these concepts often appear in other contexts. You’d better **take notes**
   and **create a mind map** to retain everything you consider necessary, like a simple tutorial.
6. Lastly, it’s important to note that different compilers have slightly different implementations
   of the Standard Template Library (STL). While they provide the same library, there may be minor
   variations in implementation. For instance, in std::vector, if the size exceeds its capacity, it
   grows by 50% in Clang, whereas it grows by 100% in GCC.

## Some Basic Concepts

### 1) Declaration

#### General Explanation

1. The term declaration refers to the introduction of **a variable, function, class, or other entity
   to the program, specifying its name and type without allocating storage or providing an
   implementation**. It **merely states** that a function, class, struct or variable **exists**
   without concerning itself with a definition.

#### Forward Declaration

1.  It is **a declaration** of a class, function, or variable that **informs the compiler of its
    existence without providing the full definition** at that point. It allows the compiler to
    handle references to an entity (e.g., a class or a function) without needing to know all the
    details at that time. The complete definition is provided later in the code.
2.  This is typically used to **improve compilation times**, **resolve circular dependencies**, or
    when the full details of the entity are not yet required.

### 2) Definition

1.  A definition **provides a body** that implements a function, class, struct or variable. It
    includes **an actual value or implementation** and **allocates storage for variables**.

### 3) Variable, Instance and Object

#### Variable

##### Explanation

1. A variable is **a named storage location** in memory that **holds a value**. It has a specific
   type (such as int, float, or a custom class) and is declared in the program to store data that
   can be accessed and modified.

##### Characteristics

1. **A name** (identifier) is required.
2. **A type** is specified (determining the kind of value it can hold).
3. It **occupies memory** in the program.

#### Instance

##### Explanation

1. An instance is **a concrete occurrence** of **a particular data type**. This term is most
   commonly used in the context of user-defined types like **classes or structs**. When you create
   an instance of a class, you're creating an object of that class type.

##### Characteristics

1. Refers to **a specific occurrence** of **a class or struct**.
2. Instances of a class are often **called objects**.

#### Object

##### Explanation

1. An object is **a region of memory** that **has a type, value**, and, **in most cases, a name
   (optional)**. Every variable is an object, and every instance of a class is also an object. The
   term object is **more general** and refers to any instance of a type that occupies memory,
   whether it’s built-in (like int, double) or user-defined (like a class).
2. An object is **generally** defined as **an instance** of a data type that **occupies memory** and
   **has attributes (data members) and behaviors (methods)** when it comes to **user-defined types
   (classes)**.
3. For **built-in types** (like int, char, etc.), the term "object" can **also apply**.

##### Characteristics

1. **An instance of any type** (built-in or user-defined).
2. **Occupies memory** and **has a type**.
3. **May or may not** have **a name** (temporary objects don’t have names).
4. Includes variables, class instances, dynamically allocated memory, and **temporary values**.

#### Relationships Between the Them

##### Variable

1. A variable is **a named object**. Every variable is an object, but not all objects are variables.
   A variable always refers to an object, but it also provides a name for it, allowing it to be used
   and modified in the code.

##### Instance

1. An instance is **a specific object** of **a class or user-defined type**. It represents a
   concrete realization of that class, holding data and having behaviors defined by the class. When
   you create an instance of a class, you are creating an object of that class.

##### Object

1. An object is **the most general term**. It refers to **any entity** that **occupies memory** and
   **has a type**. Objects can be variables, instances of classes, temporary objects, or even
   dynamically allocated memory that doesn't have a name (like objects created with new).

### 4) Pointer and Reference

#### Pointer

1. A pointer is **a variable** that **stores the memory address of another variable or an object**.
2. Pointers enable **dynamic memory allocation**, efficient array handling, and the ability to pass
   large data structures to functions without copying them.
3. They **require careful management** of memory (allocation/deallocation).
4. They can be **null ( nullptr )**.

#### Reference

1. A reference is **an alias for an existing variable**. It allows you to create **another name for
   a variable** without making a copy of it. References are declared using an ampersand (`&`) in the
   declaration.
2. A reference **must be initialized** when it is declared and cannot be changed to refer to another
   variable later.
3. Unlike pointers, references **cannot be null**. They must always refer to a valid object.
4. A reference is defined as a type. However, I believe it is **merely an alias**, not a distinct
   type, because `auto` cannot deduce a type as a reference without using `&`.
5. A reference is **neither a variable nor an object**.

### 5) Parameter

1.  A parameter is **a variable declared in a function definition**. It serves as a placeholder for
    the values that will be passed to the function when it is called.
2.  Parameters are used to **receive input values** within the function and specify the type of data
    the function expects.

### 6) Argument

1.  An argument is **an actual value, variable, object or reference passed to the function** when it
    is called. Arguments are the specific data supplied to the function's parameters.

### 7) Expression

#### Explanation

1. An expression is **any valid combination of variables, literals, operators, or function calls**
   that **evaluates to a value**. Expressions are the building blocks of C++ programs and can range
   from simple values like `42` to complex operations involving multiple variables and function
   calls. They are **evaluated at runtime** to produce a result, which may or may not be used
   further in the program.

#### Types of Expressions in C++

1. Literal Expressions
   - A literal (such as `42`, `a`, or `3.14`) is the simplest form of an expression. It evaluates to
     its own value.
2. Variable Expressions
   - A variable by itself is also an expression, and it evaluates to the value it stores. For
     example,
     ```CPP
     int x = 10;
     x; // Evaluates to 10.
     ```
3. Arithmetic Expressions
   - These use arithmetic operators (`+`, `-`, `*`, `/`, `%`) to produce numeric results. For
     example,
     ```CPP
     int y = 5 + 3 * 2; // Evaluates to 11.
     ```
4. Logical and Relational Expressions
   - Logical expressions (`&&`, `||`, `!`) produce a boolean result.
   - Relational expressions (`==`, `!=`, `<`, `>`, `<=`, `>=`) compare values and return true or
     false. For example,
     ```CPP
     bool result = (x > 0) && (y < 10); // Evaluates to true.
     ```
5. Assignment Expressions
   - An assignment operation is also an expression that returns the assigned value. For example,
     ```CPP
     int z;
     z = 20; // Evaluates to 20.
     ```
6. Function Call Expressions
   - A function call acts as an expression, with the result being the return value of the function.
     For example,
     ```CPP
     int absValue = std::abs(-5); // Evaluates to 5.
     ```
7. Conditional (Ternary) Expressions
   - A ternary expression evaluates a condition and returns one of two values based on the result.
     For example,
     ```CPP
     int max = (x > y) ? x : y; // Returns x if x > y, otherwise y.
     ```
8. Member Access Expressions
   - Accessing a member of an object or a struct is also an expression. For example,
     ```CPP
     struct Point { int x, y; };
     Point p = {3, 4};
     p.x; // Evaluates to 3.
     ```
9. Pointer Expressions
   - Dereferencing a pointer or using the & operator to take the address of a variable forms an
     expression. For example,
     ```CPP
     int* ptr = &x; // Evaluates to the address of x.
     *ptr; // Evaluates to the value of x (10).
     ```

### 8) Lvalue and Rvalue: Value Categories in C++

#### Lvalue (Left Value)

1. Refers to **an object or memory location** that **persists** beyond a single expression and
   occupies some **identifiable location** in memory (i.e., it has an address).
2. **Can** appear on the **left side** or the **right side** of an assignment
3. **Typically** refers to **variables**, **array elements**, or **dereferenced pointers**.
4. **Can take the address** of an lvalue using the address-of operator (`&`).

#### Rvalue (Right Value)

1. Refers to **temporary objects or values** that do **not persist** beyond the expression in which
   they are used and **does not have a specific location in memory** (it cannot be assigned a memory
   address).
2. **Cannot** appear on the **left-hand side** of an assignment.
3. **Examples** include **literals**, **temporary results** of expressions, and **return values** of
   functions without `&`.

#### Lvalue Reference (`Type&`)

##### Explanation

1. An lvalue reference is **a reference to a persistent object** (i.e., an object with a
   well-defined memory address, such as variables or class members). It binds only to lvalues —
   objects that can appear on the left side of an assignment.

##### Usage

1. **Modify the value** of an existing object.
2. **Pass objects** by reference to functions, **avoiding unnecessary copying**.

##### Notes

1. A **normal** reference **can't** store an **rvalue** **but** a **const reference can**. A
   **normal reference parameter** of a function **can't** accept **an rvalue** **but** a **const
   reference parameter can**.

#### How to Identify Whether a Value is an Lvalue or an Rvalue

1.  Define a normal reference for a value, if it can be store by a referenc, it is an lvalur.
    Otherwise, it is an rvalue.

#### Rvalue Reference (`Type&&`)

##### Explanation

1. An rvalue reference is **a reference to a temporary object (an rvalue)** that is about to expire.
   It can **bind only to rvalues**, such as the result of expressions or moved objects (e.g., via
   `std::move`). This makes rvalue references ideal for **move semantics**, allowing efficient
   transfer of resources.

##### Usage

1. Implement **move constructors** and **move assignment operators** to **avoid unnecessary
   copying**.
2. **Optimize performance** by transferring resources from one object to another.

#### Move Semantics

##### Explanation

1. Move semantics, introduced in C++11, **optimizes** program **performance** by transferring
   resources from one object to another instead of copying them. It uses **rvalue references**
   (`Type&&`) to **efficiently** move resources, such as dynamically allocated memory, from
   **temporary** or **"expired" objects** without incurring **the overhead of deep copies**.
2. Essentially, move semantics functions like **assigning one pointer to another**. Rather than
   copying data, **ownership** of the resources is transferred between objects, **reducing
   unnecessary copying** and **enhancing performance**.

##### Usage

1. **Rvalue references** (`Type&&`) bind to **temporary** or **"soon-to-expire" objects**.
2. These references allow you to **move resources**, **leaving the original object** in a valid but
   empty state.
3. The compiler may **optimize your code** when you use move semantics in **move constructors**,
   **move assignment operators**, and when **returning objects by value**.

#### `std::move`

##### Explanation

1. A utility function that **casts an object to an rvalue reference**, **enabling move semantics**.
2. It does **not perform any movement** itself **but indicates** that the object can be moved.
3. For **all primitive-type** variables including poiners and references, it does nothing, **only
   copys** them directly.
4. It **only** tells the compiler to **treat an object as an rvalue reference**.

##### Usage

1. Everytime, if you want to assign **an object** that you want to **remove** after assigning to a
   variable, you can use `std::move`.
2. To deal with **double deletion**, **the original pointer** should point a **nullptr** after
   **`std::move`** moved its data to another pointer.

### 9) Interface

1. In C++, the term "interface" does **not have a formal definition** like it does in some other
   programming languages (like Java). However, in C++, an interface is generally understood to be
   **a class** that **defines a set of pure virtual functions**, which means that it declares
   functions that **must be implemented by derived classes** but does **not provide any
   implementation of its own**.

### 10) Keyword

1. A keyword is **a reserved word** that has a predefined meaning in the language and **cannot be
   used as an identifier** (such as a variable name, function name, etc.). Keywords are part of the
   C++ syntax and represent fundamental constructs or operations in the language.

### 11) Type Specifier

1. A type specifier is **used to define the type of a variable, function return value, or object**.
   Type specifiers tell the compiler what kind of data the variable will hold or the function will
   return. They are an essential part of variable declarations and type definitions.

## Some Small Knowledge

1. The **performance** of < is better than <=.
2. `std::endl` is a little **slower** than `"\n"` in **debug mode**. Otherwise, `std::endl` is
   **faster**.
3. Function argument evaluation order: Undefined. Differenct compilers with different flags have
   different evaluation orders, until C++17, an uncomplete definiton of the function argument
   evaluation order comes.
4. **All variables, objects, references, and pointers** should be **initialized explicitly and
   immediately** after they are declared or created. This can avoid many unpredictable issues

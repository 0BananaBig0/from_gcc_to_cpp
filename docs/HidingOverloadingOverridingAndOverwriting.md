<!-- vim-markdown-toc GFM -->

- [Hiding, Overloading, Overriding, and Overwriting](#hiding-overloading-overriding-and-overwriting)
  - [Hiding (Name Hiding)](#hiding-name-hiding)
    - [Explanation](#explanation)
    - [Syntax](#syntax)
    - [How to Access Hidden Function](#how-to-access-hidden-function)
  - [Overloading](#overloading)
    - [Explanation](#explanation-1)
    - [Syntax](#syntax-1)
  - [Overriding](#overriding)
    - [Explanation](#explanation-2)
    - [Syntax](#syntax-2)
  - [Overwriting (Not a C++ Term)](#overwriting-not-a-c-term)
    - [Explanation](#explanation-3)
    - [Syntax](#syntax-3)

<!-- vim-markdown-toc -->

## Hiding, Overloading, Overriding, and Overwriting

### Hiding (Name Hiding)

#### Explanation

1. Hiding occurs when **a derived class** declares a function (or variable) with **the same name**
   as a function (or variable) in **the base class**, regardless of the parameters.
2. The **base class function** is **hidden** in the derived class scope, **even** if the
   **signatures (parameter types) differ**.
3. This can lead to confusion or errors because the **base class function** is **no longer
   accessible directly** from the derived class.

#### Syntax

```CPP
class Base {
   public:
      RetType1 funcName( para_list1 ) {
         ...;
      };
};

class Derived: public Base {
   public:
      RetType2 funcName( para_list2 ) {
         ...;
      };
};

int main() {
   Derived obj_name;
   // Error: Base::funcName( para_list1 ) is hidden by Derived::funcName( para_list2 )
   obj_name.show();
};
```

#### How to Access Hidden Function

```CPP
   obj_name.Base::funcName( para_list1 );   // Calls Base class funcName( para_list1 )
```

### Overloading

#### Explanation

1. Overloading occurs when **two or more functions** in **the same scope** have **the same name**
   but **different parameter types or numbers of parameters**.
2. Additionally, if **a keyword** appears **between** the function **parameters** and the **function
   body**, it can be used to create **overloaded** functions because their **signatures** are
   **different**. For example, **const functions and noexcept functions**.
3. However, **the return type does not** play a role in distinguishing overloaded functions.
4. Functions **cannot** be overloaded solely based on different **return types**.
5. C++ allows overloading **based on the number of arguments, their types, or both**.
6. Overloading is **resolved at compile time** (**static polymorphism**).

#### Syntax

```CPP
class ClassName {
   public:
      RetType1 funcName( para_list1 ) {
         ...;
      };

      RetType1 funcName( para_list1 ) const {
         ...;
      };

      RetType1 funcName( para_list1 ) noexcept {
         ...;
      };

      RetType2 funcName( para_list2 ) {
         ...;
      };

      RetType2 funcName( para_list3 ) {
         ...;
      };
};
```

### Overriding

#### Explanation

1. Overriding occurs when **a derived class** provides **its own implementation** of **a virtual
   function (or a pure virtual function)** that is **already defined** in the base class.
2. The function in the derived class must have **the same signature** as the base class's **virtual
   function**.
3. This means, for a function in a derived class to override a function in a base class, it must
   **have the same name**, **parameter list**, and **qualifiers** as the function in the base class.
4. Overriding is **resolved at runtime** (**dynamic polymorphism**).

#### Syntax

```CPP
class Base {
   public:
      virtual RetType funcName( para_list ) {};
};

class Derived: public Base {
   public:
      virtual RetType funcName( para_list ) override {   // This function overrides Base::funcName().
      };
};

int main() {
   Base* obj = new Derived();
   obj->funcName( arg_list );   // Calls Derived class funcName (runtime polymorphism).
};
```

### Overwriting (Not a C++ Term)

#### Explanation

1. Overwriting is **not a formal term in C++**.
2. However, it is sometimes colloquially used to describe a situation where **a function or variable
   in a derived class replaces or redefines a function or variable from a base class**.
3. This serves as a general description rather than a specific C++ concept.
4. Additionally, the term "overwriting" typically refers to the process of **replacing an existing
   value in memory**, which includes assigning a new value to an existing variable to replace the
   old value and writing data to unintended memory locations, often resulting in undefined behavior
   or memory corruption.
5. This can occur in various contexts, such as variables, function definitions, or data structures.

#### Syntax

```CPP
class Base {
   public:
      Type _mem = initializer1;
};

class Derived: public Base {
   public:
      Type _mem = initializer2;   // Overwrites Base::_mem.
};
```

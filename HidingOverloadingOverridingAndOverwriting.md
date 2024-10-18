<!-- vim-markdown-toc GFM -->

- [The Difference Between Hiding, Overloading, Overriding, and Overwriting](#the-difference-between-hiding-overloading-overriding-and-overwriting)
  - [(1) Hiding (Name Hiding)](#1-hiding-name-hiding)
    - [Syntax](#syntax)
    - [Explanation](#explanation)
    - [How to Access Hidden Function](#how-to-access-hidden-function)
  - [(2) Overloading](#2-overloading)
    - [Explanation](#explanation-1)
    - [Syntax](#syntax-1)
  - [(3) Overriding](#3-overriding)
    - [Explanation](#explanation-2)
    - [Example](#example)
  - [(4) Overwriting (Not a C++ Term)](#4-overwriting-not-a-c-term)
    - [Explanation](#explanation-3)
    - [Example](#example-1)

<!-- vim-markdown-toc -->

### The Difference Between Hiding, Overloading, Overriding, and Overwriting

#### (1) Hiding (Name Hiding)

##### Syntax

```CPP
class BaseClassName {
   public:
      RetType1 funcName( para_list1 ) {
         ...;
      }
};

class DerivedClassName: public BaseClassName {
   public:
      RetType2 funcName( para_list2 ) {
         ...;
      }
};

int main() {
   DerivedClassName obj_name;
   // Error: BaseClassName::funcName( para_list1 ) is hidden by DerivedClassName::funcName( para_list2 )
   obj_name.show();
}
```

##### Explanation

1. Hiding occurs when **a derived class** declares a function (or variable) with **the same name**
   as a function (or variable) in **the base class**, regardless of the parameters.
2. The **base class function** is **hidden** in the derived class scope, **even** if the
   **signatures (parameter types) differ**.
3. This can lead to confusion or errors because the **base class function** is **no longer
   accessible directly** from the derived class.

##### How to Access Hidden Function

```CPP
   obj_name.BaseClassName::funcName( para_list1 );   // Calls Base class funcName( para_list1 )
```

#### (2) Overloading

##### Explanation

1. Overloading occurs when **two or more functions** in **the same scope** have **the same name**
   but **different parameter types or numbers of parameters**.
2. Additionally, if **a keyword** appears **between** the function **parameters** and the **function
   body**, it can be used to create **overloaded** functions because their **signatures** are
   **different**. For example, **const functions and noexcept functions**.
3. However, **the return type does not** play a role in distinguishing overloaded functions.
   Functions cannot be overloaded solely based on different return types. Overloading is resolved at
   compile time (static polymorphism). C++ allows overloading based on the number of arguments,
   their types, or both.

##### Syntax

```CPP
class ClassName {
   public:
      RetType1 funcName( para_list1 ) {
         ...;
      }

      RetType1 funcName( para_list1 ) const {
         ...;
      }

      RetType1 funcName( para_list1 ) noexcept {
         ...;
      }

      RetType2 funcName( para_list2 ) {
         ...;
      }

      RetType2 funcName( para_list3 ) {
         ...;
      }
};
```

#### (3) Overriding

##### Explanation

1. Overriding occurs when **a derived class** provides **its own implementation** of **a virtual
   function ( or a pure virtual function )** that is **already defined** in the base class.
2. The function in the derived class must have **the same signature** as the base class's virtual
   function. Overriding is resolved at runtime (**dynamic polymorphism**).

##### Syntax

```CPP
class Base {
   public:
      virtual RetType funcName( para_list ) { };
};

class Derived: public Base {
   public:
      virtual RetType funcName( para_list ) override {   // This function overrides Base::funcName()
      }
};

int main() {
   Base* obj = new Derived();
   obj->funcName( arg_list );   // Calls Derived class funcName (runtime polymorphism)
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

##### Syntax

```CPP
class Base {
   public:
      Type _mem = initializer1;
};

class Derived: public Base {
   public:
      Type _mem = initializer2;   // Overwrites Base::_mem
};
```

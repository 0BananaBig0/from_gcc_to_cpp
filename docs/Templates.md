<!-- vim-markdown-toc GFM -->

- [Templates](#templates)
  - [Explanation](#explanation)
  - [Order of Parameters in the Parameter List](#order-of-parameters-in-the-parameter-list)
  - [Limitations of Template Default Types and Values](#limitations-of-template-default-types-and-values)
  - [Explicit Instantiation](#explicit-instantiation)
  - [Implicit Instantiation (**Common Instantiation**)](#implicit-instantiation-common-instantiation)
  - [Function Templates](#function-templates)
    - [Explanation](#explanation-1)
    - [Syntax](#syntax)
  - [Class Templates or Struct Templates](#class-templates-or-struct-templates)
    - [Explanation](#explanation-2)
    - [Syntax](#syntax-1)
  - [Template Specialization](#template-specialization)
    - [Explanation](#explanation-3)
    - [Full specialization](#full-specialization)
      - [Explanation](#explanation-4)
      - [Syntax](#syntax-2)
    - [Partial Specialization (Partial Parameters)](#partial-specialization-partial-parameters)
      - [Explanation](#explanation-5)
      - [Syntax](#syntax-3)
  - [Variadic Templates (Template Packs)](#variadic-templates-template-packs)
    - [Explanation](#explanation-6)
    - [Common Syntax](#common-syntax)
    - [Link](#link)
  - [Template Parameters with Non-Type Parameters](#template-parameters-with-non-type-parameters)
    - [Explanation](#explanation-7)
    - [Syntax](#syntax-4)
  - [Constraints and Concepts](#constraints-and-concepts)
    - [Explanation](#explanation-8)
    - [Links](#links)
  - [SFINAE (Substitution Failure Is Not An Error)](#sfinae-substitution-failure-is-not-an-error)
    - [Explanation](#explanation-9)
    - [Syntax](#syntax-5)
  - [Type Traits](#type-traits)
    - [Explanation](#explanation-10)
    - [Syntax](#syntax-6)
  - [Template Aliases](#template-aliases)

<!-- vim-markdown-toc -->

## Templates

### Explanation

1. Templates are C++ entities that use the **`template` keyword** to define and use **the `typename`
   or the `class` keyword** to speficy a generic type .
2. All **type parameters** can be bound to **default types**, and all **non-type parameters** can be
   bound to **default values**.
3. Templates empower developers to write **generic and reusable code**. By enabling functions and
   classes to **operate on arbitrary data types**, templates facilitate enhanced flexibility and
   **type safety** in programming.
4. They **do not exist**, and the compiler **does not create them**, and some compilers **do not
   detect its syntax** **until they are called**. At compile time, the compiler create and detect
   them.
5. Because templates **exist and are compiled only for specific types when instantiated**, they
   **can** be **declared and defined in header files**.

### Order of Parameters in the Parameter List

1. For **function templates**, there is **no specific order** for parameters in the parameter list.
   Type or non-type parameters, whether they have default types or values, and parameter packs can
   be placed anywhere in the list.
2. However, **for class templates**, there is **a specific order**:
   - All parameters without default types or values must be placed at the beginning of the parameter
     list.
   - All parameters with default types or values must be specified at the end of the parameter list,
     but before any parameter packs.
   - All parameter packs must be placed at the end of the parameter list.
3. **Better orders**:
   - **Type parameters without default types, non-type parameters without default values, type
     parameters with default types, non-type parameters with default values, and parameter packs**.
   - Non-type parameters without default values, type parameters without default types, non-type
     parameters with default values, type parameters with default types, and parameter packs.

### Limitations of Template Default Types and Values

1. **Order of parameters**:
   - **It is not permissible to omit a parameter with a default value if one intends to provide
     values for later parameters**.
2. **Dependent names**:
   - Default template parameters **cannot depend on other template parameters**. A template
     parameter cannot be utilized to define the default value of another template parameter.
3. **Ambiguity in overloading**:
   - The use of default template parameters in function overloading may lead to ambiguity.
   - If multiple templates can potentially match a call due to the presence of default arguments,
     the compiler may encounter difficulty in determining which template to invoke.
4. **Inheritance and template defaults**:
   - **In derived template classes**, **the default arguments** inherited from the base class
     **cannot be modified**.
   - It is necessary to explicitly specify the types in the derived class.
5. **Specialization limitations**:
   - Template specializations are **unable to alter default template parameters**.
   - If a specialization employs a different type or value, it must explicitly define those
     parameters.

### Explicit Instantiation

1.  The explicit instantiation refers to the deliberate and formal creation of a specific instance
    of a template with a particular type, as specified by the programmer.
2.  **It works similarly to declaring a template with specific types and then using it**.
3.  This is done **using the `template` keyword** followed by the instantiation of the template with
4.  the desired type.
5.  This mechanism is primarily used to control when and where a template is instantiated,
    particularly in larger codebases where managing template definitions and instances can become
    complex.

### Implicit Instantiation (**Common Instantiation**)

1.  The implicit instantiation refers to the automatic creation of a template instance by the
    compiler when a template is used with a specific type, without requiring explicit instantiation
    by the programmer.
2.  **It works similarly to using a template directly with specific types, without any prior
    declaration**.

### Function Templates

#### Explanation

1. Function templates allow for the definition of **functions** that can **operate with any data
   type**.
2. This capability **reduces code duplication** and **enhances type safety**, as the compiler can
   automatically generate type-specific implementations based on the provided template parameters.

#### Syntax

```CPP
// Definition syntax.
template< typename T1, typename T2, ... > T1 funcName( T2 arg1, ... ) {
   // Function implementation.
}
```

```CPP
// Usage syntax, explicit instantitaion syntax.
template Type funcName( ... );
```

```CPP
// Usage syntax, explicit instantitaion syntax.
template Type funcName<>( ... );
```

```CPP
// Usage syntax, explicit instantitaion syntax.
template Type funcName< ... >( ... );
```

```CPP
// Usage syntax, implicit instantitaion syntax.
Type result = funcName( ... );
```

```CPP
// Usage syntax, implicit instantitaion syntax.
Type result = funcName<>( ... );
```

```CPP
// Usage syntax, implicit instantitaion syntax.
Type result = funcName< ... >( ... );
```

### Class Templates or Struct Templates

#### Explanation

1. Class templates or struct templates enable the creation of **classes or structs** that can
   **manage various data types**.
2. This feature is particularly advantageous for **implementing data structures** such as **lists,
   stacks, and queues**, where **the type of data may vary**.

#### Syntax

```CPP
// With explicit instantiation.
namespace SpaceName {
   // Definition Syntax.
   template< class T, ... > class ClassName {
         RetType funcName( ... ) {
            // Do something.
         }
   };
}   // namespace SpaceName.

// Usage syntax, instantiation syntax.
// template class ClassName<int>; // error: class template ClassName not visible in the global namespace.
using SpaceName::ClassName;
// template class ClassName<int>; // error: explicit instantiation outside of the namespace of the template.
template class SpaceName::ClassName< Type, ... >;         // OK: explicit instantiation.
template RetType SpaceName::ClassName< Type, ... >::funcName( ... );   // OK: explicit instantiation.
```

```CPP
// With implicit instantiation.
// Definition Syntax.
template< class T, ... > struct StructName
{
};
// Usage syntax, instantiation syntax.
template struct StructName< Type, ... >;   // Explicit instantiation of StructName< Type >.
StructName< Type, ... > obj;               // Implicit instantiation of StructName< Type >.
```

### Template Specialization

#### Explanation

1. Template specialization allows for the definition of **a specific implementation of a template
   for a particular data type** to **meet specific conditions**.
2. However, they do **not allow more than one specialization for the same type parameters**. The
   compiler will throw **an error** if multiple specializations that match the same signature are
   declared.
3. This feature is useful when **the generic implementation requires adjustment for certain types to
   enhance functionality or performance**.

#### Full specialization

##### Explanation

1. In **full specialization**, it is imperative to **specify all template parameters explicitly**.
2. For instance, if your template accepts two parameters, both must be explicitly defined in the
   specialization.

##### Syntax

```CPP
// Definition syntax.
template< para_list > class ClassName {
      // Implementation.
};

// Full specialization for `arg_list2`.
template<> class ClassName< arg_list2 > {
      // Another implementation.
};
```

```CPP
// Usage syntax.
ClassName< arg_list1 > obj1;   // Utilizes the generic version.
ClassName< arg_list2 > obj2;   // Utilizes the specialized version.
```

#### Partial Specialization (Partial Parameters)

##### Explanation

1. In **partial specialization**, it is permissible to **leave some template parameters
   unspecified**, allowing them to **remain generic**.
2. **The names** of the unspecified template parameters **do not need to remain the same as
   before**, **except for their remaining quantity**.
3. This flexibility is advantageous for **providing specialized behavior tailored to specific
   categories of types**.

##### Syntax

```CPP
// Definition syntax.
template< para_list1 > class ClassName {
      // Implementation.
};

// Partial specialization for `arg_list3`.
template< para_list2 > class ClassName< arg_list3 > {
      // Another implementation.
};
```

```CPP
// Usage syntax.
ClassName< arg_list1 > obj1;              // Utilizes the generic version.
ClassName< arg_list2, arg_list3 > obj2;   // Utilizes the specialized version.
```

### Variadic Templates (Template Packs)

#### Explanation

1. Variadic templates are **templates** that **contain at least one parameter pack**.
2. **A template parameter pack** is **a template parameter** that **accepts zero or more template
   arguments** (non-types, types, or templates).
3. The **common way** to **store the arguments of a template parameter pack** and **access them** is
   by using **`std::tuple`** and **`std::get`**.
4. This feature is beneficial for functions that need to **handle a flexible number of arguments**,
   thereby enhancing versatility.
5. For **a function template**, **multiple parameter packs** can be defined, while **a class
   template** can **only have one**.

#### Common Syntax

```CPP
#include <iostream>
#include <tuple>

// Be mindful of the Ellipsis.
template< typename... Args > class ClassName {
   public:
      // explicit ClassName( Args&... args ):
      // explicit ClassName( Args&&... args ):
      explicit ClassName( Args... args ):
         _mem( args... ), _mem_ptr( &args... ) {
         // Method to print all arguments in order without adding any extra characters.
         ( std::cout << ... << args ) << std::endl;
         // Method to print all arguments'addresses in order without adding any extra characters.
         ( std::cout << ... << &args ) << std::endl;
         // Method to print all ++arguments in order without adding any extra characters.
         ( std::cout << ... << ++args ) << std::endl;
         // Method to add all arguments in order and print the result.
         std::cout << ( ... + args ) << std::endl;
         // Method to multiple all arguments in order and print the result.
         std::cout << ( ... * args ) << std::endl;
         // Method to && all arguments in order and print the result.
         std::cout << ( ... && args ) << std::endl;
         // Method to || all arguments in order and print the result.
         std::cout << ( ... || args ) << std::endl;
      };

      // Method to get an element by index.
      template< std::size_t Index > decltype( auto ) get() {
         return std::get< Index >( _mem );
      };

      // Others.

   private:
      std::tuple< Args... > _mem;        // Store arguments in a tuple.
      std::tuple< Args*... > _mem_ptr;   // Store arguments's addresses in a tuple.
      // Others
};

int main() {
   ClassName< ArgType1, ArgType2, ArgType3, /* and so on */ > obj(
      arg1, arg2, arg3, /* and so on */ );

   // Access specific elements by index.
   std::cout << "First element: " << obj.get< 0 >() << std::endl;    // arg1.
   std::cout << "Second element: " << obj.get< 1 >() << std::endl;   // arg2.
   std::cout << "Third element: " << obj.get< 2 >() << std::endl;    // arg3.
   // Others.

   return 0;
}
```

#### Link

1. [`parameter packs` in cplusplus]().
2. [`parameter packs` in cppreference](https://en.cppreference.com/w/cpp/language/parameter_pack).

### Template Parameters with Non-type Parameters

#### Explanation

1. Template parameters can include **non-type parameters**, which are constants of integral or
   enumeration types, pointers, references, or even certain types of non-type template parameters.
2. This feature allows you to create templates that are more flexible and capable of **handling
   specific values alongside types**, enabling **additional control over template behavior and
   structure**.

#### Syntax

```CPP
// Definition syntax.
template< typename T, ..., Type N, ... > class ClassName {
   ...;
};
```

```CPP
// Usage syntax.
ClassName< TType, ..., val, ... > var_name;
```

### Constraints and Concepts

#### Explanation

1. Class templates, function templates, and non-template functions (typically members of class
   templates) might be associated with **a constraint**, which **specifies the requirements on
   template arguments**, which can be **used to select the most appropriate function overloads and
   template specializations**.
2. **Named sets of such requirements** are called **concepts**. Each concept is a predicate,
   evaluated at compile time, and becomes a part of the interface of a template where it is used as
   a constraint:

#### Links

1. [`constraints and concepts` in cplusplus]().
2. [`constraints and concepts` in cppreference](https://en.cppreference.com/w/cpp/language/constraints).

### SFINAE (Substitution Failure Is Not An Error)

#### Explanation

1. It is **a principle** that **allows template substitutions to fail** and **may** still **result
   in a compilation error** — **but** it is **not treated as an error** in the context of template
   instantiation.
2. This is useful for **enabling or disabling templates based on certain conditions**.
3. **`std::enable_if`** is a common tool for implementing SFINAE, there are other techniques and
   constructs that can also be used, such as function overloading, template specialization, type
   traits, constraints and concepts in templates, and more.
   - If a function template cannot be instantiated due to type mismatches, the compiler simply
     ignores that overload instead of producing an error.
   - If a template specialization cannot be matched, it will not result in an error but rather allow
     the compiler to try other template.
   - Its declaration syntax:
     ```CPP
     template< bool B, class T = void > struct enable_if; // It has a public member typedef `type`, equal to `T`.
     ```
   - Its implementation syntax:
     ```CPP
     template< bool B, class T = void > struct enable_if {};   // Primary template.
     // Partial specialization for the case when B is true.
     template< class T > struct enable_if< true, T > {
           using type = T;
     };
     ```
   - Its helper types:
     ```CPP
     template< bool B, class T = void >
     using enable_if_t = typename enable_if< B, T >::type;
     ```

#### Syntax

```CPP
// With `std::enable_if`.
#include <type_traits>

// In this, `TypeTrait` is a template function (or class or structure,
// even with the `constexpr` keyword) in the header `<type_traits>`,
// for example, `std::is_integral`.
template< typename T, ... >
typename std::enable_if< TypeTrait< T, ... >::value >::type funcName( T para, ... ) {
   // If T, ... meet specific conditions.
   // Do something.
}

template< typename T, ... >
typename std::enable_if< !TypeTrait< T >::value >::type funcName( T para, ... ) {
   // If T is not a specific type.
   // Do something.
}
```

```CPP
// With `std::enable_if`.
#include <type_traits>

// In this, `TypeTrait` is a template function (or class or structure,
// even with the `constexpr` keyword) in the header `<type_traits>`,
// for example, `std::is_integral`.
template< typename T,
          typename std::enable_if< TypeTrait< T, ... >::value >::type,
          ... >
RetType funcName( T para, ... ) {
   // If T, ... meet specific conditions.
   // Do something.
}

template< typename T,
          typename std::enable_if< !TypeTrait< T >::value >::type,
          ... >
RetType funcName( T para, ... ) {
   // If T is not a specific type.
   // Do something.
}
```

```CPP
// With constraints and concepts.
#include <type_traits>

// In this, `TypeTrait` is a template function (or class or structure,
// even with the `constexpr` keyword) in the header <type_traits>,
// for example, std::is_integral
template< typename T, ... > concept TempName = TypeTrait< T, ... >;
template< TempName T, ... > RetType funcName( T para, ... ) {
   // This function is only enabled for specific conditions
}
```

### Type Traits

#### Explanation

1. Type traits are **a set of template classes (or structures or functions** even with the
   `constexpr` keyword) provided by the C++ Standard Library that allow you to **query and
   manipulate type information at compile time**.
2. They can be **combined** with various techniques used to **complete evaluations at compile
   time**, such as `static const`, `constexpr`, `templates`, `std::enable_if`, `static_assert`, and
   more.
3. All type traits are in the header **`<type_traits>`**.

#### Syntax

```CPP
// Using templates and `static_assert` to implement a type trait.
template< typename T > struct IsPointer {
      static const bool val = false;   // Default case.
};

template< typename T > struct IsPointer< T* > {
      static const bool val = true;   // Specialization for pointers.
};

// Usage.
static_assert( IsPointer< int* >::val, "Should be a pointer type" );
static_assert( !IsPointer< int >::val, "Should not be a pointer type" );
```

```CPP
// Using a type trait with `static_assert`.
#include <type_traits>

// In this, `TypeTrait` is a template function (or class or structure,
// even with the `constexpr` keyword) in the header <type_traits>,
// for example, `std::is_integral`.
template< typename T, ... > RetType funcName( T t, ... ) {
   static_assert( TypeTrait< T >::value, "T must be a specific type" );
   // Do something.
}
```

### Template Aliases

1. [`using`](./UsingTypedefNameSpaces.md#using)

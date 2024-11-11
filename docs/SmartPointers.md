<!-- vim-markdown-toc GFM -->

- [Smart Pointers (Scoped Pointers)](#smart-pointers-scoped-pointers)
  - [Explanation](#explanation)
  - [Unique Pointers (`std::unique_ptr`)](#unique-pointers-stdunique_ptr)
    - [Explanation](#explanation-1)
    - [Declaration Syntax](#declaration-syntax)
    - [Initialization Syntax](#initialization-syntax)
    - [Members and Related Stuffs](#members-and-related-stuffs)
      - [Links](#links)
      - [Member Types](#member-types)
      - [Member Functions](#member-functions)
      - [Non-member Functions](#non-member-functions)
      - [Helper Classes](#helper-classes)
  - [Shared Pointers (`std::shared_ptr`)](#shared-pointers-stdshared_ptr)
    - [Explanation](#explanation-2)
    - [Declaration Syntax](#declaration-syntax-1)
    - [Initialization Syntax](#initialization-syntax-1)
    - [Members and Related Stuffs](#members-and-related-stuffs-1)
      - [Links](#links-1)
      - [Member Types](#member-types-1)
      - [Member Functions](#member-functions-1)
      - [Non-member Functions](#non-member-functions-1)
      - [Helper Classes](#helper-classes-1)
  - [Weak Pointers (`std::weak_ptr`)](#weak-pointers-stdweak_ptr)
    - [Explanation](#explanation-3)
    - [Declaration Syntax](#declaration-syntax-2)
    - [Initialization Syntax](#initialization-syntax-2)
    - [Circular References](#circular-references)
      - [Explanation](#explanation-4)
      - [Examples](#examples)
    - [Members and Related Stuffs](#members-and-related-stuffs-2)
      - [Links](#links-2)
      - [Member Types](#member-types-2)
      - [Member Functions](#member-functions-2)
      - [Non-member Functions](#non-member-functions-2)
      - [Helper Classes](#helper-classes-2)

<!-- vim-markdown-toc -->

## Smart Pointers (Scoped Pointers)

### Explanation

1. Smart pointers are **wrapper classes (template classes)** about **a real raw pointer** that
   **manage dynamically allocated memory**, ensuring that resources are properly released when no
   longer needed.
2. They provide **automatic memory management**, **reducing the risk of memory leaks and dangling
   pointers**.
3. The C++ Standard Library provides **three primary types of smart pointers**: `std::unique_ptr`,
   `std::shared_ptr`, and `std::weak_ptr`.
4. All smart pointers are **scoped pointers**. When they **leave their scope**, they either **cease
   to exist** or **decrease their reference count**.
5. When **designing our own data structure**, **useing a raw pointer instead**.
6. In smart pointers, the pointer operator (or arrow operator, `->`) has been overloaded. Since the
   compiler optimizes pointer operator overloading, `obj_ptr->_mem` and `(*obj_ptr)._mem` **are
   equivalent** to `(obj_ptr)->->_mem` and `(*obj_ptr)->_mem`.
7. **Additionally, the pointer operator can be overloaded to obtain the memory offsets of an
   object's members**.
8. Their header file is `<memory>`.

### Unique Pointers (`std::unique_ptr`)

#### Explanation

1. `std::unique_ptr` is a smart pointer that provides **exclusive ownership of a resource**.
2. Only **one `std::unique_ptr`** can own **a resource** at a time, and its copy-assignment operator
   is deleted to avoid mistakes, so it **cannot be copied**.
3. However, it **can be moved to transfer ownership**.
4. When a `std::unique_ptr` **goes out of scope**, the resource is **automatically deleted**.
5. It **creates an object on the heap** and **automatically deletes** it when it goes out of scope,
   **without** needing to **use `delete`**. Since it is **created on the stack**, there is no
   overhead.

#### Declaration Syntax

```CPP
std::unique_ptr< Type > uptr;
```

#### Initialization Syntax

```CPP
std::unique_ptr< Type > uptr( new Type( ... ) );
```

```CPP
// Common. Recommend.
std::unique_ptr< Type > uptr
   = std::make_unique< Type >( /* constructor arguments */ );
```

```CPP
std::unique_ptr< Type > uptr1
   = std::make_unique< Type >( /* constructor arguments */ );
// Move constructor.
std::unique_ptr< Type > uptr2( std::move( uptr1 ) );
// Optionally set uptr1 to nullptr for clarity.
uptr1 = nullptr;
```

```CPP
// Constructs a `std::unique_ptr` which owns `rptr`, initializing the stored pointer with `rptr`.
Type* rptr = new Type( ... );
std::unique_ptr< Type > uptr( rptr );
// Optionall set rptr to nullptr to indicate it no longer points to a valid object.
rptr = nullptr;
```

#### Members and Related Stuffs

##### Links

1. [`std::unique_ptr` in cplusplus](https://cplusplus.com/reference/memory/unique_ptr/).
2. [`std::unique_ptr` in cppreference](https://en.cppreference.com/w/cpp/memory/unique_ptr).

##### Member Types

1. `pointer`: `std::remove_reference< Deleter >::type::pointer` if that type exists, otherwise `T*`.
   Must satisfy `NullablePointer`.
2. `element_type`: `T`, the type of the object managed by this `unique_ptr`.
3. `deleter_type`: `Deleter`, the function object or lvalue reference to function or to function
   object, to be called from the destructor.

##### Member Functions

1. (constructor): Constructs a new `unique_ptr` (public member function).
2. (destructor): Destructs the managed object if such is present (public member function).
3. `operator=`: Assigns the `unique_ptr` (public member function).
4. `release`: Returns a pointer to the managed object and releases the ownership (public member
   function).
5. `reset`: Replaces the managed object (public member function).
6. `swap`: Swaps the managed objects (public member function).
7. `get`: Returns a pointer to the managed object (public member function).
8. `get_deleter`: Returns the deleter that is used for destruction of the managed object (public
   member function).
9. `operator bool`: Checks if there is an associated managed object (public member function).
10. `operator*`, `operator->`: Dereferences pointer to the managed object (public member function).
11. `operator[]`: Provides indexed access to the managed array (public member function).

##### Non-member Functions

1. `make_unique` (C++14), `make_unique_for_overwrite` (C++20): Creates a unique pointer that manages
   a new object (function template).
2. `operator!=` (removed in C++20), `operator==/</<=/>/>=/<=>` (C++20): Compares to another
   `unique_ptr` or with `nullptr` (function template).
3. `operator<<( std::unique_ptr )` (C++20): Outputs the value of the managed pointer to an output
   stream (function template).
4. `std::swap( std::unique_ptr )`: Specializes the `std::swap` algorithm (function template).

##### Helper Classes

1. `std::hash< std::unique_ptr >`: Hash support for `std::unique_ptr` (class template
   specialization).

### Shared Pointers (`std::shared_ptr`)

#### Explanation

1. `std::shared_ptr` is a type of smart pointer that **enables multiple instances of
   `std::shared_ptr`** to **collectively manage the ownership** of a resource.
2. The implementation of `std::shared_ptr` is contingent upon the specific compiler and standard
   library employed. Most systems implement this functionality using reference counting.
3. Reference counting **maintains a record of the number of references** pointing to a shared
   pointer:
   - Each time **a new reference** is established, **the reference count** is **incremented by
     one**. (**Constructors**)
   - Conversely, each time **a reference** is **removed**, **the count** is **decremented by one**.
   - When **the reference count** is **reduced to zero**, the associated shared pointer is
     **automatically deallocated**. (**Destructors**)
4. This reference counting mechanism **introduces a degree of overhead**.
5. Notably, assigning one `std::shared_ptr` to another results in an increase in the reference
   count, while **assigning a `std::shared_ptr` to a `std::weak_ptr` does not affect the reference
   count**.

#### Declaration Syntax

```CPP
std::shared_ptr< Type > sptr;
```

#### Initialization Syntax

```CPP
// Not recommended. The reference count and the object will be constructed separately.
std::shared_ptr< Type > sptr( new Type( ... ) );
```

```CPP
// Recommended. The reference count and the object will be constructed together, which is more efficient.
std::shared_ptr< Type > sptr = std::make_shared< Type >( /* constructor arguments */ );
```

```CPP
// Recommended. The reference count and the object will be constructed together, which is more efficient.
std::shared_ptr< Type > sptr1 = std::make_shared< Type >( /* constructor arguments */ );
// Copy constructor, the reference count is increased by one.
std::shared_ptr< Type > sptr2 = sptr1;
```

```CPP
// Recommended. The reference count and the object will be constructed together, which is more efficient.
std::shared_ptr< Type > sptr1 = std::make_shared< Type >( /* constructor arguments */ );
// Move constructors.
std::shared_ptr< Type > sptr2 = std::move( sptr1 );
// Optionally set sptr1 to nullptr for clarity.
sptr1 = nullptr;
```

```CPP
// Constructs a `std::shared_ptr` which owns `rptr`, initializing the stored pointer with `rptr`.
Type* rptr = new Type( ... );
std::shared_ptr< Type > sptr( rptr );
// Optionall set rptr to nullptr to indicate it no longer points to a valid object.
rptr = nullptr;
```

```CPP
// Constructs a `std::shared_ptr` which owns `uptr`, initializing the stored pointer with `uptr`.
std::unique_ptr< Type > uptr
   = std::make_unique< Type >( /* constructor arguments */ );
std::shared_ptr< Type > sptr = std::move( uptr );
// Optionally set uptr to nullptr for clarity.
uptr = nullptr;
```

#### Members and Related Stuffs

##### Links

1. [`std::shared_ptr` in cplusplus](https://cplusplus.com/reference/memory/shared_ptr/).
2. [`std::shared_ptr` in cppreference](https://en.cppreference.com/w/cpp/memory/shared_ptr).

##### Member Types

1. `element_type`: `T` (until C++17), `std::remove_extent_t< T >`. (since C++17)
2. `weak_type` (since C++17): `std::weak_ptr< T >`.

##### Member Functions

1. (constructor): Constructs new `shared_ptr` (public member function).
2. (destructor): Destructs the owned object if no more `shared_ptrs` link to it (public member
   function).
3. `operator=`: Assigns the `shared_ptr` (public member function).
4. `reset`: Replaces the managed object (public member function).
5. `swap`: Swaps the managed objects (public member function).
6. `get`: Returns the stored pointer (public member function).
7. `operator*`, `operator->`: Dereferences the stored pointer (public member function).
8. `operator[]` (C++17): Provides indexed access to the stored array (public member function).
9. `use_count`: Returns the number of `shared_ptr` objects referring to the same managed object
   (public member function).
10. `unique` (until C++20): Checks whether the managed object is managed only by the current
    `shared_ptr` object (public member function).
11. `operator bool`: Checks if the stored pointer is not null (public member function).
12. `owner_before`: Provides owner-based ordering of shared pointers (public member function).
13. `owner_hash` (C++26): Provides owner-based hashing of shared pointers (public member function).
14. `owner_equal` (C++26): provides owner-based equal comparison of shared pointers (public member
    function).

##### Non-member Functions

1. `make_shared` (C++20), `make_shared_for_overwrite` (C++20): Creates a shared pointer that manages
   a new object (function template).
2. `allocate_shared` (C++20), `allocate_shared_for_overwrite` (C++20): Creates a shared pointer that
   manages a new object allocated using an allocator (function template).
3. `static_pointer_cast` (C++17), `dynamic_pointer_cast` (C++17), `const_pointer_cast` (C++17),
   `reinterpret_pointer_cast` (C++17): Applies `static_cast`, `dynamic_cast`, `const_cast`, or
   `reinterpret_cast` to the stored pointer (function template).
4. `get_deleter`: returns the deleter of specified type, if owned (function template).
5. `operator==`, `operator!=/</<=/>/>=` (removed in C++20), `operator<=>` (C++20): Compares with
   another `shared_ptr` or with `nullptr` (function template).
6. `operator<<( std::shared_ptr )`: Outputs the value of the stored pointer to an output stream
   (function template).
7. `std::swap( std::shared_ptr )`: Specializes the `std::swap` algorithm (function template).
8. `std::atomic_is_lock_free( std::shared_ptr )`, `std::atomic_load( std::shared_ptr )`,
   `std::atomic_load_explicit( std::shared_ptr )`, `std::atomic_store( std::shared_ptr )`,
   `std::atomic_store_explicit( std::shared_ptr )`, `std::atomic_exchange( std::shared_ptr )`,
   `std::atomic_exchange_explicit( std::shared_ptr )`,
   `std::atomic_compare_exchange_weak( std::shared_ptr )`,
   `std::atomic_compare_exchange_strong( std::shared_ptr )`,
   `std::atomic_compare_exchange_weak_explicit( std::shared_ptr )`,
   `std::atomic_compare_exchange_strong_explicit( std::shared_ptr )`: (deprecated in C++20) (removed
   in C++26) Specializes atomic operations for `std::shared_ptr` (function template).

##### Helper Classes

1. `std::atomic< std::shared_ptr >` (C++20): Atomic shared pointer (class template specialization).
2. `std::hash< std::shared_ptr >`: Hash support for `std::shared_ptr` (class template
   specialization).

### Weak Pointers (`std::weak_ptr`)

#### Explanation

1. `std::weak_ptr` is **a variant of shared pointer** that does **not maintain a reference count**.
2. It does **not take ownership** of the managed object **but allows tracking of an object** managed
   by `std::shared_ptr` without affecting the reference count.
3. This feature is particularly useful for **avoiding circular references** and **ensuring that
   memory is not deallocated**.
4. Since `std::weak_ptr` does not increment the reference count of the resource, it does **not
   influence the resource's lifetime**.
5. **To access the managed resource**, **a `std::weak_ptr` must be converted to a
   `std::shared_ptr`** using the **`lock()` method**.
6. **Assigning a shared pointer to a raw pointer** can **lead to several issues** after the shared
   pointer has been released, **particularly in a multithreaded context** where a raw pointer may be
   **deleted multiple times**.
7. In contrast, `std::weak_ptr` provides a solution to these problems.
8. If **two objects reference one another**, **at least one of the references** **must** be **a weak
   pointer** to **prevent circular dependencies**.
9. Although `std::weak_ptr` does not maintain the resources's lifetime, the best practice is calling
   `reset()` if we do not need a `std::weak_ptr`.

#### Declaration Syntax

```CPP
std::weak_ptr< Type > wptr;
```

#### Initialization Syntax

```CPP
std::shared_ptr< Type > sptr = std::make_shared< Type >( /* constructor arguments */ );
std::weak_ptr< Type > wptr = sptr;
```

```CPP
std::shared_ptr< Type > sptr = std::make_shared< Type >( /* constructor arguments */ );
std::weak_ptr< Type > wptr1 = sptr;
// Copy constructor.
std::weak_ptr< Type > wptr2 = wptr1;
```

```CPP
std::shared_ptr< Type > sptr = std::make_shared< Type >( /* constructor arguments */ );
std::weak_ptr< Type > wptr1 = sptr;
// Move constructor.
std::weak_ptr< Type > wptr2 = std::move( wptr1 );
```

```CPP
std::shared_ptr< Type > sptr = std::make_shared< Type >( /* constructor arguments */ );
std::weak_ptr< Type > wptr = sptr;
wptr.reset();
```

```CPP
std::shared_ptr< Type > sptr1 = std::make_shared< Type >( /* constructor arguments */ );
std::weak_ptr< Type > wptr = sptr1;
auto sptr2 = wptr.lock();
if( sptr2 ) {
   ...;
} else {
   ...
};
```

```CPP
std::shared_ptr< Type > sptr1 = std::make_shared< Type >( /* constructor arguments */ );
std::weak_ptr< Type > wptr = sptr1;
// C++17.
if( auto sptr2 = wptr.lock(); ) {
   ...;
} else {
   ...
};
```

#### Circular References

##### Explanation

1. A circular reference occurs when **two or more objects reference each other in a way** that
   **creates a cycle**.
2. This happens when Object A holds a reference to Object B, and Object B holds a reference back to
   Object A (or when a longer chain of objects reference each other in a loop).
3. This can cause **memory leaks** or **infinite loops**.
4. The best approach is to **use a `weak_ptr`** for references between objects.

##### Examples

```CPP
// Circular references occur.
#include <iostream>
#include <memory>

struct Node {
      std::shared_ptr< Node > next;
      ~Node() { std::cout << "Node destroyed\n"; };
};

int main() {
   auto nodeA = std::make_shared< Node >();
   auto nodeB = std::make_shared< Node >();
   std::cout << nodeA.use_count() << std::endl;
   std::cout << nodeB.use_count() << std::endl;
   nodeA->next = nodeB;   // nodeB.use_count() + 1;
   nodeB->next = nodeA;   // nodeA.use_count() + 1; Creates a circular reference
   std::cout << nodeA.use_count() << std::endl;
   std::cout << nodeB.use_count() << std::endl;
   // Both nodes will never be deleted due to circular reference
   return 0;
};
```

```CPP
// Circular references do not occur.
#include <iostream>
#include <memory>

struct Node {
      std::weak_ptr< Node > next;
      ~Node() { std::cout << "Node destroyed\n"; };
};

int main() {
   auto nodeA = std::make_shared< Node >();
   auto nodeB = std::make_shared< Node >();
   std::cout << nodeA.use_count() << std::endl;
   std::cout << nodeB.use_count() << std::endl;
   nodeA->next = nodeB;
   nodeB->next = nodeA;
   std::cout << nodeA.use_count() << std::endl;
   std::cout << nodeB.use_count() << std::endl;
   // Both nodes will be deleted.
   return 0;
};
```

#### Members and Related Stuffs

##### Links

1. [`std::weak_ptr` in cplusplus](https://cplusplus.com/reference/memory/weak_ptr/).
2. [`std::weak_ptr` in cppreference](https://en.cppreference.com/w/cpp/memory/weak_ptr).

##### Member Types

1. `element_type`: `T` (until C++17), `std::remove_extent_t< T >` (since C++17).

##### Member Functions

1. (constructor): Creates a new `weak_ptr` (public member function).
2. (destructor): Destroys a `weak_ptr` (public member function).
3. `operator=`: Assigns the `weak_ptr` (public member function).
4. `reset`: Releases the ownership of the managed object (public member function).
5. `swap`: Swaps the managed objects (public member function).
6. `use_count`: Returns the number of `shared_ptr` objects that manage the object (public member
   function).
7. `expired`: Checks whether the referenced object was already deleted (public member function).
8. `lock`: Creates a `shared_ptr` that manages the referenced object (public member function).
9. `owner_before`: Provides owner-based ordering of weak pointers (public member function).
10. `owner_hash` (C++26): Provides owner-based hashing of weak pointers (public member function).
11. `owner_equal` (C++26): Provides owner-based equal comparison of weak pointers (public member
    function).

##### Non-member Functions

1. `std::swap( std::weak_ptr )`: Specializes the `std::swap` algorithm (function template).

##### Helper Classes

1. `std::atomic< std::weak_ptr >` (C++20): Atomic weak pointer(class template specialization).

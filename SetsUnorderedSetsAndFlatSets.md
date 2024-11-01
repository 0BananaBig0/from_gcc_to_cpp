<!-- vim-markdown-toc GFM -->

- [Sets](#sets)
  - [Explanation](#explanation)
  - [Declaration Syntax](#declaration-syntax)
  - [Initialization Syntax](#initialization-syntax)
  - [Syntax for Deleting `std::set` Pointers](#syntax-for-deleting-stdset-pointers)
  - [Members and Related Stuffs](#members-and-related-stuffs)
    - [Links](#links)
    - [Template Parameters](#template-parameters)
    - [Member Types](#member-types)
    - [Member Functions](#member-functions)
    - [Non-member Functions](#non-member-functions)
- [Multisets](#multisets)
  - [Explanation](#explanation-1)
  - [Declaration Syntax](#declaration-syntax-1)
  - [Initialization Syntax](#initialization-syntax-1)
  - [Syntax for Deleting `std::multiset` Pointers](#syntax-for-deleting-stdmultiset-pointers)
  - [Members and Related Stuffs](#members-and-related-stuffs-1)
    - [Links](#links-1)
    - [Template Parameters](#template-parameters-1)
    - [Member Types](#member-types-1)
    - [Member Functions](#member-functions-1)
    - [Non-member Functions](#non-member-functions-1)
- [Unordered Sets](#unordered-sets)
  - [Explanation](#explanation-2)
  - [Declaration Syntax](#declaration-syntax-2)
  - [Initialization Syntax](#initialization-syntax-2)
  - [Syntax for Deleting `std::unordered_set` Pointers](#syntax-for-deleting-stdunordered_set-pointers)
  - [Members and Related Stuffs](#members-and-related-stuffs-2)
    - [Links](#links-2)
    - [Template Parameters](#template-parameters-2)
    - [Member Types](#member-types-2)
    - [Member Functions](#member-functions-2)
    - [Non-member Functions](#non-member-functions-2)
- [Unordered Multisets](#unordered-multisets)
  - [Explanation](#explanation-3)
  - [Declaration Syntax](#declaration-syntax-3)
  - [Initialization Syntax](#initialization-syntax-3)
  - [Syntax for Deleting `std::unordered_multiset` Pointers](#syntax-for-deleting-stdunordered_multiset-pointers)
  - [Members and Related Stuffs](#members-and-related-stuffs-3)
    - [Links](#links-3)
    - [Template Parameters](#template-parameters-3)
    - [Member Types](#member-types-3)
    - [Member Functions](#member-functions-3)
    - [Non-member Functions](#non-member-functions-3)
- [Flat Sets](#flat-sets)
  - [Explanation](#explanation-4)
  - [Declaration Syntax](#declaration-syntax-4)
  - [Initialization Syntax](#initialization-syntax-4)
  - [Syntax for Deleting `std::flat_set` Pointers](#syntax-for-deleting-stdflat_set-pointers)
  - [Members and Related Stuffs](#members-and-related-stuffs-4)
    - [Links](#links-4)
    - [Template Parameters](#template-parameters-4)
    - [Member Types](#member-types-4)
    - [Member Objects](#member-objects)
    - [Member Functions](#member-functions-4)
    - [Non-member Functions](#non-member-functions-4)
    - [Helper classes](#helper-classes)
    - [Tags](#tags)
- [Flat Multisets](#flat-multisets)
  - [Explanation](#explanation-5)
  - [Declaration Syntax](#declaration-syntax-5)
  - [Initialization Syntax](#initialization-syntax-5)
  - [Syntax for Deleting `std::flat_multiset` Pointers](#syntax-for-deleting-stdflat_multiset-pointers)
  - [Members and Related Stuffs](#members-and-related-stuffs-5)
    - [Links](#links-5)
    - [Template Parameters](#template-parameters-5)
    - [Member Types](#member-types-5)
    - [Member Objects](#member-objects-1)
    - [Member Functions](#member-functions-5)
    - [Non-member Functions](#non-member-functions-5)
    - [Helper classes](#helper-classes-1)
    - [Tags](#tags-1)

<!-- vim-markdown-toc -->

## Sets

### Explanation

1. Sets are **containers (template classes)** that **store unique elements** following **a specific
   order**.
2. In a set, the value of an element also identifies it (**the value is itself the key**, of type
   `Key`), and **each value must be unique**.
3. **The value** of the elements in a set **cannot be modified** once in the container (the elements
   are always const), but they **can be inserted or removed** from the container.
4. Internally, **the elements** in a set are **always sorted** following a specific strict weak
   ordering criterion indicated **by its internal comparison object** (of type `Compare`).
5. Set containers are generally **slower than `unordered_set`** containers to **access individual
   elements** by their key, but they **allow the direct iteration** on subsets based on their order.
6. Sets are typically **implemented as red–black trees**.
7. Their header files is `<set>`.

### Declaration Syntax

```CPP
std::set< Type > set_name;
```

```CPP
// Not common, not recommend
class Compare {
      bool _reverse;
   public:
      explicit Compare( const bool& rev_param = false ) {
         _reverse = rev_param;
      };
      bool operator()( const Type& lhs, const Type& rhs ) const {
         if( _reverse ) {
            ...
         } else {
            ...
         };
      };
};
std::set< Type, Compare > set_name;
```

```CPP
std::set< Type >* set_ptr;
```

### Initialization Syntax

```CPP
// Initializer list constructor.
std::set< Type > set_name = { ... };
```

```CPP
// Initializer list constructor.
std::set< Type > set_name{ ... };
```

```CPP
// Default constructor. Constructs an empty container.
std::set< Type > set_name;
```

```CPP
// Default constructor. Constructs an empty container.
std::set< Type, Compare > set_name;
```

```CPP
// Default constructor. Constructs an empty container.
std::set< Type, Compare > set_name;
// Copy-constructs the temporary `Compare` class object. Constructs an empty container.
std::set< Type, Compare > re_set_name( Compare( true ) );
```

```CPP
// Copy-constructs the comparison functor `comp` with the contents of compare. Constructs an empty container.
Compare comp;
std::set< Type, Compare  > set_name( comp );
```

```CPP
// Default constructor. Constructs an empty container.
std::set< Type > set_name1;
// Copy constructor.
std::set< Type > set_name2( set_name1 );
```

```CPP
// Default constructor. Constructs an empty container.
std::set< Type > set_name1;
// Copy constructor.
std::set< Type > set_name2 = set_name1;
```

```CPP
// Default constructor. Constructs an empty container.
std::set< Type > set_name1;
// Move constructor.
std::set< Type > set_name2( std::move( set_name1 ) );
```

```CPP
std::set< Type >* set_ptr = new std::set< Type >;
```

```CPP
// Default constructor. Constructs an empty container.
std::set< Type > set_name;
std::set< Type >* set_ptr = new std::set< Type >( set_name );
```

### Syntax for Deleting `std::set` Pointers

```CPP
delete set_ptr;
```

### Members and Related Stuffs

#### Links

1. [`std::set` in cplusplus](https://cplusplus.com/reference/set/set/).
2. [`std::set` in cppreference](https://en.cppreference.com/w/cpp/container/set).

#### Template Parameters

1. `Key`: The type of the elements.
2. `Compare`: A `Compare` type providing a strict weak ordering. By default, the first key (smallest
   key) is at the beginning of the set because its default `Compare` is `std::less< Key >`, which
   sorts the elements in ascending order.
3. `Allocator`: An allocator that is used to acquire/release memory and to construct/destroy the
   elements in that memory.

#### Member Types

1. `key_type`: `Key`.
2. `value_type`: `Key`.
3. `size_type`: Unsigned integer type (usually `std::size_t`).
4. `difference_type`: Signed integer type (usually `std::ptrdiff_t`).
5. `key_compare`: `Compare`.
6. `value_compare`: `Compare`.
7. `allocator_type`: `Allocator`.
8. `reference`: `value_type&`.
9. `const_reference`: `const value_type&`.
10. `pointer`: `Allocator::pointer` (until C++11), `std::allocator_traits< Allocator >::pointer`
    (since C++11).
11. `const_pointer`: `Allocator::const_pointer` (until C++11),
    `std::allocator_traits< Allocator >::const_pointer` (since C++11).
12. `iterator`: Constant `LegacyBidirectionalIterator` to `value_type`.
13. `const_iterator`: `LegacyBidirectionalIterator` to `const value_type`.
14. `reverse_iterator`: `std::reverse_iterator< iterator >`.
15. `const_reverse_iterator`: `std::reverse_iterator< const_iterator >`.
16. `node_type (since C++17)`: A specialization of node handle representing a container node.
17. `insert_return_type (since C++17)`: Type describing the result of inserting a `node_type`, a
    specialization of
    ```CPP
    template< class Iter, class NodeType >
    struct /*unspecified*/
    {
          Iter position;
          bool inserted;
          NodeType node;
    };
    ```
    instantiated with template arguments iterator and `node_type`.

#### Member Functions

1. (constructor): Constructs the set (public member function).
2. (destructor): Destructs the set (public member function).
3. `operator=`: Assigns values to the container (public member function).
4. `get_allocator`: Returns the associated allocator (public member function).
5. `begin`, `cbegin`: Returns an iterator to the beginning (public member function).
6. `end`, `cend`: Returns an iterator to the end (public member function).
7. `rbegin`, `crbegin`: Returns a reverse iterator to the beginning (public member function).
8. `rend`, `crend`: Returns a reverse iterator to the end (public member function).
9. `empty`: Checks whether the container is empty (public member function).
10. `size`: Returns the number of elements (public member function).
11. `max_size`: Returns the maximum possible number of elements (public member function).
12. `clear`: Clears the contents (public member function).
13. `insert`: Inserts elements or nodes(since C++17) (public member function).
14. `insert_range` (C++23): Inserts a range of elements (public member function).
15. `emplace`: Constructs elements in-place (public member function).
16. `emplace_hint`: Constructs elements in-place using a hint (public member function).
17. `erase`: Erases elements (public member function).
18. `swap`: Swaps the contents (public member function).
19. `extract` (C++17): Extracts nodes from the container (public member function).
20. `merge` (C++17): Splices nodes from another container (public member function).
21. `count`: Returns the number of elements matching specific key (public member function).
22. `find`: Finds an element with specific key (public member function).
23. `contains` (C++20): Checks if the container contains an element with specific key (public member
    function).
24. `equal_range`: Returns range of elements matching a specific key (public member function).
25. `lower_bound`: Returns an iterator to the first element not less than the given key (public
    member function).
26. `upper_bound`: Returns an iterator to the first element greater than the given key (public
    member function).
27. `key_comp`: Returns the function that compares keys (public member function).
28. `value_comp`: Returns the function that compares keys in objects of type `value_type` (public
    member function).

#### Non-member Functions

1. `operator==`, `operator!=/</<=/>/>=` (removed in C++20), `operator<=>` (C++20): Lexicographically
   compares the values of two sets (function template).
2. `std::swap( std::set )`: Specializes the `std::swap` algorithm (function template).
3. `erase_if( std::set )` (C++20): Erases all elements satisfying specific criteria (function
   template).

## Multisets

### Explanation

1. Multisets are containers **(template classes)** that **store elements** following **a specific
   order**, and where multiple elements **can have equivalent values**.
2. In a multiset, the value of an element also identifies it (**the value is itself the key**, of
   type `Key`).
3. The value of the elements in a multiset **cannot be modified** once in the container (the
   elements are always const), but they **can be inserted or removed** from the container.
4. Internally, the elements in a multiset are **always sorted** following a specific strict weak
   ordering criterion indicated **by its internal comparison object** (of type `Compare`).
5. Multiset containers are generally **slower than`unordered_multiset`** containers to **access
   individual elements** by their key, but they **allow the direct iteration** on subsets based on
   their order.
6. Multisets are typically **implemented as red–black trees**.
7. Their header files is `<set>`.

### Declaration Syntax

```CPP
std::multiset< Type > mset_name;
```

```CPP
// Not common, not recommend
class Compare {
      bool _reverse;
   public:
      explicit Compare( const bool& rev_param = false ) {
         _reverse = rev_param;
      };
      bool operator()( const Type& lhs, const Type& rhs ) const {
         if( _reverse ) {
            ...
         } else {
            ...
         };
      };
};
std::multiset< Type, Compare > mset_name;
```

```CPP
std::multiset< Type >* mset_ptr;
```

### Initialization Syntax

```CPP
// Initializer list constructor.
std::multiset< Type > mset_name = { ... };
```

```CPP
// Initializer list constructor.
std::multiset< Type > mset_name{ ... };
```

```CPP
// Default constructor. Constructs an empty container.
std::multiset< Type > mset_name;
```

```CPP
// Default constructor. Constructs an empty container.
std::multiset< Type, Compare > mset_name;
```

```CPP
// Default constructor. Constructs an empty container.
std::multiset< Type, Compare > mset_name;
// Copy-constructs the temporary `Compare` class object. Constructs an empty container.
std::multiset< Type, Compare > re_mset_name( Compare( true ) );
```

```CPP
// Copy-constructs the comparison functor `comp` with the contents of compare.  Constructs an empty container.
Compare comp;
std::multiset< Type, Compare  > mset_name( comp );
```

```CPP
// Default constructor. Constructs an empty container.
std::multiset< Type > mset_name1;
// Copy constructor.
std::multiset< Type > mset_name2( mset_name1 );
```

```CPP
// Default constructor. Constructs an empty container.
std::multiset< Type > mset_name1;
// Copy constructor.
std::multiset< Type > mset_name2 = mset_name1;
```

```CPP
// Default constructor. Constructs an empty container.
std::multiset< Type > mset_name1;
// Move constructor.
std::multiset< Type > mset_name2( std::move( mset_name1 ) );
```

```CPP
std::multiset< Type >* mset_ptr = new std::multiset< Type >;
```

```CPP
// Default constructor. Constructs an empty container.
std::multiset< Type > mset_name;
std::multiset< Type >* mset_ptr = new std::multiset< Type >( mset_name );
```

### Syntax for Deleting `std::multiset` Pointers

```CPP
delete mset_ptr;
```

### Members and Related Stuffs

#### Links

1. [`std::multiset` in cplusplus](https://cplusplus.com/reference/set/multiset/).
2. [`std::multiset` in cppreference](https://en.cppreference.com/w/cpp/container/multiset).

#### Template Parameters

1. `Key`: The type of the elements.
2. `Compare`: A `Compare` type providing a strict weak ordering. By default, the first key (smallest
   key) is at the beginning of the multiset because its default `Compare` is `std::less< Key >`,
   which sorts the elements in ascending order.
3. `Allocator`: An allocator that is used to acquire/release memory and to construct/destroy the
   elements in that memory.

#### Member Types

1. `key_type`: `Key`.
2. `value_type`: `Key`.
3. `size_type`: Unsigned integer type (usually `std::size_t`).
4. `difference_type`: Signed integer type (usually `std::ptrdiff_t`).
5. `key_compare`: `Compare`.
6. `value_compare`: `Compare`.
7. `allocator_type`: `Allocator`.
8. `reference`: `value_type&`.
9. `const_reference`: `const value_type&`.
10. `pointer`: `Allocator::pointer` (until C++11), `std::allocator_traits< Allocator >::pointer`
    (since C++11).
11. `const_pointer`: `Allocator::const_pointer` (until C++11),
    `std::allocator_traits< Allocator >::const_pointer` (since C++11).
12. `iterator`: Constant `LegacyBidirectionalIterator` to `value_type`.
13. `const_iterator`: `LegacyBidirectionalIterator` to `const value_type`.
14. `reverse_iterator`: `std::reverse_iterator< iterator >`.
15. `const_reverse_iterator`: `std::reverse_iterator< const_iterator >`.
16. `node_type (since C++17)`: A specialization of node handle representing a container node.

#### Member Functions

1. (constructor): Constructs the multiset (public member function).
2. (destructor): Destructs the multiset (public member function).
3. `operator=`: Assigns values to the container (public member function).
4. `get_allocator`: Returns the associated allocator (public member function).
5. `begin`, `cbegin`: Returns an iterator to the beginning (public member function).
6. `end`, `cend`: Returns an iterator to the end (public member function).
7. `rbegin`, `crbegin`: Returns a reverse iterator to the beginning (public member function).
8. `rend`, `crend`: Returns a reverse iterator to the end (public member function).
9. `empty`: Checks whether the container is empty (public member function).
10. `size`: Returns the number of elements (public member function).
11. `max_size`: Returns the maximum possible number of elements (public member function).
12. `clear`: Clears the contents (public member function).
13. `insert`: Inserts elements or nodes(since C++17) (public member function).
14. `insert_range` (C++23): Inserts a range of elements (public member function).
15. `emplace`: Constructs elements in-place (public member function).
16. `emplace_hint`: Constructs elements in-place using a hint (public member function).
17. `erase`: Erases elements (public member function).
18. `swap`: Swaps the contents (public member function).
19. `extract` (C++17): Extracts nodes from the container (public member function).
20. `merge` (C++17): Splices nodes from another container (public member function).
21. `count`: Returns the number of elements matching specific key (public member function).
22. `find`: Finds an element with specific key (public member function).
23. `contains` (C++20): Checks if the container contains an element with specific key (public member
    function).
24. `equal_range`: Returns range of elements matching a specific key (public member function).
25. `lower_bound`: Returns an iterator to the first element not less than the given key (public
    member function).
26. `upper_bound`: Returns an iterator to the first element greater than the given key (public
    member function).
27. `key_comp`: Returns the function that compares keys (public member function).
28. `value_comp`: Returns the function that compares keys in objects of type `value_type` (public
    member function).

#### Non-member Functions

1. `operator==`, `operator!=/</<=/>/>=` (removed in C++20), `operator<=>` (C++20): Lexicographically
   compares the values of two multisets (function template).
2. `std::swap( std::multiset )`: Specializes the `std::swap` algorithm (function template).
3. `erase_if( std::multiset )` (C++20): Erases all elements satisfying specific criteria (function
   template).

## Unordered Sets

### Explanation

1. Unordered sets are **containers (template classes)** that **store unique elements** in **no
   particular order**, and which allow for **fast retrieval** of individual elements based on their
   value.
2. In an `unordered_set`, **the value of an element is at the same time its key**, that identifies
   it uniquely.
3. Keys are **immutable**, therefore, the elements in an `unordered_set` **cannot be modified** once
   in the container - they **can be inserted and removed**, though.
4. Internally, the elements in the `unordered_set` are **not sorted in any particular order**, but
   **organized into buckets** depending on their **hash values** to allow for **fast access** to
   individual **elements** directly by their values (with **a constant average time complexity on
   average**).
5. `unordered_set` containers are **faster than set containers** to **access individual elements**
   by their key, although they are generally **less efficient for range iteration** through a subset
   of their elements.
6. Iterators in the container are **at least forward iterators**.
7. Their header files is `<unordered_set>`.

### Declaration Syntax

```CPP
std::unordered_set< Type > uset_name;
```

```CPP
// Not common, not recommend
struct Hash {
      std::size_t operator()( const Type& obj ) const {
         // This is only an example.
         return std::hash< SubType1 >()( obj._mem1 )
              ^ std::hash< SubType2 >()( obj._mem2 );
      }
};
struct KeyEqual {
      bool operator()( const Type& lhs, const Type& rhs ) const {
         // This is only an example.
         return lhs.id == rhs.id;   // Custom equality based on id only
      }
};
std::unordered_set< Type, Hash, KeyEqual > uset_name;
```

```CPP
std::unordered_set< Type >* uset_ptr;
```

### Initialization Syntax

```CPP
// Initializer list constructor.
std::unordered_set< Type > uset_name = { ... };
```

```CPP
// Initializer list constructor.
std::unordered_set< Type > uset_name{ ... };
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_set< Type > uset_name;
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_set< Type, Hash, KeyEqual > uset_name;
```

```CPP
// Constructs an empty container.
std::unordered_set< Type, Hash, KeyEqual > uset_name( hash );
```

```CPP
// Constructs an empty container.
std::unordered_set< Type, Hash, KeyEqual > uset_name( hash, key_equal );
```

```CPP
// Constructs an empty container.
std::unordered_set< Type > uset_name( size );
```

```CPP
// Constructs an empty container.
std::unordered_set< Type, Hash, KeyEqual > uset_name( size );
```

```CPP
// Constructs an empty container.
std::unordered_set< Type, Hash, KeyEqual > uset_name( size, hash );
```

```CPP
// Constructs an empty container.
std::unordered_set< Type, Hash, KeyEqual > uset_name( size, hash, key_equal );
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_set< Type > uset_name1;
// Copy constructor.
std::unordered_set< Type > uset_name2( uset_name1 );
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_set< Type > uset_name1;
// Copy constructor.
std::unordered_set< Type > uset_name2 = uset_name1;
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_set< Type > uset_name1;
// Move constructor.
std::unordered_set< Type > uset_name2( std::move( uset_name1 ) );
```

```CPP
std::unordered_set< Type >* uset_ptr = new std::unordered_set< Type >;
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_set< Type > uset_name;
std::unordered_set< Type >* uset_ptr = new std::unordered_set< Type >( uset_name );
```

### Syntax for Deleting `std::unordered_set` Pointers

```CPP
delete uset_ptr;
```

### Members and Related Stuffs

#### Links

1. [`std::unordered_set` in cplusplus](https://cplusplus.com/reference/set/unordered_set/).
2. [`std::unordered_set` in cppreference](https://en.cppreference.com/w/cpp/container/unordered_set).

#### Template Parameters

1. `Key`: The type of the elements.
2. `Hash`: A unary function object type that takes an object of the same type as the elements as
   argument and returns a unique value of type `size_t` based on it. This can either be a class
   implementing a function call operator or a pointer to a function (see constructor for an
   example). This defaults to `std::hash<Key>`, which returns a hash value with a probability of
   collision approaching `1.0/std::numeric_limits<size_t>::max()`. The `unordered_set` object uses
   the hash values returned by this function to organize its elements internally, speeding up the
   process of locating individual elements. Aliased as member type `unordered_set::hasher`.
3. `KeyEqual`: A binary predicate that takes two arguments of the same type as the elements and
   returns a bool. The expression `KeyEqual( a,b )`, where `KeyEqual` is an object of this type and
   `a` and `b` are key values, shall return true if `a` is to be considered equivalent to `b`. This
   can either be a class implementing a function call operator or a pointer to a function (see
   constructor for an example). This defaults to `std::equal_to< Key >`, which returns the same as
   applying the `equal-to operator ( a==b )`. The `unordered_set` object uses this expression to
   determine whether two element keys are equivalent. No two elements in an `unordered_set`
   container can have keys that yield true using this predicate. Aliased as member type
   `unordered_set::key_equal`.
4. `Allocator`: An allocator that is used to acquire/release memory and to construct/destroy the
   elements in that memory.

#### Member Types

1. `key_type`: `Key`.
2. `value_type`: `Key`.
3. `size_type`: Unsigned integer type (usually `std::size_t`).
4. `difference_type`: Signed integer type (usually `std::ptrdiff_t`).
5. `hasher`: `Hash`.
6. `key_equal`: `KeyEqual`.
7. `allocator_type`: `Allocator`.
8. `reference`: `value_type&`.
9. `const_reference`: `const value_type&`.
10. `pointer`: `std::allocator_traits< Allocator >::pointer`.
11. `const_pointer`: `std::allocator_traits< Allocator >::const_pointer`.
12. `iterator`: Constant `LegacyForwardIterator` to `value_type`.
13. `const_iterator`: `LegacyForwardIterator` to `const value_type`.
14. `local_iterator`: An iterator type whose category, value, difference, pointer and reference
    types are the same as iterator. This iterator can be used to iterate through a single bucket but
    not across buckets
15. `const_local_iterator`: An iterator type whose category, value, difference, pointer and
    reference types are the same as `const_iterator`. This iterator can be used to iterate through a
    single bucket but not across buckets
16. `node_type (since C++17)`: A specialization of node handle representing a container node.
17. `insert_return_type` (since C++17): Type describing the result of inserting a `node_type`, a
    specialization of
    ```CPP
    template< class Iter, class NodeType >
    struct /*unspecified*/
    {
          Iter position;
          bool inserted;
          NodeType node;
    };
    ```
    instantiated with template arguments iterator and `node_type`.

#### Member Functions

1. (constructor): Constructs the unordered set (public member function).
2. (destructor): Destructs the unordered set (public member function).
3. `operator=`: Assigns values to the container (public member function).
4. `get_allocator`: Returns the associated allocator (public member function).
5. `begin`, `cbegin`: Returns an iterator to the beginning (public member function).
6. `end`, `cend`: Returns an iterator to the end (public member function).
7. `empty`: Checks whether the container is empty (public member function).
8. `size`: Returns the number of elements (public member function).
9. `max_size`: Returns the maximum possible number of elements (public member function).
10. `clear`: Clears the contents (public member function).
11. `insert`: Inserts elements or nodes(since C++17) (public member function).
12. `insert_range` (C++23): Inserts a range of elements (public member function).
13. `emplace`: Constructs elements in-place (public member function).
14. `emplace_hint`: Constructs elements in-place using a hint (public member function).
15. `erase`: Erases elements (public member function).
16. `swap`: Swaps the contents (public member function).
17. `extract` (C++17): Extracts nodes from the container (public member function).
18. `merge` (C++17): Splices nodes from another container (public member function).
19. `count`: Returns the number of elements matching specific key (public member function).
20. `find`: Finds an element with specific key (public member function).
21. `contains` (C++20): Checks if the container contains an element with specific key (public member
    function).
22. `equal_range`: Returns range of elements matching a specific key (public member function).
23. `begin( size_type )`, `cbegin( size_type )`: Returns an iterator to the beginning of the
    specified bucket (public member function).
24. `end( size_type )`, `cend( size_type )`: Returns an iterator to the end of the specified bucket
    (public member function).
25. `bucket_count`: Returns the number of buckets (public member function).
26. `max_bucket_count`: Returns the maximum number of buckets (public member function).
27. `bucket_size`: Returns the number of elements in specific bucket (public member function).
28. `bucket`: Returns the bucket for specific key (public member function).
29. `load_factor`: Returns average number of elements per bucket (public member function).
30. `max_load_factor`: Manages maximum average number of elements per bucket (public member
    function).
31. `rehash`: Reserves at least the specified number of buckets and regenerates the hash table
    (public member function).
32. `reserve`: Reserves space for at least the specified number of elements and regenerates the hash
    table (public member function).
33. `hash_function`: Returns function used to hash the keys (public member function).
34. `key_eq`: Returns the function used to compare keys for equality (public member function).

#### Non-member Functions

1. `operator==`, `operator!=` (removed in C++20): Lexicographically compares the values of two
   unordered sets (function template).
2. `std::swap( std::unordered_set )`: Specializes the `std::swap` algorithm (function template).
3. `erase_if( std::unordered_set )` (C++20): Erases all elements satisfying specific criteria
   (function template).

## Unordered Multisets

### Explanation

1. Unordered multisets are **containers (template classes)** that **store elements** in **no
   particular order**, allowing **fast retrieval** of individual elements based on their value, much
   like `unordered_set` containers, but **allowing** different elements to **have equivalent
   values**.
2. In an `unordered_multiset`, **the value of an element is at the same time its key**, used to
   identify it.
3. Keys are **immutable**, therefore, the elements in an `unordered_multiset` **cannot be modified**
   once in the container - they **can be inserted and removed**, though.
4. Internally, the elements in the `unordered_multiset` are **not sorted in any particular**, but
   **organized into buckets** depending on their **hash values** to allow for **fast access** to
   individual **elements** directly by their values (with **a constant average time complexity on
   average**).
5. Elements with **equivalent values** are **grouped together in the same bucket** and in such a way
   that an iterator (see `equal_range`) can iterate through all of them.
6. Iterators in the container are **at least forward iterators**.
7. Their header files is `<unordered_set>`.

### Declaration Syntax

```CPP
std::unordered_multiset< Type > umset_name;
```

```CPP
// Not common, not recommend
struct Hash {
      std::size_t operator()( const Type& obj ) const {
         // This is only an example.
         return std::hash< SubType1 >()( obj._mem1 )
              ^ std::hash< SubType2 >()( obj._mem2 );
      }
};
struct KeyEqual {
      bool operator()( const Type& lhs, const Type& rhs ) const {
         // This is only an example.
         return lhs.id == rhs.id;   // Custom equality based on id only
      }
};
std::unordered_multiset< Type, Hash, KeyEqual > umset_name;
```

```CPP
std::unordered_multiset< Type >* umset_ptr;
```

### Initialization Syntax

```CPP
// Initializer list constructor.
std::unordered_multiset< Type > umset_name = { ... };
```

```CPP
// Initializer list constructor.
std::unordered_multiset< Type > umset_name{ ... };
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_multiset< Type > umset_name;
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_multiset< Type, Hash, KeyEqual > umset_name;
```

```CPP
// Constructs an empty container.
std::unordered_multiset< Type, Hash, KeyEqual > umset_name( hash );
```

```CPP
// Constructs an empty container.
std::unordered_multiset< Type, Hash, KeyEqual > umset_name( hash, key_equal );
```

```CPP
// Constructs an empty container.
std::unordered_multiset< Type > umset_name( size );
```

```CPP
// Constructs an empty container.
std::unordered_multiset< Type, Hash, KeyEqual > umset_name( size );
```

```CPP
// Constructs an empty container.
std::unordered_multiset< Type, Hash, KeyEqual > umset_name( size, hash );
```

```CPP
// Constructs an empty container.
std::unordered_multiset< Type, Hash, KeyEqual > umset_name( size, hash, key_equal );
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_multiset< Type > umset_name1;
// Copy constructor.
std::unordered_multiset< Type > umset_name2( umset_name1 );
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_multiset< Type > umset_name1;
// Copy constructor.
std::unordered_multiset< Type > umset_name2 = umset_name1;
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_multiset< Type > umset_name1;
// Move constructor.
std::unordered_multiset< Type > umset_name2( std::move( umset_name1 ) );
```

```CPP
std::unordered_multiset< Type >* umset_ptr = new std::unordered_multiset< Type >;
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_multiset< Type > umset_name;
std::unordered_multiset< Type >* umset_ptr = new std::unordered_multiset< Type >( umset_name );
```

### Syntax for Deleting `std::unordered_multiset` Pointers

```CPP
delete umset_ptr;
```

### Members and Related Stuffs

#### Links

1. [`std::unordered_multiset` in cplusplus](https://cplusplus.com/reference/unordered_set/unordered_multiset/).
2. [`std::unordered_multiset` in cppreference](https://en.cppreference.com/w/cpp/container/unordered_multiset).

#### Template Parameters

1. `Key`: The type of the elements.
2. `Hash`: A unary function object type that takes an object of the same type as the elements as
   argument and returns a unique value of type `size_t` based on it. This can either be a class
   implementing a function call operator or a pointer to a function (see constructor for an
   example). This defaults to `std::hash<Key>`, which returns a hash value with a probability of
   collision approaching `1.0/std::numeric_limits<size_t>::max()`. The `unordered_multiset` object
   uses the hash values returned by this function to organize its elements internally, speeding up
   the process of locating individual elements. Aliased as member type `unordered_multiset::hasher`.
3. `KeyEqual`: A binary predicate that takes two arguments of the same type as the elements and
   returns a bool. The expression `KeyEqual( a,b )`, where `KeyEqual` is an object of this type and
   `a` and `b` are key values, shall return true if `a` is to be considered equivalent to `b`. This
   can either be a class implementing a function call operator or a pointer to a function (see
   constructor for an example). This defaults to `std::equal_to< Key >`, which returns the same as
   applying the `equal-to operator ( a==b )`. The `unordered_multiset` object uses this expression
   to determine whether two element keys are equivalent. No two elements in an `unordered_multiset`
   container can have keys that yield true using this predicate. Aliased as member type
   `unordered_multiset::key_equal`.
4. `Allocator`: An allocator that is used to acquire/release memory and to construct/destroy the
   elements in that memory.

#### Member Types

1. `key_type`: `Key`.
2. `value_type`: `Key`.
3. `size_type`: Unsigned integer type (usually `std::size_t`).
4. `difference_type`: Signed integer type (usually `std::ptrdiff_t`).
5. `hasher`: `Hash`.
6. `key_equal`: `KeyEqual`.
7. `allocator_type`: `Allocator`.
8. `reference`: `value_type&`.
9. `const_reference`: `const value_type&`.
10. `pointer`: `std::allocator_traits< Allocator >::pointer`.
11. `const_pointer`: `std::allocator_traits< Allocator >::const_pointer`.
12. `iterator`: Constant `LegacyForwardIterator` to `value_type`.
13. `const_iterator`: `LegacyForwardIterator` to `const value_type`.
14. `local_iterator`: An iterator type whose category, value, difference, pointer and reference
    types are the same as iterator. This iterator can be used to iterate through a single bucket but
    not across buckets
15. `const_local_iterator`: An iterator type whose category, value, difference, pointer and
    reference types are the same as `const_iterator`. This iterator can be used to iterate through a
    single bucket but not across buckets
16. `node_type (since C++17)`: A specialization of node handle representing a container node.

#### Member Functions

1. (constructor): Constructs the unordered multiset (public member function).
2. (destructor): Destructs the unordered multiset (public member function).
3. `operator=`: Assigns values to the container (public member function).
4. `get_allocator`: Returns the associated allocator (public member function).
5. `begin`, `cbegin`: Returns an iterator to the beginning (public member function).
6. `end`, `cend`: Returns an iterator to the end (public member function).
7. `empty`: Checks whether the container is empty (public member function).
8. `size`: Returns the number of elements (public member function).
9. `max_size`: Returns the maximum possible number of elements (public member function).
10. `clear`: Clears the contents (public member function).
11. `insert`: Inserts elements or nodes(since C++17) (public member function).
12. `insert_range` (C++23): Inserts a range of elements (public member function).
13. `emplace`: Constructs elements in-place (public member function).
14. `emplace_hint`: Constructs elements in-place using a hint (public member function).
15. `erase`: Erases elements (public member function).
16. `swap`: Swaps the contents (public member function).
17. `extract` (C++17): Extracts nodes from the container (public member function).
18. `merge` (C++17): Splices nodes from another container (public member function).
19. `count`: Returns the number of elements matching specific key (public member function).
20. `find`: Finds an element with specific key (public member function).
21. `contains` (C++20): Checks if the container contains an element with specific key (public member
    function).
22. `equal_range`: Returns range of elements matching a specific key (public member function).
23. `begin( size_type )`, `cbegin( size_type )`: Returns an iterator to the beginning of the
    specified bucket (public member function).
24. `end( size_type )`, `cend( size_type )`: Returns an iterator to the end of the specified bucket
    (public member function).
25. `bucket_count`: Returns the number of buckets (public member function).
26. `max_bucket_count`: Returns the maximum number of buckets (public member function).
27. `bucket_size`: Returns the number of elements in specific bucket (public member function).
28. `bucket`: Returns the bucket for specific key (public member function).
29. `load_factor`: Returns average number of elements per bucket (public member function).
30. `max_load_factor`: Manages maximum average number of elements per bucket (public member
    function).
31. `rehash`: Reserves at least the specified number of buckets and regenerates the hash table
    (public member function).
32. `reserve`: Reserves space for at least the specified number of elements and regenerates the hash
    table (public member function).
33. `hash_function`: Returns function used to hash the keys (public member function).
34. `key_eq`: Returns the function used to compare keys for equality (public member function).

#### Non-member Functions

1. `operator==`, `operator!=` (removed in C++20): Lexicographically compares the values of two
   unordered sets (function template).
2. `std::swap( std::unordered_multiset )`: Specializes the `std::swap` algorithm (function
   template).
3. `erase_if( std::unordered_multiset )` (C++20): Erases all elements satisfying specific criteria
   (function template).

## Flat Sets

### Explanation

1. Flat sets are a container adaptor that **store unique elements** following **a specific order**.
2. In a flat set, the value of an element also identifies it (**the value is itself the key**, of
   type `Key`), and **each value must be unique**.
3. **The value** of the elements in a flat set **cannot be modified** once in the container (the
   elements are always const), but they **can be inserted or removed** from the container.
4. Internally, **the elements** in a `flat_set` are stored **in a sorted manner** using **a
   contiguous memory structure**, which allows for **efficient access and iteration**.
5. `flat_set` containers are generally **faster than set** containers for **accessing** individual
   **elements** by their key due to their underlying array structure, but they require that elements
   **be kept sorted upon insertion**.
6. `flat_set` is typically **implemented as a sorted vector**, allowing for **efficient searching
   and iteration**.
7. The **class template** `flat_set` **acts as a wrapper** to the underlying sorted container passed
   as object of type `KeyContainer`.
8. The header file for `flat_set` is `<experimental/flat_set>` (or may be found in other namespaces
   in different implementations).

### Declaration Syntax

```CPP
std::flat_set< Type > fset_name;
```

```CPP
// Not common, not recommend
class Compare {
      bool _reverse;

   public:
      explicit Compare( const bool& rev_param = false ) {
         _reverse = rev_param;
      };

      bool operator()( const Type& lhs, const Type& rhs ) const {
         if( _reverse ) {
            ...
         } else {
            ...
         };
      };
};
std::flat_set< Type, Compare > fset_name;
```

```CPP
// Not common, not recommend
std::flat_set< Type, KeyContainer< Type >, Compare > fset_name;
```

```CPP
std::flat_set< Type, std::vector< Type >, Compare > fset_name;
```

```CPP
std::flat_set< Type >* fset_ptr;
```

### Initialization Syntax

```CPP
// Default constructor. Constructs an empty container adaptor.
std::flat_set< Type > fset_name;
```

```CPP
// Default constructor.  Constructs an empty container adaptor.
std::flat_set< Type, Compare, KeyContainer< Type > > fset_name;
```

```CPP
// Constructs the underlying container by copying the contents of the container `cont`.
// Construct a default `comp` to sort all elements.
KeyContainer< Type > cont = { ... };
std::flat_set< Type, Compare, KeyContainer< Type > > fset_name( cont );
```

```CPP
// Constructs the underlying container by copying the contents of the container `cont`.
// Copy the `comp` to sort all elements.
KeyContainer< Type > cont = { ... };
Compare comp;
std::flat_set< Type, Compare, KeyContainer< Type > > fset_name( cont, comp );
```

```CPP
// Specify that all elements are unique. Just a tag.
// Constructs the underlying container by `std::move( cont )`.
// Construct a default `comp` to sort all elements.
std::sorted_unique_t s;
KeyContainer< Type > cont = { ... };
Compare comp;
std::flat_set< Type, Compare, KeyContainer< Type > > fset_name( s, cont );
```

```CPP
// Specify that all elements are unique. Just a tag.
// Constructs the underlying container by `std::move( cont )`.
// Copy the `comp` to sort all elements.
std::sorted_unique_t s:
KeyContainer< Type > cont = { ... };
Compare comp;
std::flat_set< Type, Compare, KeyContainer< Type > > fset_name( s, cont, comp );
```

```CPP
// Specify that all elements are unique. Just a tag.
// Move the content of the underlying container.
// Copy the content of the `comp`.
std::sorted_unique_t s;
Compare comp;
std::flat_set< Type, Compare, KeyContainer< Type >  > fset_name( s, KeyContainer< Type >{ ... }, comp );
```

```CPP
// Copy-constructs the comparison functor `comp` with the contents of compare. Value-initializes the underlying container.
Compare comp;
std::flat_set< Type, Compare, KeyContainer< Type >  > fset_name( comp );
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::flat_set< Type > fset_name1;
// Copy constructor.
std::flat_set< Type > fset_name2( fset_name1 );
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::flat_set< Type > fset_name1;
// Copy constructor.
std::flat_set< Type > fset_name2 = fset_name1;
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::flat_set< Type > fset_name1;
// Move constructor.
std::flat_set< Type > fset_name2( std::move( fset_name1 ) );
```

```CPP
std::flat_set< Type >* fset_ptr = new std::flat_set< Type >;
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::flat_set< Type > fset_name;
std::flat_set< Type >* fset_ptr = new std::flat_set< Type >( fset_name );
```

### Syntax for Deleting `std::flat_set` Pointers

```CPP
delete fset_ptr;
```

### Members and Related Stuffs

#### Links

1. [`std::flat_set` in cplusplus]().
2. [`std::flat_set` in cppreference](https://en.cppreference.com/w/cpp/container/flat_set).

#### Template Parameters

1. `Key`: The type of the elements.
2. `Compare`: A `Compare` type providing a strict weak ordering. By default, the first key (smallest
   key) is at the beginning of the flat set because its default `Compare` is `std::less< Key >`,
   which sorts the elements in ascending order.
3. `KeyContainer`: The type of the underlying SequenceContainer to store the elements. The iterators
   of such container should satisfy `LegacyRandomAccessIterator` or model `random_access_iterator`.
   The standard containers `std::vector` and `std::deque` satisfy these requirements.

#### Member Types

1. `containre_type`: `KeyContainer`.
2. `key_type`: `Key`.
3. `value_type`: `Key`.
4. `key_compare`: `Compare`.
5. `value_compare`: `Compare`.
6. `reference`: `value_type&`.
7. `const_reference`: `const value_type&`.
8. `size_type`: `typename KeyContainer::size_type`.
9. `difference_type`: `typename KeyContainer::difference_type`.
10. `iterator`: Implementation-defined `LegacyRandomAccessIterator` and `random_access_iterator` to
    `value_type`.
11. `const_iterator`: Implementation-defined `LegacyRandomAccessIterator` and
    `random_access_iterator` to `const value_type`.
12. `reverse_iterator`: `std::reverse_iterator< iterator >`.
13. `const_reverse_iterator`: `std::reverse_iterator< const_iterator >`.

#### Member Objects

1. `c` (`private`): The underlying container of `container_type` (exposition-only member object`*`).
2. `compare` (`private`): The comparison function object of type `key_compare` (exposition-only
   member object`*`).

#### Member Functions

1. (constructor): Constructs the flat set (public member function).
2. (destructor) (implicitly declared): Destroys every element of the container adaptor (public
   member function).
3. `operator=`: Assigns values to the container adaptor (public member function).
4. `begin`, `cbegin`: Returns an iterator to the beginning (public member function).
5. `end`, `cend`: Returns an iterator to the end (public member function).
6. `rbegin`, `crbegin`: Returns a reverse iterator to the beginning (public member function).
7. `rend`, `crend`: Returns a reverse iterator to the end (public member function).
8. `empty`: Checks whether the container adaptor is empty (public member function).
9. `size`: Returns the number of elements (public member function).
10. `max_size`: Returns the maximum possible number of elements (public member function).
11. `emplace`: Constructs elements in-place (public member function).
12. `emplace_hint`: Constructs elements in-place using a hint (public member function).
13. `insert`: Inserts elements (public member function).
14. `insert_range`: Inserts a range of elements (public member function).
15. `extract`: Extracts the underlying container (public member function).
16. `replace`: Replaces the underlying container (public member function).
17. `erase`: Erases elements (public member function).
18. `swap`: Swaps the contents (public member function).
19. `clear`: Clears the contents (public member function).
20. `find`: Finds an element with specific key (public member function).
21. `count`: Returns the number of elements matching specific key (public member function).
22. `contains`: Checks if the container contains an element with specific key (public member
    function).
23. `lower_bound`: Returns an iterator to the first element not less than the given key (public
    member function).
24. `upper_bound`: Returns an iterator to the first element greater than the given key (public
    member function).
25. `equal_range`: Returns range of elements matching a specific key (public member function).
26. `key_comp`: Returns the function that compares keys (public member function).
27. `value_comp`: Returns the function that compares keys in objects of type `value_type` (public
    member function).

#### Non-member Functions

1. `operator==`, `operator<=>`: Lexicographically compares the values of two flat sets (function
   template).
2. `std::swap( std::flat_set )`: Specializes the `std::swap` algorithm (function template).
3. `erase_if( std::flat_set )`: Erases all elements satisfying specific criteria (function
   template).

#### Helper classes

1. `std::uses_allocator< std::flat_set >` (C++23): Specializes the `std::uses_allocat` or type trait
   (class template specialization).

#### Tags

1. `sorted_unique`, `sorted_unique_t` (C++23): indicates that elements of a range are sorted and
   unique (tag).

## Flat Multisets

### Explanation

1. Multilat sets are a container adaptor that **store elements** following **a specific order**.
2. In a flat multiset, the value of an element also identifies it (**the value is itself the key**,
   of type `Key`), but **each value does not need to be unique**.
3. **The value** of the elements in a flat multiset **cannot be modified** once in the container
   (the elements are always const), but they **can be inserted or removed** from the container.
4. Internally, **the elements** in a `flat_multiset` are stored **in a sorted manner** using **a
   contiguous memory structure**, which allows for **efficient access and iteration**.
5. `flat_multiset` containers are generally **faster than set** containers for **accessing**
   individual **elements** by their key due to their underlying array structure, but they require
   that elements **be kept sorted upon insertion**.
6. `flat_multiset` is typically **implemented as a sorted vector**, allowing for **efficient
   searching and iteration**.
7. The **class template** `flat_multiset` **acts as a wrapper** to the underlying sorted container
   passed as object of type `KeyContainer`.
8. The header file for `flat_multiset` is `<experimental/flat_set>` (or may be found in other
   namespaces in different implementations).

### Declaration Syntax

```CPP
std::flat_multiset< Type > fmset_name;
```

```CPP
// Not common, not recommend
class Compare {
      bool _reverse;

   public:
      explicit Compare( const bool& rev_param = false ) {
         _reverse = rev_param;
      };

      bool operator()( const Type& lhs, const Type& rhs ) const {
         if( _reverse ) {
            ...
         } else {
            ...
         };
      };
};
std::flat_multiset< Type, Compare > fmset_name;
```

```CPP
// Not common, not recommend
std::flat_multiset< Type, KeyContainer< Type >, Compare > fmset_name;
```

```CPP
std::flat_multiset< Type, std::vector< Type >, Compare > fmset_name;
```

```CPP
std::flat_multiset< Type >* fmset_ptr;
```

### Initialization Syntax

```CPP
// Default constructor. Constructs an empty container adaptor.
std::flat_multiset< Type > fmset_name;
```

```CPP
// Default constructor. Constructs an empty container adaptor.
std::flat_multiset< Type, Compare, KeyContainer< Type > > fmset_name;
```

```CPP
// Constructs the underlying container by copying the contents of the container `cont`.
// Construct a default `comp` to sort all elements.
KeyContainer< Type > cont = { ... };
std::flat_multiset< Type, Compare, KeyContainer< Type > > fmset_name( cont );
```

```CPP
// Constructs the underlying container by copying the contents of the container `cont`.
// Copy the `comp` to sort all elements.
KeyContainer< Type > cont = { ... };
Compare comp;
std::flat_multiset< Type, Compare, KeyContainer< Type > > fmset_name( cont, comp );
```

```CPP
// Allow different elements with the same value. Just a tag.
// Constructs the underlying container by `std::move( cont )`.
// Construct a default `comp` to sort all elements.
std::sorted_equivalent_t s;
KeyContainer< Type > cont = { ... };
Compare comp;
std::flat_multiset< Type, Compare, KeyContainer< Type > > fmset_name( s, cont );
```

```CPP
// Allow different elements with the same value. Just a tag.
// Constructs the underlying container by `std::move( cont )`.
// Copy the `comp` to sort all elements.
std::sorted_equivalent_t s;
KeyContainer< Type > cont = { ... };
Compare comp;
std::flat_multiset< Type, Compare, KeyContainer< Type > > fmset_name( s, cont, comp );
```

```CPP
// Allow different elements with the same value. Just a tag.
// Move the content of the underlying container.
// Copy the content of the `comp`.
std::sorted_equivalent_t s;
Compare comp;
std::flat_multiset< Type, Compare, KeyContainer< Type >  > fmset_name( s, KeyContainer< Type >{ ... }, comp );
```

```CPP
// Copy-constructs the comparison functor `comp` with the contents of compare. Value-initializes the underlying container.
Compare comp;
std::flat_multiset< Type, Compare, KeyContainer< Type >  > fmset_name( comp );
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::flat_multiset< Type > fmset_name1;
// Copy constructor.
std::flat_multiset< Type > fmset_name2( fmset_name1 );
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::flat_multiset< Type > fmset_name1;
// Copy constructor.
std::flat_multiset< Type > fmset_name2 = fmset_name1;
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::flat_multiset< Type > fmset_name1;
// Move constructor.
std::flat_multiset< Type > fmset_name2( std::move( fmset_name1 ) );
```

```CPP
std::flat_multiset< Type >* fmset_ptr = new std::flat_multiset< Type >;
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::flat_multiset< Type > fmset_name;
std::flat_multiset< Type >* fmset_ptr = new std::flat_multiset< Type >( fmset_name );
```

### Syntax for Deleting `std::flat_multiset` Pointers

```CPP
delete fmset_ptr;
```

### Members and Related Stuffs

#### Links

1. [`std::flat_multiset` in cplusplus]().
2. [`std::flat_multiset` in cppreference](https://en.cppreference.com/w/cpp/container/flat_multiset).

#### Template Parameters

1. `Key`: The type of the elements.
2. `Compare`: A `Compare` type providing a strict weak ordering. By default, the first key (smallest
   key) is at the beginning of the flat multiset because its default `Compare` is
   `std::less< Key >`, which sorts the elements in ascending order.
3. `KeyContainer`: The type of the underlying SequenceContainer to store the elements. The iterators
   of such container should satisfy `LegacyRandomAccessIterator` or model `random_access_iterator`.
   The standard containers `std::vector` and `std::deque` satisfy these requirements.

#### Member Types

1. `containre_type`: `KeyContainer`.
2. `key_type`: `Key`.
3. `value_type`: `Key`.
4. `key_compare`: `Compare`.
5. `value_compare`: `Compare`.
6. `reference`: `value_type&`.
7. `const_reference`: `const value_type&`.
8. `size_type`: `typename KeyContainer::size_type`.
9. `difference_type`: `typename KeyContainer::difference_type`.
10. `iterator`: Implementation-defined `LegacyRandomAccessIterator` and `random_access_iterator` to
    `value_type`.
11. `const_iterator`: Implementation-defined `LegacyRandomAccessIterator` and
    `random_access_iterator` to `const value_type`.
12. `reverse_iterator`: `std::reverse_iterator< iterator >`.
13. `const_reverse_iterator`: `std::reverse_iterator< const_iterator >`.

#### Member Objects

1. `c` (`private`): The underlying container of `container_type` (exposition-only member object`*`).
2. `compare` (`private`): The comparison function object of type `key_compare` (exposition-only
   member object`*`).

#### Member Functions

1. (constructor): Constructs the flat multiset (public member function).
2. (destructor) (implicitly declared): Destroys every element of the container adaptor (public
   member function).
3. `operator=`: Assigns values to the container adaptor (public member function).
4. `begin`, `cbegin`: Returns an iterator to the beginning (public member function).
5. `end`, `cend`: Returns an iterator to the end (public member function).
6. `rbegin`, `crbegin`: Returns a reverse iterator to the beginning (public member function).
7. `rend`, `crend`: Returns a reverse iterator to the end (public member function).
8. `empty`: Checks whether the container adaptor is empty (public member function).
9. `size`: Returns the number of elements (public member function).
10. `max_size`: Returns the maximum possible number of elements (public member function).
11. `emplace`: Constructs elements in-place (public member function).
12. `emplace_hint`: Constructs elements in-place using a hint (public member function).
13. `insert`: Inserts elements (public member function).
14. `insert_range`: Inserts a range of elements (public member function).
15. `extract`: Extracts the underlying container (public member function).
16. `replace`: Replaces the underlying container (public member function).
17. `erase`: Erases elements (public member function).
18. `swap`: Swaps the contents (public member function).
19. `clear`: Clears the contents (public member function).
20. `find`: Finds an element with specific key (public member function).
21. `count`: Returns the number of elements matching specific key (public member function).
22. `contains`: Checks if the container contains an element with specific key (public member
    function).
23. `lower_bound`: Returns an iterator to the first element not less than the given key (public
    member function).
24. `upper_bound`: Returns an iterator to the first element greater than the given key (public
    member function).
25. `equal_range`: Returns range of elements matching a specific key (public member function).
26. `key_comp`: Returns the function that compares keys (public member function).
27. `value_comp`: Returns the function that compares keys in objects of type `value_type` (public
    member function).

#### Non-member Functions

1. `operator==`, `operator<=>`: Lexicographically compares the values of two flat multisets
   (function template).
2. `std::swap( std::flat_multiset )`: Specializes the `std::swap` algorithm (function template).
3. `erase_if( std::flat_multiset )`: Erases all elements satisfying specific criteria (function
   template).

#### Helper classes

1. `std::uses_allocator< std::flat_multiset >` (C++23): Specializes the `std::uses_allocat` or type
   trait (class template specialization).

#### Tags

1. `sorted_equivalent`, `sorted_equivalent_t` (C++23): indicates that elements of a range are sorted
   and unique (tag).

<!-- vim-markdown-toc GFM -->

- [Maps](#maps)
  - [Explanation](#explanation)
  - [Declaration Syntax](#declaration-syntax)
  - [Initialization Syntax](#initialization-syntax)
  - [Syntax for Deleting `std::map` Pointers](#syntax-for-deleting-stdmap-pointers)
  - [Members and Related Stuffs](#members-and-related-stuffs)
    - [Links](#links)
    - [Template Parameters](#template-parameters)
    - [Member Types](#member-types)
    - [Member Classes](#member-classes)
    - [Member Functions](#member-functions)
    - [Non-member Functions](#non-member-functions)
- [Multimaps](#multimaps)
  - [Explanation](#explanation-1)
  - [Declaration Syntax](#declaration-syntax-1)
  - [Initialization Syntax](#initialization-syntax-1)
  - [Syntax for Deleting `std::multimap` Pointers](#syntax-for-deleting-stdmultimap-pointers)
  - [Members and Related Stuffs](#members-and-related-stuffs-1)
    - [Links](#links-1)
    - [Template Parameters](#template-parameters-1)
    - [Member Types](#member-types-1)
    - [Member Classes](#member-classes-1)
    - [Member Functions](#member-functions-1)
    - [Non-member Functions](#non-member-functions-1)
- [Unordered Maps](#unordered-maps)
  - [Explanation](#explanation-2)
  - [Declaration Syntax](#declaration-syntax-2)
  - [Initialization Syntax](#initialization-syntax-2)
  - [Syntax for Deleting `std::unordered_map` Pointers](#syntax-for-deleting-stdunordered_map-pointers)
  - [Members and Related Stuffs](#members-and-related-stuffs-2)
    - [Links](#links-2)
    - [Template Parameters](#template-parameters-2)
    - [Member Types](#member-types-2)
    - [Member Functions](#member-functions-2)
    - [Non-member Functions](#non-member-functions-2)
- [Unordered Multimaps](#unordered-multimaps)
  - [Explanation](#explanation-3)
  - [Declaration Syntax](#declaration-syntax-3)
  - [Initialization Syntax](#initialization-syntax-3)
  - [Syntax for Deleting `std::unordered_multimap` Pointers](#syntax-for-deleting-stdunordered_multimap-pointers)
  - [Members and Related Stuffs](#members-and-related-stuffs-3)
    - [Links](#links-3)
    - [Template Parameters](#template-parameters-3)
    - [Member Types](#member-types-3)
    - [Member Functions](#member-functions-3)
    - [Non-member Functions](#non-member-functions-3)
- [Flat Maps](#flat-maps)
  - [Explanation](#explanation-4)
  - [Declaration Syntax](#declaration-syntax-4)
  - [Initialization Syntax](#initialization-syntax-4)
  - [Syntax for Deleting `std::flat_map` Pointers](#syntax-for-deleting-stdflat_map-pointers)
  - [Members and Related Stuffs](#members-and-related-stuffs-4)
    - [Links](#links-4)
    - [Template Parameters](#template-parameters-4)
    - [Member Types](#member-types-4)
    - [Member Classes](#member-classes-2)
    - [Member Objects](#member-objects)
    - [Member Functions](#member-functions-4)
    - [Non-member Functions](#non-member-functions-4)
    - [Helper classes](#helper-classes)
    - [Tags](#tags)
- [Flat Multimaps](#flat-multimaps)
  - [Explanation](#explanation-5)
  - [Declaration Syntax](#declaration-syntax-5)
  - [Initialization Syntax](#initialization-syntax-5)
  - [Syntax for Deleting `std::flat_multimap` Pointers](#syntax-for-deleting-stdflat_multimap-pointers)
  - [Members and Related Stuffs](#members-and-related-stuffs-5)
    - [Links](#links-5)
    - [Template Parameters](#template-parameters-5)
    - [Member Types](#member-types-5)
    - [Member Classes](#member-classes-3)
    - [Member Objects](#member-objects-1)
    - [Member Functions](#member-functions-5)
    - [Non-member Functions](#non-member-functions-5)
    - [Helper classes](#helper-classes-1)
    - [Tags](#tags-1)

<!-- vim-markdown-toc -->

## Maps

### Explanation

1. Maps are **associative containers** that **store elements** formed by **a combination of a key
   value and a mapped value**, following **a specific order**.
2. In a map, **the key values** are generally **used to sort and uniquely identify the elements**,
   while **the mapped values** store **the content** associated to this key.
3. The types of key and mapped value may differ, and are **grouped together** in member type
   `value_type`, which is **a pair type** combining both: `typedef pair<const Key, T> value_type;`.
4. **Different mapped values** must have **different key values**.
5. Internally, **the elements** in a map are always **sorted by its key** following a specific
   strict weak ordering criterion indicated by its internal comparison object (of type Compare).
6. Map containers are generally **slower than `unordered_map`** containers to **access** individual
   **elements** by their key, but they **allow the direct iteration** on subsets based on their
   order.
7. The mapped values in a map can be accessed directly by their corresponding key **using the
   bracket operator (`(operator[]`)**.
8. Maps are typically **implemented as red–black trees**.
9. Their header file is `<map>`.

### Declaration Syntax

```CPP
std::map< KType, VType > map_name;
```

```CPP
// Not common, not recommend
class Compare {
      bool _reverse;
   public:
      explicit Compare( const bool& rev_param = false ) {
         _reverse = rev_param;
      };
      bool operator()( const KType& lhs, const KType& rhs ) const {
         if( _reverse ) {
            ...
         } else {
            ...
         };
      };
};
std::map< KType, VType, Compare > map_name;
```

```CPP
std::map< KType, VType >* map_ptr;
```

### Initialization Syntax

```CPP
// Initializer list constructor.
std::map< KType, VType > map_name = { ... };
```

```CPP
// Initializer list constructor.
std::map< KType, VType > map_name{ ... };
```

```CPP
// Default constructor. Constructs an empty container.
std::map< KType, VType > map_name;
```

```CPP
// Default constructor. Constructs an empty container.
std::map< KType, VType, Compare > map_name;
```

```CPP
// Default constructor. Constructs an empty container.
std::map< KType, VType, Compare > map_name;
// Copy-constructs the temporary `Compare` class object. Constructs an empty container.
std::map< KType, VType, Compare > rmap_name( Compare( true ) );
```

```CPP
// Copy-constructs the comparison functor `comp` with the contents of compare. Constructs an empty container.
Compare comp;
std::map< KType, VType, Compare  > map_name( comp );
```

```CPP
// Default constructor. Constructs an empty container.
std::map< KType, VType > map_name1;
// Copy constructor.
std::map< KType, VType > map_name2( map_name1 );
```

```CPP
// Default constructor. Constructs an empty container.
std::map< KType, VType > map_name1;
// Copy constructor.
std::map< KType, VType > map_name2 = map_name1;
```

```CPP
// Copy-constructs the comparison functor `comp` with the contents of compare. Constructs an empty container.
Compare comp;
std::map< KType, VType, Compare  > map_name1( comp );
std::map< KType, VType, Compare  > map_name2( map_name1.begin(), map_name1.end(), comp /* optional */ );
```

```CPP
// Default constructor. Constructs an empty container.
std::map< KType, VType > map_name1;
// Move constructor.
std::map< KType, VType > map_name2( std::move( map_name1 ) );
```

```CPP
std::map< KType, VType >* map_ptr = new std::map< KType, VType >;
```

```CPP
// Default constructor. Constructs an empty container.
std::map< KType, VType > map_name;
std::map< KType, VType >* map_ptr = new std::map< KType, VType >( map_name );
```

### Syntax for Deleting `std::map` Pointers

```CPP
delete map_ptr;
```

### Members and Related Stuffs

#### Links

1. [`std::map` in cplusplus](https://cplusplus.com/reference/map/map/).
2. [`std::map` in cppreference](https://en.cppreference.com/w/cpp/container/map).

#### Template Parameters

1. `Key`: Type of the keys.
2. `T`: Type of the mapped value.
3. `Compare`: A `Compare` type providing a strict weak ordering. By default, the first key (smallest
   key) is at the beginning of the map because its default `Compare` is `std::less< Key >`, which
   sorts the elements in ascending order.
4. `Allocator`: An allocator that is used to acquire/release memory and to construct/destroy the
   elements in that memory.

#### Member Types

1. `key_type`: `Key`.
2. `mapped_type`: `T`.
3. `value_type`: `std::pair< const Key, T >`.
4. `size_type`: Unsigned integer type (usually `std::size_t`).
5. `difference_type`: Signed integer type (usually `std::ptrdiff_t`).
6. `key_compare`: `Compare`.
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
    struct /* unspecified */
    {
          Iter position;
          bool inserted;
          NodeType node;
    };
    ```
    instantiated with template arguments iterator and `node_type`.

#### Member Classes

1. `value_compare`: Compares objects of type `value_type` (class).

#### Member Functions

1. (constructor): Constructs the map (public member function).
2. (destructor): Destructs the map (public member function).
3. `operator=`: Assigns values to the container (public member function).
4. `get_allocator`: Returns the associated allocator (public member function).
5. `at`: Access specified element with bounds checking (public member function).
6. `operator[]`: Access or insert specified element (public member function).
7. `begin`, `cbegin`: Returns an iterator to the beginning (public member function).
8. `end`, `cend`: Returns an iterator to the end (public member function).
9. `rbegin`, `crbegin`: Returns a reverse iterator to the beginning (public member function).
10. `rend`, `crend`: Returns a reverse iterator to the end (public member function).
11. `empty`: Checks whether the container is empty (public member function).
12. `size`: Returns the number of elements (public member function).
13. `max_size`: Returns the maximum possible number of elements (public member function).
14. `clear`: Clears the contents (public member function).
15. `insert`: Inserts elements or nodes(since C++17) (public member function).
16. `insert_range` (C++23): Inserts a range of elements (public member function).
17. `insert_or_assign` (C++17): Inserts an element or assigns to the current element if the key
    already exists (public member function).
18. `emplace`: Constructs elements in-place (public member function).
19. `emplace_hint`: Constructs elements in-place using a hint (public member function).
20. `try_emplace` (C++17): Inserts in-place if the key does not exist, does nothing if the key
    exists (public member function).
21. `erase`: Erases elements (public member function).
22. `swap`: Swaps the contents (public member function).
23. `extract` (C++17): Extracts nodes from the container (public member function).
24. `merge` (C++17): Splices nodes from another container (public member function).
25. `count`: Returns the number of elements matching specific key (public member function).
26. `find`: Finds an element with specific key (public member function).
27. `contains` (C++20): Checks if the container contains an element with specific key (public member
    function).
28. `equal_range`: Returns range of elements matching a specific key (public member function).
29. `lower_bound`: Returns an iterator to the first element not less than the given key (public
    member function).
30. `upper_bound`: Returns an iterator to the first element greater than the given key (public
    member function).
31. `key_comp`: Returns the function that compares keys (public member function).
32. `value_comp`: Returns the function that compares keys in objects of type `value_type` (public
    member function).

#### Non-member Functions

1. `operator==`, `operator!=/</<=/>/>=` (removed in C++20), `operator<=>` (C++20): Lexicographically
   compares the values of two maps (function template).
2. `std::swap( std::map )`: Specializes the `std::swap` algorithm (function template).
3. `erase_if( std::map )` (C++20): Erases all elements satisfying specific criteria (function
   template).

## Multimaps

### Explanation

1. Multimaps are **associative containers** that **store elements** formed by **a combination of a
   key value and a mapped value**, following **a specific order**, and where multiple elements **can
   have equivalent keys**.
2. In a multimap, **the key values** are generally **used to sort and uniquely identify the
   elements**, while **the mapped values** store **the content** associated to this key.
3. The types of key and mapped value may differ, and are **grouped together** in member type
   `value_type`, which is **a pair type** combining both: `typedef pair<const Key, T> value_type;`.
4. Internally, **the elements** in a multimap are always **sorted by its key** following a specific
   strict weak ordering criterion indicated by its internal comparison object (of type Compare).
5. Multimap containers are generally **slower than `unordered_multimap`** containers to **access**
   individual **elements** by their key, but they **allow the direct iteration** on subsets based on
   their order.
6. Multimaps are typically **implemented as red–black trees**.
7. Their header file is `<map>`.

### Declaration Syntax

```CPP
std::multimap< KType, VType > mmap_name;
```

```CPP
// Not common, not recommend
class Compare {
      bool _reverse;
   public:
      explicit Compare( const bool& rev_param = false ) {
         _reverse = rev_param;
      };
      bool operator()( const KType& lhs, const KType& rhs ) const {
         if( _reverse ) {
            ...
         } else {
            ...
         };
      };
};
std::multimap< KType, VType, Compare > mmap_name;
```

```CPP
std::multimap< KType, VType >* mmap_ptr;
```

### Initialization Syntax

```CPP
// Initializer list constructor.
std::multimap< KType, VType > mmap_name = { ... };
```

```CPP
// Initializer list constructor.
std::multimap< KType, VType > mmap_name{ ... };
```

```CPP
// Default constructor. Constructs an empty container.
std::multimap< KType, VType > mmap_name;
```

```CPP
// Default constructor. Constructs an empty container.
std::multimap< KType, VType, Compare > mmap_name;
```

```CPP
// Default constructor. Constructs an empty container.
std::multimap< KType, VType, Compare > mmap_name;
// Copy-constructs the temporary `Compare` class object. Constructs an empty container.
std::multimap< KType, VType, Compare > rmmap_name( Compare( true ) );
```

```CPP
// Copy-constructs the comparison functor `comp` with the contents of compare. Constructs an empty container.
Compare comp;
std::multimap< KType, VType, Compare  > mmap_name( comp );
```

```CPP
// Default constructor. Constructs an empty container.
std::multimap< KType, VType > mmap_name1;
// Copy constructor.
std::multimap< KType, VType > mmap_name2( mmap_name1 );
```

```CPP
// Default constructor. Constructs an empty container.
std::multimap< KType, VType > mmap_name1;
// Copy constructor.
std::multimap< KType, VType > mmap_name2 = mmap_name1;
```

```CPP
// Default constructor. Constructs an empty container.
std::multimap< KType, VType > mmap_name1;
// Move constructor.
std::multimap< KType, VType > mmap_name2( std::move( mmap_name1 ) );
```

```CPP
// Copy-constructs the comparison functor `comp` with the contents of compare. Constructs an empty container.
Compare comp;
std::multimap< KType, VType, Compare  > mmap_name1( comp );
std::multimap< KType, VType, Compare  > mmap_name2( mmap_name1.begin(), mmap_name1.end(), comp /* optional */ );
```

```CPP
std::multimap< KType, VType >* mmap_ptr = new std::multimap< KType, VType >;
```

```CPP
// Default constructor. Constructs an empty container.
std::multimap< KType, VType > mmap_name;
std::multimap< KType, VType >* mmap_ptr = new std::multimap< KType, VType >( mmap_name );
```

### Syntax for Deleting `std::multimap` Pointers

```CPP
delete mmap_ptr;
```

### Members and Related Stuffs

#### Links

1. [`std::multimap` in cplusplus](https://cplusplus.com/reference/map/multimap/).
2. [`std::multimap` in cppreference](https://en.cppreference.com/w/cpp/container/multimap).

#### Template Parameters

1. `Key`: Type of the keys.
2. `T`: Type of the mapped value.
3. `Compare`: A `Compare` type providing a strict weak ordering. By default, the first key (smallest
   key) is at the beginning of the multimap because its default `Compare` is `std::less< Key >`,
   which sorts the elements in ascending order.
4. `Allocator`: An allocator that is used to acquire/release memory and to construct/destroy the
   elements in that memory.

#### Member Types

1. `key_type`: `Key`.
2. `mapped_type`: `T`.
3. `value_type`: `std::pair< const Key, T >`.
4. `size_type`: Unsigned integer type (usually `std::size_t`).
5. `difference_type`: Signed integer type (usually `std::ptrdiff_t`).
6. `key_compare`: `Compare`.
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

#### Member Classes

1. `value_compare`: Compares objects of type `value_type` (class).

#### Member Functions

1. (constructor): Constructs the multimap (public member function).
2. (destructor): Destructs the multimap (public member function).
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
   compares the values of two multimaps (function template).
2. `std::swap( std::multimap )`: Specializes the `std::swap` algorithm (function template).
3. `erase_if( std::multimap )` (C++20): Erases all elements satisfying specific criteria (function
   template).

## Unordered Maps

### Explanation

1. Unordered maps are **associative containers** that **store elements** formed by **the combination
   of a key value and a mapped value**, and which allows for **fast retrieval** of individual
   elements based on their keys.
2. In an `unordered_map`, **the key value** is generally **used to uniquely identify the element**,
   while **the mapped value** is an object with **the content** associated to this key. Types of key
   and mapped value may differ.
3. Internally, the elements in the `unordered_map` are **not sorted** in any particular order with
   respect to either their key or mapped values, but **organized into buckets** depending on their
   **hash** values to allow for **fast access** to individual **elements** directly by their key
   values (**with a constant average time complexity on average**).
4. `unordered_map` containers are **faster than map** containers to access individual elements by
   their key, although they are generally **less efficient for range iteration** through a subset of
   their elements.
5. Unordered maps implement **the direct access operator (`operator[]`)** which allows for direct
   access of the mapped value using its key value as argument.
6. Iterators in the container are **at least forward iterators**.
7. Their header file is `<unordered_map>`.

### Declaration Syntax

```CPP
std::unordered_map< KType, VType > umap_name;
```

```CPP
// Not common, not recommend
struct Hash {
      std::size_t operator()( const KType& obj ) const {
         // This is only an example.
         return std::hash< SubKType1 >()( obj._mem1 )
              ^ std::hash< SubKType2 >()( obj._mem2 );
      }
};
struct KeyEqual {
      bool operator()( const KType& lhs, const KType& rhs ) const {
         // This is only an example.
         return lhs.id == rhs.id;   // Custom equality based on id only
      }
};
std::unordered_map< KType, VType, Hash, KeyEqual > umap_name;
```

```CPP
std::unordered_map< KType, VType >* umap_ptr;
```

### Initialization Syntax

```CPP
// Initializer list constructor.
std::unordered_map< KType, VType > umap_name = { ... };
```

```CPP
// Initializer list constructor.
std::unordered_map< KType, VType > umap_name{ ... };
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_map< KType, VType > umap_name;
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_map< KType, VType, Hash, KeyEqual > umap_name;
```

```CPP
// Constructs an empty container.
Hash hash;
std::unordered_map< KType, VType, Hash, KeyEqual > umap_name( hash );
```

```CPP
// Constructs an empty container.
Hash hash;
KeyEqual key_equal;
std::unordered_map< KType, VType, Hash, KeyEqual > umap_name( hash, key_equal );
```

```CPP
// Constructs an empty container.
std::unordered_map< KType, VType > umap_name( size );
```

```CPP
// Constructs an empty container.
std::unordered_map< KType, VType, Hash, KeyEqual > umap_name( size );
```

```CPP
// Constructs an empty container.
Hash hash;
std::unordered_map< KType, VType, Hash, KeyEqual > umap_name( size, hash );
```

```CPP
// Constructs an empty container.
Hash hash;
KeyEqual key_equal;
std::unordered_map< KType, VType, Hash, KeyEqual > umap_name( size, hash, key_equal );
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_map< KType, VType > umap_name1;
// Copy constructor.
std::unordered_map< KType, VType > umap_name2( umap_name1 );
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_map< KType, VType > umap_name1;
// Copy constructor.
std::unordered_map< KType, VType > umap_name2 = umap_name1;
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_map< KType, VType > umap_name1;
// Move constructor.
std::unordered_map< KType, VType > umap_name2( std::move( umap_name1 ) );
```

```CPP
// Initializer list constructor.
std::unordered_map< KType, VType, Hash, KeyEqual > umap_name1{ ... };
// Constructs the container with the contents of the range `[first, last)`.
Hash hash;
KeyEqual key_equal;
std::unordered_map< KType, VType, Hash, KeyEqual > umap_name2( umap_name1.begin(), umap_name1.end(), size /* optional */, hash /* optional */, key_equal /* optional */ );
```

```CPP
std::unordered_map< KType, VType >* umap_ptr = new std::unordered_map< KType, VType >;
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_map< KType, VType > umap_name;
std::unordered_map< KType, VType >* umap_ptr = new std::unordered_map< KType, VType >( umap_name );
```

### Syntax for Deleting `std::unordered_map` Pointers

```CPP
delete umap_ptr;
```

### Members and Related Stuffs

#### Links

1. [`std::unordered_map` in cplusplus](https://cplusplus.com/reference/unordered_map/unordered_map/).
2. [`std::unordered_map` in cppreference](https://en.cppreference.com/w/cpp/container/unordered_map).

#### Template Parameters

1. `Key`: The type of the elements.
2. `Hash`: A unary function object type that takes an object of the same type as the elements as
   argument and returns a unique value of type `size_t` based on it. This can either be a class
   implementing a function call operator or a pointer to a function (see constructor for an
   example). This defaults to `std::hash< Key >`.
3. `KeyEqual`: A binary predicate that takes two arguments of the same type as the elements and
   returns a bool. The expression `KeyEqual( a,b )`, where `KeyEqual` is an object of this type and
   `a` and `b` are key values, shall return true if `a` is to be considered equivalent to `b`.
4. `Allocator`: An allocator that is used to acquire/release memory and to construct/destroy the
   elements in that memory.

#### Member Types

1. `key_type`: `Key`.
2. `mapped_type`: `T`.
3. `value_type`: `std::pair< const Key, T >`.
4. `size_type`: Unsigned integer type (usually `std::size_t`).
5. `difference_type`: Signed integer type (usually `std::ptrdiff_t`).
6. `hasher`: `Hash`.
7. `key_equal`: `KeyEqual`.
8. `allocator_type`: `Allocator`.
9. `reference`: `value_type&`.
10. `const_reference`: `const value_type&`.
11. `pointer`: `std::allocator_traits< Allocator >::pointer`.
12. `const_pointer`: `std::allocator_traits< Allocator >::const_pointer`.
13. `iterator`: Constant `LegacyForwardIterator` to `value_type`.
14. `const_iterator`: `LegacyForwardIterator` to `const value_type`.
15. `local_iterator`: An iterator type whose category, value, difference, pointer and reference
    types are the same as iterator. This iterator can be used to iterate through a single bucket but
    not across buckets
16. `const_local_iterator`: An iterator type whose category, value, difference, pointer and
    reference types are the same as `const_iterator`. This iterator can be used to iterate through a
    single bucket but not across buckets
17. `node_type (since C++17)`: A specialization of node handle representing a container node.
18. `insert_return_type` (since C++17): Type describing the result of inserting a `node_type`, a
    specialization of
    ```CPP
    template< class Iter, class NodeType >
    struct /* unspecified */
    {
          Iter position;
          bool inserted;
          NodeType node;
    };
    ```
    instantiated with template arguments iterator and `node_type`.

#### Member Functions

1. (constructor): Constructs the unordered map (public member function).
2. (destructor): Destructs the unordered map (public member function).
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
13. `insert_or_assign` (C++17): Inserts an element or assigns to the current element if the key
14. `emplace`: Constructs elements in-place (public member function).
15. `emplace_hint`: Constructs elements in-place using a hint (public member function).
16. `try_emplace` (C++17): Inserts in-place if the key does not exist, does nothing if the key
17. `erase`: Erases elements (public member function).
18. `swap`: Swaps the contents (public member function).
19. `extract` (C++17): Extracts nodes from the container (public member function).
20. `merge` (C++17): Splices nodes from another container (public member function).
21. `at`: Access specified element with bounds checking (public member function).
22. `operator[]`: Access or insert specified element (public member function).
23. `count`: Returns the number of elements matching specific key (public member function).
24. `find`: Finds an element with specific key (public member function).
25. `contains` (C++20): Checks if the container contains an element with specific key (public member
    function).
26. `equal_range`: Returns range of elements matching a specific key (public member function).
27. `begin( size_type )`, `cbegin( size_type )`: Returns an iterator to the beginning of the
    specified bucket (public member function).
28. `end( size_type )`, `cend( size_type )`: Returns an iterator to the end of the specified bucket
    (public member function).
29. `bucket_count`: Returns the number of buckets (public member function).
30. `max_bucket_count`: Returns the maximum number of buckets (public member function).
31. `bucket_size`: Returns the number of elements in specific bucket (public member function).
32. `bucket`: Returns the bucket for specific key (public member function).
33. `load_factor`: Returns average number of elements per bucket (public member function).
34. `max_load_factor`: Manages maximum average number of elements per bucket (public member
    function).
35. `rehash`: Reserves at least the specified number of buckets and regenerates the hash table
    (public member function).
36. `reserve`: Reserves space for at least the specified number of elements and regenerates the hash
    table (public member function).
37. `hash_function`: Returns function used to hash the keys (public member function).
38. `key_eq`: Returns the function used to compare keys for equality (public member function).

#### Non-member Functions

1. `operator==`, `operator!=` (removed in C++20): Lexicographically compares the values of two
   unordered maps (function template).
2. `std::swap( std::unordered_map )`: Specializes the `std::swap` algorithm (function template).
3. `erase_if( std::unordered_map )` (C++20): Erases all elements satisfying specific criteria
   (function template).

## Unordered Multimaps

### Explanation

1. Unordered multimaps are **associative containers** that **store elements** formed by **the
   combination of a key value and a mapped value**, much like `unordered_map` containers, but
   **allowing different elements to have equivalent keys**.
2. In an `unordered_multimap`, **the key value is generally used to uniquely identify the element**,
   while **the mapped value** is an object with **the content** associated to this key. Types of key
   and mapped value may differ.
3. Internally, the elements in the `unordered_multimap` are **not sorted** in any particular order
   with respect to either their key or mapped values, but **organized into buckets** depending on
   their **hash** values to allow for **fast access** to individual **elements** directly by their
   key values (**with a constant average time complexity on average**).
4. Elements with equivalent keys are **grouped together** in the same bucket and in such a way that
   an iterator (see `equal_range`) can iterate through all of them.
5. Iterators in the container are **at least forward iterators**.
6. Their header file is `<unordered_map>`.

### Declaration Syntax

```CPP
std::unordered_multimap< KType, VType > ummap_name;
```

```CPP
// Not common, not recommend
struct Hash {
      std::size_t operator()( const KType& obj ) const {
         // This is only an example.
         return std::hash< SubKType1 >()( obj._mem1 )
              ^ std::hash< SubKType2 >()( obj._mem2 );
      }
};
struct KeyEqual {
      bool operator()( const KType& lhs, const KType& rhs ) const {
         // This is only an example.
         return lhs.id == rhs.id;   // Custom equality based on id only
      }
};
std::unordered_multimap< KType, VType, Hash, KeyEqual > ummap_name;
```

```CPP
std::unordered_multimap< KType, VType >* ummap_ptr;
```

### Initialization Syntax

```CPP
// Initializer list constructor.
std::unordered_multimap< KType, VType > ummap_name = { ... };
```

```CPP
// Initializer list constructor.
std::unordered_multimap< KType, VType > ummap_name{ ... };
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_multimap< KType, VType > ummap_name;
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_multimap< KType, VType, Hash, KeyEqual > ummap_name;
```

```CPP
// Constructs an empty container.
Hash hash;
std::unordered_multimap< KType, VType, Hash, KeyEqual > ummap_name( hash );
```

```CPP
// Constructs an empty container.
Hash hash;
KeyEqual key_equal;
std::unordered_multimap< KType, VType, Hash, KeyEqual > ummap_name( hash, key_equal );
```

```CPP
// Constructs an empty container.
std::unordered_multimap< KType, VType > ummap_name( size );
```

```CPP
// Constructs an empty container.
std::unordered_multimap< KType, VType, Hash, KeyEqual > ummap_name( size );
```

```CPP
// Constructs an empty container.
Hash hash;
std::unordered_multimap< KType, VType, Hash, KeyEqual > ummap_name( size, hash );
```

```CPP
// Constructs an empty container.
Hash hash;
KeyEqual key_equal;
std::unordered_multimap< KType, VType, Hash, KeyEqual > ummap_name( size, hash, key_equal );
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_multimap< KType, VType > ummap_name1;
// Copy constructor.
std::unordered_multimap< KType, VType > ummap_name2( ummap_name1 );
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_multimap< KType, VType > ummap_name1;
// Copy constructor.
std::unordered_multimap< KType, VType > ummap_name2 = ummap_name1;
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_multimap< KType, VType > ummap_name1;
// Move constructor.
std::unordered_multimap< KType, VType > ummap_name2( std::move( ummap_name1 ) );
```

```CPP
// Initializer list constructor.
std::unordered_multimap< KType, VType, Hash, KeyEqual > ummap_name1{ ... };
// Constructs the container with the contents of the range `[first, last)`.
Hash hash;
KeyEqual key_equal;
std::unordered_multimap< KType, VType, Hash, KeyEqual > ummap_name2( ummap_name1.begin(), ummap_name1.end(), size /* optional */, hash /* optional */, key_equal /* optional */ );
```

```CPP
std::unordered_multimap< KType, VType >* ummap_ptr = new std::unordered_multimap< KType, VType >;
```

```CPP
// Default constructor. Constructs an empty container.
std::unordered_multimap< KType, VType > ummap_name;
std::unordered_multimap< KType, VType >* ummap_ptr = new std::unordered_multimap< KType, VType >( ummap_name );
```

### Syntax for Deleting `std::unordered_multimap` Pointers

```CPP
delete ummap_ptr;
```

### Members and Related Stuffs

#### Links

1. [`std::unordered_multimap` in cplusplus](https://cplusplus.com/reference/unordered_map/unordered_multimap/).
2. [`std::unordered_multimap` in cppreference](https://en.cppreference.com/w/cpp/container/unordered_multimap).

#### Template Parameters

1. `Key`: The type of the elements.
2. `Hash`: A unary function object type that takes an object of the same type as the elements as
   argument and returns a unique value of type `size_t` based on it. This can either be a class
   implementing a function call operator or a pointer to a function (see constructor for an
   example). This defaults to `std::hash< Key >`.
3. `KeyEqual`: A binary predicate that takes two arguments of the same type as the elements and
   returns a bool. The expression `KeyEqual( a,b )`, where `KeyEqual` is an object of this type and
   `a` and `b` are key values, shall return true if `a` is to be considered equivalent to `b`.
4. `Allocator`: An allocator that is used to acquire/release memory and to construct/destroy the
   elements in that memory.

#### Member Types

1. `key_type`: `Key`.
2. `mapped_type`: `T`.
3. `value_type`: `std::pair< const Key, T >`.
4. `size_type`: Unsigned integer type (usually `std::size_t`).
5. `difference_type`: Signed integer type (usually `std::ptrdiff_t`).
6. `hasher`: `Hash`.
7. `key_equal`: `KeyEqual`.
8. `allocator_type`: `Allocator`.
9. `reference`: `value_type&`.
10. `const_reference`: `const value_type&`.
11. `pointer`: `std::allocator_traits< Allocator >::pointer`.
12. `const_pointer`: `std::allocator_traits< Allocator >::const_pointer`.
13. `iterator`: Constant `LegacyForwardIterator` to `value_type`.
14. `const_iterator`: `LegacyForwardIterator` to `const value_type`.
15. `local_iterator`: An iterator type whose category, value, difference, pointer and reference
    types are the same as iterator. This iterator can be used to iterate through a single bucket but
    not across buckets
16. `const_local_iterator`: An iterator type whose category, value, difference, pointer and
    reference types are the same as `const_iterator`. This iterator can be used to iterate through a
    single bucket but not across buckets
17. `node_type (since C++17)`: A specialization of node handle representing a container node.
18. `insert_return_type` (since C++17): Type describing the result of inserting a `node_type`, a
    specialization of
    ```CPP
    template< class Iter, class NodeType >
    struct /* unspecified */
    {
          Iter position;
          bool inserted;
          NodeType node;
    };
    ```
    instantiated with template arguments iterator and `node_type`.

#### Member Functions

1. (constructor): Constructs the unordered multimap (public member function).
2. (destructor): Destructs the unordered multimap (public member function).
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
13. `insert_or_assign` (C++17): Inserts an element or assigns to the current element if the key
14. `emplace`: Constructs elements in-place (public member function).
15. `emplace_hint`: Constructs elements in-place using a hint (public member function).
16. `try_emplace` (C++17): Inserts in-place if the key does not exist, does nothing if the key
17. `erase`: Erases elements (public member function).
18. `swap`: Swaps the contents (public member function).
19. `extract` (C++17): Extracts nodes from the container (public member function).
20. `merge` (C++17): Splices nodes from another container (public member function).
21. `at`: Access specified element with bounds checking (public member function).
22. `operator[]`: Access or insert specified element (public member function).
23. `count`: Returns the number of elements matching specific key (public member function).
24. `find`: Finds an element with specific key (public member function).
25. `contains` (C++20): Checks if the container contains an element with specific key (public member
    function).
26. `equal_range`: Returns range of elements matching a specific key (public member function).
27. `begin( size_type )`, `cbegin( size_type )`: Returns an iterator to the beginning of the
    specified bucket (public member function).
28. `end( size_type )`, `cend( size_type )`: Returns an iterator to the end of the specified bucket
    (public member function).
29. `bucket_count`: Returns the number of buckets (public member function).
30. `max_bucket_count`: Returns the maximum number of buckets (public member function).
31. `bucket_size`: Returns the number of elements in specific bucket (public member function).
32. `bucket`: Returns the bucket for specific key (public member function).
33. `load_factor`: Returns average number of elements per bucket (public member function).
34. `max_load_factor`: Manages maximum average number of elements per bucket (public member
    function).
35. `rehash`: Reserves at least the specified number of buckets and regenerates the hash table
    (public member function).
36. `reserve`: Reserves space for at least the specified number of elements and regenerates the hash
    table (public member function).
37. `hash_function`: Returns function used to hash the keys (public member function).
38. `key_eq`: Returns the function used to compare keys for equality (public member function).

#### Non-member Functions

1. `operator==`, `operator!=` (removed in C++20): Lexicographically compares the values of two
   unordered multimaps (function template).
2. `std::swap( std::unordered_multimap )`: Specializes the `std::swap` algorithm (function
   template).
3. `erase_if( std::unordered_multimap )` (C++20): Erases all elements satisfying specific criteria
   (function template).

## Flat Maps

### Explanation

1. Flat maps are **an associative container** that **stores elements** formed by **a combination of
   a key value and a mapped value**, but is **implemented as a sorted sequence**, typically using a
   vector.
2. In a `flat_map`, **the key values are generally used to sort and uniquely identify the
   elements**, while **the mapped values** store **the content** associated with this key, similar
   to traditional maps.
3. The types of key and mapped value may differ and are **grouped together** in the member type
   `value_type`, which is **a pair type** combining both:
   `typedef std::pair<const Key, T> value_type;`.
4. **Different mapped values** must have **different key values**, ensuring that each key in a
   `flat_map` uniquely identifies a single mapped value.
5. Internally, the elements in a `flat_map` are stored as **a sorted vector**, which allows for
   **binary search** for **efficient lookups and iteration** based on the key’s order.
6. `flat_map` containers can be **faster than traditional maps** for access to individual
   **elements** by their key due to **contiguous memory storage**, but they may **incur overhead**
   for **insertions and deletions** due to the need to maintain sorted order.
7. The mapped values in a `flat_map` can be accessed directly by their corresponding key **using the
   bracket operator (`operator[]`)**, similar to regular maps.
8. The **class template `flat_map`** acts as **a wrapper** to the **two underlying containers**,
   passed as objects of type `KeyContainer` and `MappedContainer` respectively. The first container
   is sorted, and for each key its corresponding value is in the second container at the same index
   (`offset`). The number of elements in both containers is the same.
9. The header file for `flat_map` is `<experimental/flat_map>` (or may be found in other namespaces
   in different implementations).

### Declaration Syntax

```CPP
std::flat_map< KType, VType > fmap_name;
```

```CPP
// Not common, not recommend
class Compare {
      bool _reverse;

   public:
      explicit Compare( const bool& rev_param = false ) {
         _reverse = rev_param;
      };

      bool operator()( const KType& lhs, const KType& rhs ) const {
         if( _reverse ) {
            ...
         } else {
            ...
         };
      };
};
std::flat_map< KType, VType, Compare > fmap_name;
```

```CPP
// Not common, not recommend
std::flat_map< KType, VType, Compare, KeyContainer< KType >, MappedContainer< VType > > fmap_name;
```

```CPP
std::flat_map< KType, VType >* fmap_ptr;
```

### Initialization Syntax

```CPP
// Initializer list constructor
std::flat_map< KType, VType > fmap_name = { ... };
```

```CPP
// Initializer list constructor
std::flat_map< KType, VType > fmap_name{ ... };
```

```CPP
// Default constructor. Constructs an empty container adaptor.
std::flat_map< KType, VType > fmap_name;
```

```CPP
// Default constructor.  Constructs an empty container adaptor.
std::flat_map< KType, VType, Compare, KeyContainer< KType >, MappedContainer< VType > > fmap_name;
```

```CPP
// Constructs the two underlying containers by copying the contents of the container `kcont` and `vcont` separately.
// Construct a default `comp` to sort all elements.
KeyContainer< KType > kcont = { ... };
MappedContainer< VType > vcont = { ... };
std::flat_map< KType, VType, Compare, KeyContainer< KType >, MappedContainer< VType > > fmap_name( kcont, vcont );
```

```CPP
// Constructs the two underlying containers by copying the contents of the container `kcont` and `vcont` separately.
// Copy the `comp` to sort all elements.
KeyContainer< KType > kcont = { ... };
MappedContainer< VType > vcont = { ... };
Compare comp;
std::flat_map< KType, VType, Compare, KeyContainer< KType >, MappedContainer< VType > > fmap_name( kcont, vcont, comp );
```

```CPP
// Specify that all elements are unique. Just a tag.
// Constructs the two underlying containers by copying the contents of the container `kcont` and `vcont` separately.
// Construct a default `comp` to sort all elements.
std::sorted_unique_t s;
KeyContainer< KType > kcont = { ... };
MappedContainer< VType > vcont = { ... };
std::flat_map< KType, VType, Compare, KeyContainer< KType >, MappedContainer< VType > > fmap_name( s, kcont, vcont );
```

```CPP
// Specify that all elements are unique. Just a tag.
// Constructs the two underlying containers by copying the contents of the container `kcont` and `vcont` separately.
// Copy the `comp` to sort all elements.
std::sorted_unique_t s:
KeyContainer< KType > kcont = { ... };
MappedContainer< VType > vcont = { ... };
Compare comp;
std::flat_map< KType, VType, Compare, KeyContainer< KType >, MappedContainer< VType > > fmap_name( s, kcont, vcont, comp );
```

```CPP
// Copy-constructs the comparison functor `comp` with the contents of compare. Value-initializes the underlying container.
Compare comp;
std::flat_map< KType, VType, Compare, KeyContainer< KType >, MappedContainer< VType >  > fmap_name( comp );
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::flat_map< KType, VType > fmap_name1;
// Copy constructor.
std::flat_map< KType, VType > fmap_name2( fmap_name1 );
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::flat_map< KType, VType > fmap_name1;
// Copy constructor.
std::flat_map< KType, VType > fmap_name2 = fmap_name1;
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::flat_map< KType, VType > fmap_name1;
// Move constructor.
std::flat_map< KType, VType > fmap_name2( std::move( fmap_name1 ) );
```

```CPP
// Specify that all elements are unique. Just a tag.
// Constructs the two underlying containers by copying the contents of the container `kcont` and `vcont` separately.
// Copy the `comp` to sort all elements.
std::sorted_unique_t s:
KeyContainer< KType > kcont = { ... };
MappedContainer< VType > vcont = { ... };
Compare comp;
std::flat_map< KType, VType, Compare, KeyContainer< KType >, MappedContainer< VType > > fmap_name1( s, kcont, vcont, comp );
// Constructs the container with the contents of the range `[first, last)`.
std::flat_map< KType, VType, Compare, KeyContainer< KType >, MappedContainer< VType >  > fmap_name2( s /* optional */, fmap_name1.begin(), fmap_name1.end(), comp /* optional */ );
```

```CPP
std::flat_map< KType, VType >* fmap_ptr = new std::flat_map< KType, VType >;
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::flat_map< KType, VType > fmap_name;
std::flat_map< KType, VType >* fmap_ptr = new std::flat_map< KType, VType >( fmap_name );
```

### Syntax for Deleting `std::flat_map` Pointers

```CPP
delete fmap_ptr;
```

### Members and Related Stuffs

#### Links

1. [`std::flat_map` in cplusplus]().
2. [`std::flat_map` in cppreference](https://en.cppreference.com/w/cpp/container/flat_map).

#### Template Parameters

1. `Key`: The type of the keys.
2. `T`: The type of mapped values.
3. `Compare`: A `Compare` type providing a strict weak ordering. By default, the first key (smallest
   key) is at the beginning of the flat set because its default `Compare` is `std::less< Key >`,
   which sorts the elements in ascending order.
4. `KeyContainer`, `MappedContainer`: The type of the underlying SequenceContainer to store the
   elements. The iterators of such container should satisfy `LegacyRandomAccessIterator` or model
   `random_access_iterator`. The standard containers `std::vector` and `std::deque` satisfy these
   requirements.

#### Member Types

1. `key_containre_type`: `KeyContainer`.
2. `mapped_containre_type`: `MappedContainer`.
3. `key_type`: `Key`.
4. `mapped_type`: `T`.
5. `value_type`: `std::pair< key_type, mapped_type >`.
6. `key_compare`: `Compare`.
7. `reference`: `std::pair< const key_type&, mapped_type& >`.
8. `const_reference`: `std::pair< const key_type&, const mapped_type& >`.
9. `size_type`: `std::size_t`.
10. `difference_type`: `std::ptrdiff_t`.
11. `iterator`: Implementation-defined `LegacyInputIterator` and `random_access_iterator` to
    `value_type`.
12. `const_iterator`: Implementation-defined `LegacyInputIterator` and `random_access_iterator` to
    `const value_type`.
13. `reverse_iterator`: `std::reverse_iterator< iterator >`.
14. `const_reverse_iterator`: `std::reverse_iterator< const_iterator >`.
15. `containers`: Type describing the underlying containers.
    ```CPP
    struct containers {
          key_container_type keys;
          mapped_container_type values;
    };
    ```

#### Member Classes

1. `value_compare`: Compares objects of type `value_type` (class).

#### Member Objects

1. `c` (`private`): The object of type containers (exposition-only member object`*`).
2. `compare` (`private`): The comparison function object of type `key_compare` (exposition-only
   member object`*`).

#### Member Functions

1. (constructor): Constructs the flat map (public member function).
2. (destructor) (implicitly declared): Destroys every element of the container adaptor (public
   member function).
3. `operator=`: Assigns values to the container adaptor (public member function).
4. `at`: Access specified element with bounds checking (public member function).
5. `operator[]`: Access or insert specified element (public member function).
6. `begin`, `cbegin`: Returns an iterator to the beginning (public member function).
7. `end`, `cend`: Returns an iterator to the end (public member function).
8. `rbegin`, `crbegin`: Returns a reverse iterator to the beginning (public member function).
9. `rend`, `crend`: Returns a reverse iterator to the end (public member function).
10. `empty`: Checks whether the container adaptor is empty (public member function).
11. `size`: Returns the number of elements (public member function).
12. `max_size`: Returns the maximum possible number of elements (public member function).
13. `emplace`: Constructs elements in-place (public member function).
14. `emplace_hint`: Constructs elements in-place using a hint (public member function).
15. `try_emplace` (C++17): Inserts in-place if the key does not exist, does nothing if the key
16. `insert`: Inserts elements (public member function).
17. `insert_range`: Inserts a range of elements (public member function).
18. `insert_or_assign` (C++17): Inserts an element or assigns to the current element if the key
19. `extract`: Extracts the underlying containers (public member function).
20. `replace`: Replaces the underlying containers (public member function).
21. `erase`: Erases elements (public member function).
22. `swap`: Swaps the contents (public member function).
23. `clear`: Clears the contents (public member function).
24. `find`: Finds an element with specific key (public member function).
25. `count`: Returns the number of elements matching specific key (public member function).
26. `contains`: Checks if the container contains an element with specific key (public member
    function).
27. `lower_bound`: Returns an iterator to the first element not less than the given key (public
    member function).
28. `upper_bound`: Returns an iterator to the first element greater than the given key (public
    member function).
29. `equal_range`: Returns range of elements matching a specific key (public member function).
30. `key_comp`: Returns the function that compares keys (public member function).
31. `value_comp`: Returns the function that compares keys in objects of type `value_type` (public
    member function).
32. `keys`: Direct access to the underlying keys container (public member function).
33. `values`: Direct access to the underlying values container (public member function).

#### Non-member Functions

1. `operator==`, `operator<=>`: Lexicographically compares the values of two flat maps (function
   template).
2. `std::swap( std::flat_map )`: Specializes the `std::swap` algorithm (function template).
3. `erase_if( std::flat_map )`: Erases all elements satisfying specific criteria (function
   template).

#### Helper classes

1. `std::uses_allocator< std::flat_map >` (C++23): Specializes the `std::uses_allocat` or type trait
   (class template specialization).

#### Tags

1. `sorted_unique`, `sorted_unique_t` (C++23): indicates that elements of a range are sorted and
   unique (tag).

## Flat Multimaps

### Explanation

1. Flat multimaps are **an associative container** that **stores elements** formed by **a
   combination of a key value and a mapped value**, **implemented as a sorted sequence**, typically
   using a vector.
2. In a `flat_multimap`, **the key values can be associated with multiple mapped values**, allowing
   for duplicate keys, which distinguishes it from `flat_map`.
3. The types of key and mapped value may differ and are **grouped together** in the member type
   `value_type`, which is **a pair type** combining both:
   `typedef std::pair<const Key, T> value_type;`.
4. **Multiple mapped values** can share **the same key value**, enabling the storage of collections
   of values for each unique key, reflecting the nature of multimaps.
5. Internally, the elements in a `flat_multimap` are **stored as a sorted vector**, which allows for
   **binary search** for **efficient lookups and iteration** based on the key’s order.
6. `flat_multimap` containers can be **faster than traditional multimaps** for **access** to
   individual **elements** by their key due to **contiguous memory storage**, but they may **incur
   overhead for insertions and deletions** due to the need to maintain sorted order.
7. The mapped values in a `flat_multimap` can **be accessed using iterators** or the
   **`equal_range`** method to **retrieve all values** corresponding to **a particular key**.
8. `flat_multimap` is typically **implemented using a sorted vector**, allowing for **fast lookups**
   while maintaining a compact memory footprint.
9. The header file for `flat_multimap` is `<experimental/flat_map>` (or may be found in other
   namespaces in different implementations).

### Declaration Syntax

```CPP
std::flat_multimap< KType, VType > fmmap_name;
```

```CPP
// Not common, not recommend
class Compare {
      bool _reverse;

   public:
      explicit Compare( const bool& rev_param = false ) {
         _reverse = rev_param;
      };

      bool operator()( const KType& lhs, const KType& rhs ) const {
         if( _reverse ) {
            ...
         } else {
            ...
         };
      };
};
std::flat_multimap< KType, VType, Compare > fmmap_name;
```

```CPP
// Not common, not recommend
std::flat_multimap< KType, VType, Compare, KeyContainer< KType >, MappedContainer< VType > > fmmap_name;
```

```CPP
std::flat_multimap< KType, VType >* fmmap_ptr;
```

### Initialization Syntax

```CPP
// Initializer list constructor
std::flat_multimap< KType, VType > fmmap_name = { ... };
```

```CPP
// Initializer list constructor
std::flat_multimap< KType, VType > fmmap_name{ ... };
```

```CPP
// Default constructor. Constructs an empty container adaptor.
std::flat_multimap< KType, VType > fmmap_name;
```

```CPP
// Default constructor.  Constructs an empty container adaptor.
std::flat_multimap< KType, VType, Compare, KeyContainer< KType >, MappedContainer< VType > > fmmap_name;
```

```CPP
// Constructs the two underlying containers by copying the contents of the container `kcont` and `vcont` separately.
// Construct a default `comp` to sort all elements.
KeyContainer< KType > kcont = { ... };
MappedContainer< VType > vcont = { ... };
std::flat_multimap< KType, VType, Compare, KeyContainer< KType >, MappedContainer< VType > > fmmap_name( kcont, vcont );
```

```CPP
// Constructs the two underlying containers by copying the contents of the container `kcont` and `vcont` separately.
// Copy the `comp` to sort all elements.
KeyContainer< KType > kcont = { ... };
MappedContainer< VType > vcont = { ... };
Compare comp;
std::flat_multimap< KType, VType, Compare, KeyContainer< KType >, MappedContainer< VType > > fmmap_name( kcont, vcont, comp );
```

```CPP
// Allow different elements with the same value. Just a tag.
// Constructs the two underlying containers by copying the contents of the container `kcont` and `vcont` separately.
// Construct a default `comp` to sort all elements.
std::sorted_equivalent_t s;
KeyContainer< KType > kcont = { ... };
MappedContainer< VType > vcont = { ... };
std::flat_multimap< KType, VType, Compare, KeyContainer< KType >, MappedContainer< VType > > fmmap_name( s, kcont, vcont );
```

```CPP
// Allow different elements with the same value. Just a tag.
// Constructs the two underlying containers by copying the contents of the container `kcont` and `vcont` separately.
// Copy the `comp` to sort all elements.
std::sorted_equivalent_t s:
KeyContainer< KType > kcont = { ... };
MappedContainer< VType > vcont = { ... };
Compare comp;
std::flat_multimap< KType, VType, Compare, KeyContainer< KType >, MappedContainer< VType > > fmmap_name( s, kcont, vcont, comp );
```

```CPP
// Copy-constructs the comparison functor `comp` with the contents of compare. Value-initializes the underlying container.
Compare comp;
std::flat_multimap< KType, VType, Compare, KeyContainer< KType >, MappedContainer< VType >  > fmmap_name( comp );
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::flat_multimap< KType, VType > fmmap_name1;
// Copy constructor.
std::flat_multimap< KType, VType > fmmap_name2( fmmap_name1 );
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::flat_multimap< KType, VType > fmmap_name1;
// Copy constructor.
std::flat_multimap< KType, VType > fmmap_name2 = fmmap_name1;
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::flat_multimap< KType, VType > fmmap_name1;
// Move constructor.
std::flat_multimap< KType, VType > fmmap_name2( std::move( fmmap_name1 ) );
```

```CPP
// Allow different elements with the same value. Just a tag.
// Constructs the two underlying containers by copying the contents of the container `kcont` and `vcont` separately.
// Copy the `comp` to sort all elements.
std::sorted_equivalent_t s;
KeyContainer< KType > kcont = { ... };
MappedContainer< VType > vcont = { ... };
Compare comp;
std::flat_multimap< KType, VType, Compare, KeyContainer< KType >, MappedContainer< VType > > fmmap_name1( s, kcont, vcont, comp );
// Constructs the container with the contents of the range `[first, last)`.
std::flat_multimap< KType, VType, Compare, KeyContainer< KType >, MappedContainer< VType >  > fmmap_name2( s /* optional */, fmmap_name1.begin(), fmmap_name1.end(), comp /* optional */ );
```

```CPP
std::flat_multimap< KType, VType >* fmmap_ptr = new std::flat_multimap< KType, VType >;
```

```CPP
// Default constructor. Value-initializes the comparator and the underlying container.
std::flat_multimap< KType, VType > fmmap_name;
std::flat_multimap< KType, VType >* fmmap_ptr = new std::flat_multimap< KType, VType >( fmmap_name );
```

### Syntax for Deleting `std::flat_multimap` Pointers

```CPP
delete fmmap_ptr;
```

### Members and Related Stuffs

#### Links

1. [`std::flat_multimap` in cplusplus]().
2. [`std::flat_multimap` in cppreference](https://en.cppreference.com/w/cpp/container/flat_multimap).

#### Template Parameters

1. `Key`: The type of the keys.
2. `T`: The type of mapped values.
3. `Compare`: A `Compare` type providing a strict weak ordering. By default, the first key (smallest
   key) is at the beginning of the flat set because its default `Compare` is `std::less< Key >`,
   which sorts the elements in ascending order.
4. `KeyContainer`, `MappedContainer`: The type of the underlying SequenceContainer to store the
   elements. The iterators of such container should satisfy `LegacyRandomAccessIterator` or model
   `random_access_iterator`. The standard containers `std::vector` and `std::deque` satisfy these
   requirements.

#### Member Types

1. `key_containre_type`: `KeyContainer`.
2. `mapped_containre_type`: `MappedContainer`.
3. `key_type`: `Key`.
4. `mapped_type`: `T`.
5. `value_type`: `std::pair< key_type, mapped_type >`.
6. `key_compare`: `Compare`.
7. `reference`: `std::pair< const key_type&, mapped_type& >`.
8. `const_reference`: `std::pair< const key_type&, const mapped_type& >`.
9. `size_type`: `std::size_t`.
10. `difference_type`: `std::ptrdiff_t`.
11. `iterator`: Implementation-defined `LegacyInputIterator` and `random_access_iterator` to
    `value_type`.
12. `const_iterator`: Implementation-defined `LegacyInputIterator` and `random_access_iterator` to
    `const value_type`.
13. `reverse_iterator`: `std::reverse_iterator< iterator >`.
14. `const_reverse_iterator`: `std::reverse_iterator< const_iterator >`.
15. `containers`: Type describing the underlying containers.
    ```CPP
    struct containers {
          key_container_type keys;
          mapped_container_type values;
    };
    ```

#### Member Classes

1. `value_compare`: Compares objects of type `value_type` (class).

#### Member Objects

1. `c` (`private`): The object of type containers (exposition-only member object`*`).
2. `compare` (`private`): The comparison function object of type `key_compare` (exposition-only
   member object`*`).

#### Member Functions

1. (constructor): Constructs the flat multimap (public member function).
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
15. `extract`: Extracts the underlying containers (public member function).
16. `replace`: Replaces the underlying containers (public member function).
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
28. `keys`: Direct access to the underlying keys container (public member function).
29. `values`: Direct access to the underlying values container (public member function).

#### Non-member Functions

1. `operator==`, `operator<=>`: Lexicographically compares the values of two flat multimaps
   (function template).
2. `std::swap( std::flat_multimap )`: Specializes the `std::swap` algorithm (function template).
3. `erase_if( std::flat_multimap )`: Erases all elements satisfying specific criteria (function
   template).

#### Helper classes

1. `std::uses_allocator< std::flat_multimap >` (C++23): Specializes the `std::uses_allocat` or type
   trait (class template specialization).

#### Tags

1. `sorted_equivalent`, `sorted_equivalent_t` (C++23): indicates that elements of a range are sorted
   and unique (tag).

<!-- vim-markdown-toc GFM -->

- [Introduction to C++ STL](#introduction-to-c-stl)
  - [Explanation](#explanation)
  - [Containers](#containers)
    - [Explanation](#explanation-1)
    - [Types of Containers](#types-of-containers)
    - [Header File](#header-file)
  - [Algorithms](#algorithms)
    - [Explanation](#explanation-2)
    - [Common Algorithms](#common-algorithms)
    - [Header File](#header-file-1)
  - [Iterators](#iterators)
    - [Explanation](#explanation-3)
    - [Types of Iterators](#types-of-iterators)
    - [Header File](#header-file-2)
  - [Function Objects and Lambdas](#function-objects-and-lambdas)
    - [Explanation](#explanation-4)
    - [Usage](#usage)
    - [Header File](#header-file-3)
  - [Input/Output (I/O)](#inputoutput-io)
    - [Explanation](#explanation-5)
    - [Common Classes](#common-classes)
    - [Header File](#header-file-4)
  - [Utilities](#utilities)
    - [Explanation](#explanation-6)
    - [Common Utilities](#common-utilities)
    - [Header File](#header-file-5)
  - [EASTL](#eastl)

<!-- vim-markdown-toc -->

## Introduction to C++ STL

### Explanation

1. The C++ Standard **Template** Library (STL) is a powerful collection of **template classes and
   functions** that provide generic and reusable components.
2. It consists of various components that work together to simplify the development of complex
   programs.
3. Because it is a collection of **template classes and functions**, all **syntax** applicable to
   templates, classes, and functions can also be applied to it.
4. The C++ STL components are typically **defined in header files** because they rely heavily on
   templates.
5. Below are the six **basic** components of STL.

### Containers

#### Explanation

1. Containers are **data structures** that store collections of objects.
2. They manage the **storage**, **organization**, and **access of data**.
3. Containers in STL can be broadly categorized into **four types**: **sequence containers**,
   **associative containers**, **unordered associative containers** and **container adopters**.

#### Types of Containers

1. Sequence containers: Store elements in a linear order.
   - `std::vector`: A dynamic array that allows fast random access.
   - `std::list`: A doubly-linked list that allows efficient insertions and deletions.
   - `std::deque`: A double-ended queue that allows fast insertions and removals from both ends.
2. Associative containers: Store elements in a specific order, typically based on keys.
   - `std::set`: A collection of unique keys that are sorted automatically.
   - `std::multiset`: A collection of keys that are sorted automatically.
   - `std::map`: A collection of key-value pairs where keys are unique and sorted.
   - `std::multimap`: A collection of key-value pairs where keys are not unique and sorted.
3. Unordered associative containers: Store elements without a specific order, allowing for faster
   access.
   - `std::unordered_set`: A collection of unique keys with no order.
   - `std::unordered_multiset`: A collection of keys with no order.
   - `std::unordered_map`: A collection of key-value pairs with no order and each key is unique.
   - `std::unordered_multimap`: A collection of key-value pairs with no order and multiple elements
4. Container adaptors: Provide a specific interface for using underlying containers.
   - `std::stack`: A last-in, first-out (LIFO) data structure that allows access to the most
     recently added element.
   - `std::queue`: A first-in, first-out (FIFO) data structure that allows access to the oldest
     added element.
   - `std::priority_queue`: A data structure that allows access to the largest (or smallest) element
     based on a priority criterion.
   - `flat_set`: A sorted collection of unique keys, implemented using a `std::vector`.
   - `flat_multiset`: A sorted collection of keys that can contain duplicates, also implemented
     using a `std::vector`.
   - `flat_map`: A sorted collection of key-value pairs where keys are unique, implemented using a
     `std::vector`.
   - `flat_multimap`: A sorted collection of key-value pairs where keys can be duplicated,
     implemented using a `std::vector`. can have the equivalent key.

#### Header File

1. `<vector>`, `<list>`, `<deque>`, `<set>`, `<map>`, `<unordered_set>`, `<unordered_map>`,
   `<stack>`, `<queue>`, `<flat_set>`, `<flat_map>`.

### Algorithms

#### Explanation

1. Algorithms are **a set of functions** that **operate on containers**.
2. They provide a range of operations such as searching, sorting, transforming, and manipulating
   data within containers.

#### Common Algorithms

1. `std::sort`: Sorts the elements in a range.
2. `std::find`: Searches for a value in a range.
3. `std::copy`: Copies elements from one range to another.

#### Header File

1. `<algorithm>`.

### Iterators

#### Explanation

1. Iterators are **objects** that **allow traversal through the elements of a container**.
2. They provide **a uniform way to access container elements** without exposing the underlying
   implementation.
3. It behaves like a pointer ( stores an address and can be dereferenced ).
4. When a container **resizes its capacity or rehashes**, its **iterators** may become **invalid**.
5. **Using invalid iterators causes undefined behaviors**.
6. More information on **iterator validity** after modification operations is provided below.
   - [iterator invalidation](https://en.cppreference.com/w/cpp/container#Iterator_invalidation).

#### Types of Iterators

1. Input iterators: Read elements from a container.
2. Output iterators: Write elements to a container.
3. Forward iterators: Move forward in a container and allow reading and writing.
4. Bidirectional iterators: Move in both directions (forward and backward).
5. Random Access iterators: Provide direct access to elements using offsets.

#### Header File

1. `<iterator>`.

### Function Objects and Lambdas

#### Explanation

1. Function objects (functors) are **objects that can be called as if they were functions**.
2. They **overload the function call `operator()`**; for example, for comparisons, sorting, etc.
3. They can **store state** and are often used **in algorithms to customize their behavior**.
4. Lambda expressions provide a concise way to define anonymous function objects.

#### Usage

1. Function objects can be created by overloading the `operator()`.
2. Lambda expressions can be defined using the syntax `[capture]( para_list ) { body; };`.
3. More information about lambdas is provided in Section [1Lambda Functions](#10-lambda-functions).

#### Header File

1. `<functional>`

### Input/Output (I/O)

#### Explanation

1. The I/O component of STL provides **facilities for reading and writing data**.
2. It simplifies interactions with various input and output sources, such as files and standard
   input/output streams.

#### Common Classes

1. `std::istream`: For input streams (e.g., reading from the console).
2. `std::ostream`: For output streams (e.g., writing to the console).
3. `std::fstream`: For file input and output.

#### Header File

1. `<iostream>`, `<fstream>`, `<sstream>`

### Utilities

#### Explanation

1. Utilities in STL provide **general-purpose functionality** that aids in programming tasks.
2. This includes support for pairs, tuples, and smart pointers.

#### Common Utilities

1. `std::pair`: A simple container to store two values.
2. `std::tuple`: A fixed-size collection of heterogeneous values.
3. `std::unique_ptr`: A smart pointer that manages a dynamically allocated object.

#### Header File

`<utility>`, `<tuple>`, `<memory>`

### EASTL

1. EASTL is **a open source library**, **optimized for game developers**.
2. The **performance** of EASTL is **higher than STL**.

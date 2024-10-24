<!-- vim-markdown-toc GFM -->

- [Introduction to C++ STL](#introduction-to-c-stl)
  - [0) Explanation](#0-explanation)
  - [1) Containers](#1-containers)
    - [Explanation](#explanation)
    - [Types of Containers](#types-of-containers)
    - [Header File](#header-file)
  - [2) Algorithms](#2-algorithms)
    - [Explanation](#explanation-1)
    - [Common Algorithms](#common-algorithms)
    - [Header File](#header-file-1)
  - [3) Iterators](#3-iterators)
    - [Explanation](#explanation-2)
    - [Types of Iterators](#types-of-iterators)
    - [Header File](#header-file-2)
  - [4) Function Objects and Lambdas](#4-function-objects-and-lambdas)
    - [Explanation](#explanation-3)
    - [Usage](#usage)
    - [Header File](#header-file-3)
  - [5) Input/Output (I/O)](#5-inputoutput-io)
    - [Explanation](#explanation-4)
    - [Common Classes](#common-classes)
    - [Header File](#header-file-4)
  - [6) Utilities](#6-utilities)
    - [Explanation](#explanation-5)
    - [Common Utilities](#common-utilities)
    - [Header File](#header-file-5)
  - [EASTL](#eastl)

<!-- vim-markdown-toc -->

## Introduction to C++ STL

### 0) Explanation

1. The C++ Standard **Template** Library (STL) is a powerful collection of **template classes and
   functions** that provide generic and reusable components. It consists of various components that
   work together to simplify the development of complex programs.
2. Because it is a collection of **template classes and functions**, all **syntax** applicable to
   templates, classes, and functions can also be applied to it.
3. The C++ STL components are typically **defined in header files** because they rely heavily on
   templates.
4. Below are the six **basic** components of STL.

### 1) Containers

#### Explanation

1. Containers are **data structures** that store collections of objects. They manage the
   **storage**, **organization**, and **access of data**. Containers in STL can be broadly
   categorized into three types: sequence containers, associative containers, and unordered
   associative containers.

#### Types of Containers

1. Sequence Containers: Store elements in a linear order.
   - `std::vector`: A dynamic array that allows fast random access.
   - `std::list`: A doubly-linked list that allows efficient insertions and deletions.
   - `std::deque`: A double-ended queue that allows fast insertions and removals from both ends.
2. Associative Containers: Store elements in a specific order, typically based on keys.
   - `std::set`: A collection of unique keys that are sorted automatically.
   - `std::map`: A collection of key-value pairs where keys are unique and sorted.
3. Unordered Associative Containers: Store elements without a specific order, allowing for faster
   access.
   - `std::unordered_set`: A collection of unique keys with no order.
   - `std::unordered_map`: A collection of key-value pairs with no order.

#### Header File

`<vector>`, `<list>`, `<deque>`, `<set>`, `<map>`, `<unordered_set>`, `<unordered_map>`

### 2) Algorithms

#### Explanation

1. Algorithms are **a set of functions** that **operate on containers**. They provide a range of
   operations such as searching, sorting, transforming, and manipulating data within containers.

#### Common Algorithms

1. `std::sort`: Sorts the elements in a range.
2. `std::find`: Searches for a value in a range.
3. `std::copy`: Copies elements from one range to another.

#### Header File

`<algorithm>`

### 3) Iterators

#### Explanation

1. Iterators are **objects** that **allow traversal through the elements of a container**. They
   provide a uniform way to access container elements without exposing the underlying
   implementation.
2. It behaves like a pointer ( stores an address and can be dereferenced ).

#### Types of Iterators

1. Input Iterators: Read elements from a container.
2. Output Iterators: Write elements to a container.
3. Forward Iterators: Move forward in a container and allow reading and writing.
4. Bidirectional Iterators: Move in both directions (forward and backward).
5. Random Access Iterators: Provide direct access to elements using offsets.

#### Header File

`<iterator>`

### 4) Function Objects and Lambdas

#### Explanation

1. Function objects (functors) are **objects that can be called as if they were functions**. They
   can **store state** and are often used **in algorithms to customize their behavior**. Lambda
   expressions provide a concise way to define anonymous function objects.

#### Usage

1. Function objects can be created by overloading the `operator()`.
2. Lambda expressions can be defined using the syntax `[capture]( para_list ) { body; };`.
3. More information about lambdas is provided in Section
   [10) Lambda Functions](#10-lambda-functions).

#### Header File

`<functional>`

### 5) Input/Output (I/O)

#### Explanation

1. The I/O component of STL provides **facilities for reading and writing data**. It simplifies
   interactions with various input and output sources, such as files and standard input/output
   streams.

#### Common Classes

1. `std::istream`: For input streams (e.g., reading from the console).
1. `std::ostream`: For output streams (e.g., writing to the console).
1. `std::fstream`: For file input and output.

#### Header File

`<iostream>`, `<fstream>`, `<sstream>`

### 6) Utilities

#### Explanation

1. Utilities in STL provide **general-purpose functionality** that aids in programming tasks. This
   includes support for pairs, tuples, and smart pointers.

#### Common Utilities

1. `std::pair`: A simple container to store two values.
2. `std::tuple`: A fixed-size collection of heterogeneous values.
3. `std::unique_ptr`: A smart pointer that manages a dynamically allocated object.

#### Header File

`<utility>`, `<tuple>`, `<memory>`

### EASTL

1. EASTL is **a open source library**, **optimized for game developers**.
2. The **performance** of EASTL is **higher than STL**.

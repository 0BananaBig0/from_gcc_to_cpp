<!-- vim-markdown-toc GFM -->

- [Threads](#threads)
  - [Explanation](#explanation)
    - [`std::thread`](#stdthread)
      - [Explanation](#explanation-1)
      - [Declaration Syntax](#declaration-syntax)
      - [Initialization Syntax](#initialization-syntax)
      - [Members and Related Stuffs](#members-and-related-stuffs)
        - [Links](#links)
        - [Member Types](#member-types)
        - [Member functions](#member-functions)
        - [Non-member functions](#non-member-functions)
        - [See also](#see-also)
    - [`std::jthread`](#stdjthread)
      - [Explanation](#explanation-2)
      - [Declaration Syntax](#declaration-syntax-1)
      - [Initialization Syntax](#initialization-syntax-1)
      - [Members and Related Stuffs](#members-and-related-stuffs-1)
        - [Links](#links-1)
        - [Member Types](#member-types-1)
        - [Member functions](#member-functions-1)
        - [Non-member functions](#non-member-functions-1)
  - [`std::this_thread`](#stdthis_thread)
    - [Explanation](#explanation-3)
    - [Links](#links-2)
    - [`std::this_thread::get_id`](#stdthis_threadget_id)
      - [Explanation](#explanation-4)
      - [Syntax](#syntax)
    - [`std::this_thread::sleep_for`](#stdthis_threadsleep_for)
      - [Explanation](#explanation-5)
      - [Syntax](#syntax-1)
    - [`std::this_thread::sleep_until`](#stdthis_threadsleep_until)
      - [Explanation](#explanation-6)
      - [Syntax](#syntax-2)
    - [`std::this_thread::yield`](#stdthis_threadyield)
    - [Explanation](#explanation-7)
      - [Syntax](#syntax-3)
  - [`std::async`](#stdasync)
    - [Explanation](#explanation-8)
    - [Syntax](#syntax-4)
    - [Related Stuffs](#related-stuffs)
      - [Links](#links-3)
      - [Parameters](#parameters)
      - [Return Value](#return-value)
      - [Launching Policies](#launching-policies)
    - [Notes](#notes)
  - [`std::future`](#stdfuture)
    - [Explanation](#explanation-9)
    - [Declaration Syntax](#declaration-syntax-2)
    - [Initialization Syntax](#initialization-syntax-2)
      - [Members and Related Stuffs](#members-and-related-stuffs-2)
        - [Links](#links-4)
        - [Member Functions](#member-functions-2)
  - [`std::shared_future`](#stdshared_future)
    - [Declaration Syntax](#declaration-syntax-3)
    - [Initialization Syntax](#initialization-syntax-3)
    - [Members and Related Stuffs](#members-and-related-stuffs-3)
      - [Links](#links-5)
      - [Member Functions](#member-functions-3)
  - [Differences Between `std::future` and `std::shared_future`](#differences-between-stdfuture-and-stdshared_future)
  - [Notes](#notes-1)

<!-- vim-markdown-toc -->

## Threads

### Explanation

1. C++ provides native support for **multithreading** through **the `<thread>` library**, allowing
   programs to execute tasks concurrently on multiple cores.
2. A thread is the smallest sequence of programmed instructions that can be managed independently by
   the scheduler. C++ uses the `std::thread` class to create and manage threads.

#### `std::thread`

##### Explanation

1. `std::thread` is **a class** that represents **an individual thread of execution**.
2. A thread of execution is **a sequence of instructions** that can be executed **concurrently**
   with other such sequences in multithreading environments, while **sharing a same address space**.
3. **An initialized thread object** represents **an active thread** of execution; Such a thread
   object is `joinable`, and has **a unique `thread id`**.
4. **A default-constructed (non-initialized) thread object** is **not `joinable`**, and **its
   `thread id`** is **common for all non-joinable threads**.
5. A `joinable` thread becomes not `joinable` if moved from, or if either `join` or `detach` are
   called on them.
6. A `std::thread` object cannot be copied because its copy constructor is deleted.
7. Its header file is `<thread>`.

##### Declaration Syntax

```CPP
std::thread thread_name;
```

##### Initialization Syntax

```CPP
// Default constructor.
std::thread thread_name;
```

```CPP
// Initialization constructor.
std::thread thread_name( funName, arg_list_of_funName );
```

```CPP
// Initialization constructor.
std::thread thread_name( fun_ptr, arg_list_of_fun_ptr );
```

```CPP
// Initialization constructor.
std::thread thread_name( a_lambad_func, arg_list_of_the_lambad_func );
```

```CPP
// Move constructor.
std::thread thread_name1( ... );
std::thread thread_name2( std::move( thread_name1 ) );
```

```CPP
// Move constructor.
std::thread thread_name1( ... );
std::thread thread_name2 = std::move( thread_name1 );
```

##### Members and Related Stuffs

###### Links

1. [`std::thread` in cplusplus](https://cplusplus.com/reference/thread/thread/).
2. [`std::thread` in cppreference](https://en.cppreference.com/w/cpp/thread/thread).

###### Member Types

1. `native_handle_type` (optional): Implementation-defined.
2. `id`: Represents the `id` of a thread (public member class).

###### Member functions

1. (constructor): Constructs new thread object (public member function).
2. (destructor): Destructs the thread object, underlying thread must be joined or detached (public
   member function).
3. `operator=`: Moves the thread object (public member function).
4. `joinable`: Checks whether the thread is joinable, i.e. potentially running in parallel context
   (public member function).
5. `get_id`: Returns the `id` of the thread (public member function).
6. `native_handle`: Returns the underlying implementation-defined thread handle (public member
   function).
7. `hardware_concurrency` [`static`]: Returns the number of concurrent threads supported by the
   implementation (public static member function).
8. `join`: Waits for the thread to finish its execution (public member function).
9. `detach`: Permits the thread to execute independently from the thread handle (public member
   function).
10. `swap`: Swaps two thread objects (public member function).

###### Non-member functions

1. `std::swap( std::thread )`: Specializes the `std::swap` algorithm (function).

###### See also

1. `std::jthread` (C++20): `std::thread` with support for auto-joining and cancellation (class).

#### `std::jthread`

##### Explanation

1. `std::jthread` is **a class** that represents **a managed thread of execution** with **automatic
   joining** and **optional cooperative cancellation**.
2. A `std::jthread` executes **a sequence of instructions** that can run **concurrently** with other
   threads, all **sharing the same address space** in a multithreaded environment.
3. **An initialized `std::jthread` object** represents **an active thread** of execution that is
   **automatically joined** when the object is destroyed, making it safer and more convenient to
   manage.
4. **A default-constructed (non-initialized) `std::jthread` object** is **not `joinable`**, and
   **its `thread id`** is set to **a default value shared by all non-joinable threads**.
5. A `std::jthread` object becomes not `joinable` if it has been moved from, or after it completes
   its execution and is automatically joined.
6. A `std::jthread` object cannot be copied because its copy constructor is deleted.
7. **Cooperative cancellation** is supported through a `stop_token`, which allows a thread to
   respond to stop requests and terminate gracefully.
8. Its header file is `<thread>`.

##### Declaration Syntax

```CPP
std::jthread thread_name;
```

##### Initialization Syntax

```CPP
// Default constructor.
std::jthread thread_name;
```

```CPP
// Initialization constructor.
std::jthread thread_name( funName, arg_list_of_funName );
```

```CPP
// Initialization constructor.
std::jthread thread_name( fun_ptr, arg_list_of_fun_ptr );
```

```CPP
// Initialization constructor.
std::jthread thread_name( a_lambad_func, arg_list_of_the_lambad_func );
```

```CPP
// Move constructor.
std::jthread thread_name1( ... );
std::jthread thread_name2( std::move( thread_name1 ) );
```

```CPP
// Move constructor.
std::jthread thread_name1( ... );
std::jthread thread_name2 = std::move( thread_name1 );
```

##### Members and Related Stuffs

###### Links

1. [`std::jthread` in cplusplus]().
2. [`std::jthread` in cppreference](https://en.cppreference.com/w/cpp/thread/jthread).

###### Member Types

1. `native_handle_type` (optional): Implementation-defined.
2. `id`: Represents the `id` of a thread (public member class).

###### Member functions

1. (constructor): Constructs new thread object (public member function).
2. (destructor): If the thread is joinable, then a stop is requested and the thread joins (public
   member function).
3. `operator=`: Moves the jthread object (public member function).
4. `joinable`: Checks whether the thread is joinable, i.e. potentially running in parallel context
   (public member function).
5. `get_id`: Returns the `id` of the thread (public member function).
6. `native_handle`: Returns the underlying implementation-defined thread handle (public member
   function).
7. `hardware_concurrency` [`static`]: Returns the number of concurrent threads supported by the
   implementation (public static member function).
8. `join`: Waits for the thread to finish its execution (public member function).
9. `detach`: Permits the thread to execute independently from the thread handle (public member
   function).
10. `swap`: Swaps two thread objects (public member function).
11. `get_stop_source`: Returns a `stop_source` object associated with the shared stop state of the
    thread (public member function).
12. `get_stop_token`: Returns a `stop_token` associated with the shared stop state of the thread
    (public member function).
13. `request_stop`: Requests execution stop via the shared stop state of the thread (public member
    function).

###### Non-member functions

1. `std::swap( std::jthread )` (C++20): Specializes the `std::swap` algorithm (function).

### `std::this_thread`

#### Explanation

1. The `std::this_thread` **namespace** provides utilities for **interacting with the current thread
   of execution**.
2. It contains functions to **retrieve the thread’s ID, pause execution, or yield to other
   threads**.
3. Its header file is `<thread>`.

#### Links

1. [`std::this_thread` in cplusplus](https://cplusplus.com/reference/thread/this_thread/).
2. [`std::this_thread` in cppreference](https://en.cppreference.com/w/cpp/symbol_index/this_thread).

#### `std::this_thread::get_id`

##### Explanation

1. `std::this_thread::get_id()` is a function used to **retrieve the ID** of the current thread,
   which is useful for **debugging or logging** purposes.

##### Syntax

```CPP
// Its declaration syntax.
std::thread::id get_id() noexcept;
```

#### `std::this_thread::sleep_for`

##### Explanation

1. `std::this_thread::sleep_for` is a function used to **block the execution of the current thread**
   for **at least the specified `sleep_duration`**.
2. This function **may block for longer** than the `sleep_duration` due to scheduling or resource
   contention delays.
3. The standard **recommends** that **a steady clock** be used to measure the duration.
4. If an implementation uses a system clock instead, the wait time may also be sensitive to clock
   adjustments.

##### Syntax

```CPP
// Its declaration syntax.
template< class Rep, class Period >
void sleep_for( const std::chrono::duration< Rep, Period >& sleep_duration );
```

#### `std::this_thread::sleep_until`

##### Explanation

1. `std::this_thread::sleep_until` is a function used **blocks the calling thread** **until the
   specified `sleep_time`**.
2. The execution of the current thread is paused until at least `sleep_time`, while other threads
   may continue to execute during this period.

##### Syntax

```CPP
// Its declaration syntax.
template< class Clock, class Duration >
void sleep_until(
   const std::chrono::time_point< Clock, Duration >& sleep_time );
```

#### `std::this_thread::yield`

#### Explanation

1. The calling thread yields, **offering the implementation the opportunity to reschedule**.
2. This function shall be called when a thread waits for other threads to advance without blocking.

##### Syntax

```CPP
// Its declaration syntax.
void yield() noexcept;
```

### `std::async`

#### Explanation

1. `std::async` is **a template function** that calls `F` (with `Args` as arguments) at some point,
   returning without waiting for the execution of `F` to complete.
2. The **value returned** by `F` can be **accessed through the `future` object** returned (by
   **calling its member `future::get`**).
3. **The second version** (2) lets the caller **select a specific launching policy**, while **the
   first version** (1) uses **automatic selection**, as if calling (2) with
   `launch::async`|`launch::deferred` as policy.
4. Its header file is `<future>`.

#### Syntax

```CPP
// Declaration syntax.
// The first version.
template< class F, class... Args >
std::future< /* see below */ > async( F&& f,
                                      Args&&... args );   // (since C++11)
```

```CPP
// Declaration syntax.
// The second version.
template< class F, class... Args >
std::future< /* see below */ > async( std::launch policy,
                                      F&& f,
                                      Args&&... args );   // (since C++11)
```

```CPP
// Usage syntax.
std::future< RetType > obj_name = std::async( ... );
```

#### Related Stuffs

##### Links

1. [`std::async` in cplusplus](https://cplusplus.com/reference/future/async/).
2. [`std::async` in cppreference](https://en.cppreference.com/w/cpp/thread/async).

##### Parameters

1. `f` : Callable object to call.
2. `args`: Parameters to pass to `f`.
3. `policy`: Bitmask value, where individual bits control the allowed methods of execution.

##### Return Value

1. `std::future`: Referring to the shared state created by this call to `std::async`.

##### Launching Policies

1. **Asynchronous** (`launch::async`):
   - Launches a new thread to call `F` (as if a `thread` object is constructed with `F` and `Args`
     as arguments, and accessing the shared state of the returned `future` joins it).
2. **Deferred** (`launch::deferred`):
   - The call to `F` is deferred until the shared state of the returned `future` is accessed (with
     `wait` or `get`).
   - At that point, `F` is called and the function is no longer considered deferred.
   - When this call returns, the shared state of the returned `future` is made ready.
3. **Automatic** (`launch::async`|`launch::deferred`):
   - The function chooses the policy automatically (at some point).
   - This **depends on the system and library implementation**, which generally optimizes for the
     current availability of concurrency in the system.
4. Particular library implementations may support additional launching policies, with the proper
   label defined in type launch. Combining multiple values is possible, in which case, the function
   automatically chooses one among them.

#### Notes

1. Pay attention to the lifetimes of variables or objects passed to a function executed
   asynchronously. Instead of passing them as references, it may be **better to copy them into the
   function**.
2. **Passing variables or objects as references** can **lead to issues**. Instead, **passing them as
   pointers** might be **a better option**.

### `std::future`

#### Explanation

1. `std::future` is **a template class** used to **represent the result of an asynchronous
   operation**.
2. It provides a mechanism to access the result of a function that runs concurrently, typically on a
   separate thread.
3. This allows a thread to **retrieve results at some point** in the future, **once the asynchronous
   task has completed**.
4. `std::future` is generally used in **combination with `std::async`, `std::promise`, or
   thread-based libraries**. It **acts as a placeholder** for the result that will eventually become
   available.
5. A `std::future` object **cannot be copied**, but it can be moved.
6. Its header file is `<future>`.

#### Declaration Syntax

```CPP
// Declaration syntax.
template< class T > class future;         // (1)   (since C++11)
template< class T > class future< T& >;   // (2)   (since C++11)
template<> class future< void >;          // (3)   (since C++11)
```

```CPP
std::future< Type > fut_name;
```

#### Initialization Syntax

```CPP
// Default constructor.
std::future< Type > fut_name1;
// Move constructor.
std::future< Type > fut_name1 = std::move( fut_name1 );
```

##### Members and Related Stuffs

###### Links

1. [`std::future` in cplusplus](https://cplusplus.com/reference/future/future/).
2. [`std::future` in cppreference](https://en.cppreference.com/w/cpp/thread/future).

###### Member Functions

1. (constructor): Constructs the `future` object ( Only default and move ) (public member function).
2. (destructor): Destructs the `future` object (public member function).
3. `operator=`: Moves the `future` object ( Only Move ) (public member function).
4. `share`: Transfers the shared state from `*this` to a `shared_future` and returns it (public.
   member function)
5. `get`: Returns **the result** if the result is **available**. **Otherwise**, **blocks the calling
   thread**. And **only** allows to **call once**.(public member function).
6. `valid`: Checks if the `future` has a shared state (public member function).
7. `wait: waits`: For the result to become available (public member function).
8. `wait_for`: Waits for the result, returns if it is not available for the specified timeout
   duration (public member function).
9. `wait_until`: Waits for the result, returns if it is not available until specified time point has
   been reached (public member function).

### `std::shared_future`

1. **The class template** `std::shared_future` provides a mechanism to access the result of
   asynchronous operations, similar to `std::future`, except that **multiple threads are allowed to
   wait for the same shared state**.
2. Unlike `std::future`, which is only moveable (so only one instance can refer to any particular
   asynchronous result), `std::shared_future` is **copyable** and **multiple shared future objects**
   may **refer to the same shared state**.
3. **Access to the same shared state from multiple threads** is safe if each thread does it through
   its own copy of a `shared_future` object.
4. Its header file is `<future>`.

#### Declaration Syntax

```CPP
// Declaration syntax.
template< class T > class shared_future;         // (1)   (since C++11)
template< class T > class shared_future< T& >;   // (2)   (since C++11)
template<> class shared_future< void >;          // (3)   (since C++11)
```

```CPP
std::shared_future< Type > sfut_name;
```

#### Initialization Syntax

```CPP
// Default constructor.
std::shared_future< Type > sfut_name1;
// Copy constructor.
std::shared_future< Type > sfut_name2 = fut_name1;
```

```CPP
// Default constructor.
std::shared_future< Type > sfut_name1;
// Move constructor.
std::shared_future< Type > sfut_name2 = std::move( fut_name1 );
```

```CPP
std::future< Type > fut_name;
// Move constructor.
std::shared_future< Type > sfut_name = std::move( fut_name );
```

#### Members and Related Stuffs

##### Links

1. [`std::shared_future` in cplusplus](https://cplusplus.com/reference/future/shared_future/).
2. [`std::shared_future` in cppreference](https://en.cppreference.com/w/cpp/thread/shared_future).

##### Member Functions

1. (constructor): Constructs the future object (public member function).
2. (destructor): Destructs the future object (public member function).
3. `operator=`: Assigns the contents (public member function).
4. `get`: Returns the result (public member function).
5. `valid`: Checks if the future has a shared state (public member function).
6. `wait`: Waits for the result to become available (public member function).
7. `wait_for`: Waits for the result, returns if it is not available for the specified timeout
   duration (public member function).
8. `wait_until`: Waits for the result, returns if it is not available until specified time point has
   been reached (public member function).

### Differences Between `std::future` and `std::shared_future`

1. Ownership:
   - `std::future`: Sole ownership of the result.
   - `std::shared_future`: Shared ownership; multiple instances can access the same result.
2. Result retrieval:
   - `std::future`: The result can only be retrieved once using `get()`.
   - `std::shared_future`: The result can be retrieved multiple times by different instances.
3. Copyability:
   - `std::future`: Non-copyable but movable.
   - `std::shared_future`: Copyable and movable; can be shared across multiple threads.
4. Exception handling:
   - Both: If the asynchronous task throws an exception, it is propagated on the first call to
     `get()`.
   - `std::shared_future`: The same exception can be propagated multiple times across all calls to
     `get()`.
5. Use case:
   - `std::future`: When only one thread needs the result, and the result is used only once.
   - `std::shared_future`: When multiple threads need access to the same result, or the result needs
     to be accessed multiple times.
6. Conversion:
   - `std::future` can be converted to `std::shared_future` using the `share()` function.

### Notes

1.  A game typically loads different objects asynchronously and in parallel using multiple threads.
    This is why, at times, players can control their characters while some objects remain
    unresponsive.
2.  **To the best of my knowledge, all classes related to threads lack a copy constructor, except
    for some classes with a `shared` prefix or suffix.**

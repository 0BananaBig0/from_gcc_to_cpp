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
      - [Notes](#notes)
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
  - [`std::ref` and `std::cref`](#stdref-and-stdcref)
    - [Explanation](#explanation-8)
    - [Syntax](#syntax-4)
  - [Six STD Mutex Classes](#six-std-mutex-classes)
    - [`std::mutex`](#stdmutex)
    - [`std::recursive_mutex`](#stdrecursive_mutex)
    - [`std::timed_mutex`](#stdtimed_mutex)
    - [`std::recursive_timed_mutex`](#stdrecursive_timed_mutex)
    - [`std::shared_mutex`](#stdshared_mutex)
    - [`std::shared_timed_mutex`](#stdshared_timed_mutex)
    - [Syntax](#syntax-5)
    - [Members and Related Stuffs](#members-and-related-stuffs-2)
      - [Links](#links-3)
      - [Nested Types](#nested-types)
      - [Member Functions](#member-functions-2)
    - [**Notes**](#notes-1)
    - [Mutex Locking](#mutex-locking)
    - [Mutual Exclusion](#mutual-exclusion)
    - [Unlocking](#unlocking)
    - [Key Points to Consider](#key-points-to-consider)
  - [`std::lock_guard`](#stdlock_guard)
    - [Explanation](#explanation-9)
    - [Syntax](#syntax-6)
    - [Members and Related Stuffs](#members-and-related-stuffs-3)
      - [Links](#links-4)
      - [Template Parameters](#template-parameters)
      - [Member Types](#member-types-2)
      - [Member Functions](#member-functions-3)
  - [`std::unique_lock` and `std::shared_lock`](#stdunique_lock-and-stdshared_lock)
    - [`std::unique_lock`](#stdunique_lock)
    - [`std::shared_lock`](#stdshared_lock)
    - [Syntax](#syntax-7)
    - [Members and Related Stuffs](#members-and-related-stuffs-4)
      - [Links](#links-5)
      - [Template Parameters](#template-parameters-1)
      - [Nested Types](#nested-types-1)
      - [Member Functions](#member-functions-4)
      - [Non-member Functions](#non-member-functions-2)
  - [`std::scoped_lock`](#stdscoped_lock)
    - [Explanation](#explanation-10)
    - [Syntax](#syntax-8)
    - [Members and Related Stuffs](#members-and-related-stuffs-5)
      - [Links](#links-6)
      - [Template Parameters](#template-parameters-2)
      - [Member Types](#member-types-3)
      - [Member Functions](#member-functions-5)
  - [`std::lock` and `std::try_lock`](#stdlock-and-stdtry_lock)
    - [`std::lock`](#stdlock)
    - [`std::try_lock`](#stdtry_lock)
    - [Syntax](#syntax-9)
  - [Three Lock Type Tags](#three-lock-type-tags)
  - [`std::call_once` and `std::once_flag`](#stdcall_once-and-stdonce_flag)
    - [Explanation](#explanation-11)
    - [Syntax](#syntax-10)
  - [`std::atomic` and `std::atomic_ref`](#stdatomic-and-stdatomic_ref)
    - [`std::atomic`](#stdatomic)
    - [`std::atomic_ref`](#stdatomic_ref)
    - [Syntax](#syntax-11)
    - [Members and Related Stuffs](#members-and-related-stuffs-6)
      - [Links](#links-7)
      - [Member Types](#member-types-4)
      - [Member Functions](#member-functions-6)
      - [Constants](#constants)
      - [Specialized Member Functions](#specialized-member-functions)
        - [Specialized for Integral, Floating-point (Since C++20) and Pointer Types](#specialized-for-integral-floating-point-since-c20-and-pointer-types)
        - [Specialized for Integral and Pointer Types Only](#specialized-for-integral-and-pointer-types-only)
        - [Specialized for Integral Types Only](#specialized-for-integral-types-only)
      - [Type Aliases (Only for `std::atomic`)](#type-aliases-only-for-stdatomic)
  - [`std::condition_variable` and `std::condition_variable_any`](#stdcondition_variable-and-stdcondition_variable_any)
    - [`std::condition_variable`](#stdcondition_variable)
    - [`std::condition_variable_any`](#stdcondition_variable_any)
    - [Examples](#examples)
    - [Members and Related Stuffs](#members-and-related-stuffs-7)
      - [Links](#links-8)
      - [Nested Types](#nested-types-2)
      - [Member Functions](#member-functions-7)
  - [`std::notify_all_at_thread_exit`](#stdnotify_all_at_thread_exit)
    - [Explanation](#explanation-12)
    - [Syntax](#syntax-12)
  - [`std::async`](#stdasync)
    - [Explanation](#explanation-13)
    - [Syntax](#syntax-13)
    - [Related Stuffs](#related-stuffs)
      - [Links](#links-9)
      - [Parameters](#parameters)
      - [Return Value](#return-value)
      - [Launching Policies](#launching-policies)
    - [Notes](#notes-2)
  - [`std::future` and `std::shared_future`](#stdfuture-and-stdshared_future)
    - [`std::future`](#stdfuture)
    - [`std::shared_future`](#stdshared_future)
    - [Declaration Syntax](#declaration-syntax-2)
    - [Initialization Syntax](#initialization-syntax-2)
    - [Members and Related Stuffs](#members-and-related-stuffs-8)
      - [Links](#links-10)
      - [Member Functions](#member-functions-8)
      - [`std::future_status` (Returned by `wait_for` and `wait_until` Functions)](#stdfuture_status-returned-by-wait_for-and-wait_until-functions)
    - [Differences Between `std::future` and `std::shared_future`](#differences-between-stdfuture-and-stdshared_future)
  - [`std::promise`](#stdpromise)
    - [Explanation](#explanation-14)
    - [Syntax](#syntax-14)
    - [Related Stuffs](#related-stuffs-1)
      - [Links](#links-11)
      - [Member Functions](#member-functions-9)
      - [Non-member Functions](#non-member-functions-3)
      - [Helper Classes](#helper-classes)
  - [Notes](#notes-3)

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
6. A `std::thread` object **cannot be copied** because its copy constructor is deleted.
7. When **some parameters** of `funName` are **lvalue references**, you **must wrap the
   corresponding arguments** in **`std::ref`** (for non-const lvalue references) or **`std::cref`**
   (for `const` lvalue references) **when passing them to `std::thread`**.
8. This is necessary because `std::thread` moves its arguments into the thread function by default,
   which can break lvalue reference bindings.
9. Its header file is `<thread>`.

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
std::thread thread_name1( ... );
// Move constructor.
std::thread thread_name2( std::move( thread_name1 ) );
```

```CPP
std::thread thread_name1( ... );
// Move constructor.
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

##### Notes

1. A thread starts executing when the `std::thread` object is defined, not when the `join` function
   is called.
2. Calling `join` merely blocks the calling thread, waiting for the thread to finish and releasing
   its resources.
3. A detached thread (a thread that has been `detach`ed) will release its resources either when the
   calling thread ends or when it finishes executing itself.
4. However, it cannot safely access resources of the main thread unless those resources have been
   explicitly managed for concurrent access.
5. Threads automatically release resources when their function completes.
6. It is not recommended to forcefully terminate a thread using other methods, as this may cause
   memory leaks due to unreleased resources.
7. A thread that is neither joined nor detached will throw an exception when the program exits.

#### `std::jthread`

##### Explanation

1. `std::jthread` is **a class** that represents **a managed thread of execution** with **automatic
   joining** and **optional cooperative cancellation**.
2. `std::jthread` executes **a sequence of instructions** that can run **concurrently** with other
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
std::jthread thread_name1( ... );
// Move constructor.
std::jthread thread_name2( std::move( thread_name1 ) );
```

```CPP
std::jthread thread_name1( ... );
// Move constructor.
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

### `std::ref` and `std::cref`

#### Explanation

1. `std::ref` is a utility function that **creates a reference wrapper for a given object**.
2. It is used when you need to pass an argument by reference to a function, particularly in
   situations where a function or class expects its argument to be passed by value (like in
   `std::thread` or in certain algorithms that use copy semantics).
3. The key purpose of `std::ref` is to **ensure that arguments are passed as references even when
   the target function is expecting arguments by value**.
4. `std::ref` works **like a reference**, **but** it is **not a true reference**.
5. Therefore, a function whose **parameters** are **expecting a direct reference** **cannot directly
   receive a `std::reference_wrapper`**.
6. **`std::cref`** works similarly to `std::ref`, but it creates **a reference wrapper for constant
   references**.
7. They are usually used with `std::thread` and `std::async`.
8. Their header file is `<functional>`.

#### Syntax

```CPP
// Its usage syntax.
std::ref( var_name );
std::cref( var_name );
```

### Six STD Mutex Classes

#### `std::mutex`

1. A mutex is **a lockable object** that is designed to signal when critical sections of code need
   **exclusive access**, **preventing other threads** with the same protection from **executing
   concurrently and access the same memory locations**.
2. `std::mutex` objects provide **exclusive ownership** and **do not support recursivity** (i.e., a
   thread shall not `lock` a `std::mutex` it already owns) -- see `std::recursive_mutex` for an
   alternative class that does.
3. It is guaranteed to be **a standard-layout class**.
4. Its header file is `<mutex>`.

#### `std::recursive_mutex`

1. `std::recursive_mutex` is **a lockable object**, just like `std::mutex`, but allows the same
   thread to **acquire multiple levels of ownership over the `std::mutex` object** (**recursivity,
   recursive calls**).
2. This allows to `lock` (or `try-lock`) the mutex object from a thread that is already locking it,
   **acquiring a new level of ownership** over the `std::mutex` object: the `std::mutex`object will
   actually remain locked owning the thread until its member unlock is called as many times as this
   level of ownership.
3. It is guaranteed to be **a standard-layout class**.
4. Its header file is `<mutex>`.

#### `std::timed_mutex`

1. A timed mutex is **a time lockable object** that is designed to signal when critical sections of
   code need exclusive access, **just like a regular mutex**, **but additionally supporting timed
   `try-lock` requests**.
2. As such, a `std::timed_mutex` has two additional members: `try_lock_for` and `try_lock_until`.
3. It is guaranteed to be a standard-layout class.
4. Its header file is `<mutex>`.

#### `std::recursive_timed_mutex`

1. A recursive timed mutex **combines both the features of `std::recursive_mutex` and the features
   of `std::timed_mutex` into a single class**: it supports both acquiring multiple `lock` levels by
   a single thread and also timed `try-lock` requests.
2. It is guaranteed to be a standard-layout class.
3. Its header file is `<mutex>`.

#### `std::shared_mutex`

1. The `std::shared_mutex` **template class** is a synchronization primitive that can **be used to
   protect shared data from being simultaneously accessed by multiple threads**.
2. In contrast to other mutex types which facilitate exclusive access, a `std::shared_mutex` **has
   two levels of access**:
   - **shared (read-shared-data-only)**: several threads can share ownership of the same mutex.
   - **exclusive (read-or-modify-shared-date)**: only one thread can own the mutex.
3. If one thread has **acquired the exclusive lock (through `lock`, `try_lock`)**, no other threads
   can acquire the lock (including the shared).
4. If one thread has **acquired the shared lock (through `lock_shared`, `try_lock_shared`)**, no
   other thread can acquire the exclusive lock, but can acquire the shared lock.
5. Only when the exclusive lock has not been acquired by any thread, the shared lock can be acquired
   by multiple threads.
6. Within **one thread, only one lock** (shared or exclusive) can be acquired at the same time.
7. Shared mutexes are especially useful when **shared data** can be **safely read** by **any number
   of threads simultaneously**, **but** **a thread may only write the same data when no other thread
   is reading or writing at the same time**.
8. The `std::shared_mutex` class satisfies all requirements of `SharedMutex` and
   `StandardLayoutType`.
9. Its header file is `<mutex>`.

#### `std::shared_timed_mutex`

1. The `std::shared_timed_mutex` **template class** is **a synchronization primitive** that can be
   **used to protect shared data from being simultaneously accessed by multiple threads**.
2. In contrast to other mutex types which facilitate exclusive access, a `std::shared_timed_mutex`
   **has two levels of access**:
   - **shared (read-shared-data-only)**: several threads can share ownership of the same mutex.
   - **exclusive (read-or-modify-shared-date)**: only one thread can own the mutex.
3. Shared mutexes are usually used in situations when multiple readers can access the same resource
   at the same time without causing data races, but only one writer can do so.
4. In a manner similar to `std::timed_mutex`, `std::shared_timed_mutex` **provides the ability to
   attempt to claim ownership** of a `std::shared_timed_mutex` **with a timeout** via the
   `try_lock_for()`, `try_lock_until()`, `try_lock_shared_for()`, `try_lock_shared_until()` member
   functions.
5. The `std::shared_timed_mutex` class satisfies all requirements of `SharedTimedMutex` and
   `StandardLayoutType`.
6. Its header file is `<mutex>`.

#### Syntax

```CPP
// Its usage syntax.
std::mutex mutex_name;
std::recursive_mutex rmutex_name;
std::timed_mutex tmutex_name;
std::recursive_timed_mutex rtmutex_name;
std::shared_mutex smutex_name;
std::shared_timed_mutex stmutex_name;
```

#### Members and Related Stuffs

##### Links

1. [`<mutex>` in cplusplus](https://cplusplus.com/reference/mutex/).
2. [`<mutex>` in cppreference](https://en.cppreference.com/w/cpp/header/mutex).
3. [`std::mutex` in cplusplus](https://cplusplus.com/reference/mutex/mutex/).
4. [`std::mutex` in cppreference](https://en.cppreference.com/w/cpp/thread/mutex).
5. [`std::recursive_mutex` in cplusplus](https://cplusplus.com/reference/mutex/recursive_mutex/).
6. [`std::recursive_mutex` in cppreference](https://en.cppreference.com/w/cpp/thread/recursive_mutex).
7. [`std::timed_mutex` in cplusplus](https://cplusplus.com/reference/mutex/timed_mutex/).
8. [`std::timed_mutex` in cppreference](https://en.cppreference.com/w/cpp/thread/timed_mutex).
9. [`std::recursive_timed_mutex` in cplusplus](https://cplusplus.com/reference/mutex/recursive_timed_mutex/).
10. [`std::recursive_timed_mutex` in cppreference](https://en.cppreference.com/w/cpp/thread/recursive_timed_mutex).

##### Nested Types

1. `native_handle_type (optional*)`: Implementation-defined.

##### Member Functions

1. (constructor): Constructs the mutex (public member function).
2. (destructor): Destroys the mutex (public member function).
3. `operator=[deleted]`: Not copy-assignabl (public member function).
4. `lock`: Locks the mutex, blocks if the mutex is not available (public member function).
5. `try_lock`: Tries to lock the mutex, returns if the mutex is not available (public member
   function).
6. `try_lock_for` (only for `std::timed_mutex`, `std::recursive_timed_mutex` and
   `std::shared_timed_mutex`): Tries to lock the mutex, returns if the mutex has been unavailable
   for the specified timeout duration (public member function).
7. `try_lock_until` (only for `std::timed_mutex`, `std::recursive_timed_mutex` and
   `std::shared_timed_mutex`): Tries to lock the mutex, returns if the mutex has been unavailable
   until specified time point has been reached (public member function).
8. `unlock`: Unlocks the mutex (public member function).
9. `lock_shared` (only for `std::shared_mutex` and `std::shared_timed_mutex`): Locks the mutex for
   shared ownership, blocks if the mutex is not available (public member function).
10. `try_lock_shared` (only for `std::shared_mutex` and `std::shared_timed_mutex`): Tries to lock
    the mutex for shared ownership, returns if the mutex is not available (public member function).
11. `try_lock_shared_for` (only for `std::shared_timed_mutex`): Tries to lock the mutex for shared
    ownership, returns if the mutex has been unavailable for the specified timeout duration (public
    member function).
12. `try_lock_shared_until` (only for `std::shared_timed_mutex`): Tries to lock the mutex for shared
    ownership, returns if the mutex has been unavailable until specified time point has been reached
    (public member function).
13. `unlock_shared` (only for `std::shared_mutex` and `std::shared_timed_mutex`): Unlocks the mutex
    (shared ownership) (public member function).
14. `native_handle`: Returns the underlying implementation-defined native handle object (public
    member function).

#### **Notes**

1. All lock classes or functions that receive mutex objects implement the locking or unlocking
   behavior by calling the mutex object's lock or unlock member functions.
2. All mutex objects are passed to them by reference.
3. All lock objects do not manage the lifetime of the mutex object in any way: the duration of the
   mutex object shall extend at least until the destruction of the lock object that locks it.
4. **One mutex object** can only lock **one shared resource**.
5. A mutex can be defined in various scopes depending on the accessibility and synchronization needs
   of the shared resource it protects:
   - **Global scope**: Suitable for global resources accessed across multiple functions, providing
     broad accessibility.
   - **Local scope (function/block)**: Useful for synchronizing limited code sections within a
     function or block, especially if declared as `static`.
   - **Class member**: Protects class-specific resources; a `static` mutex in a class provides a
     class-level lock shared among all instances.
   - **Namespace scope**: Limits mutex access to code within a specific namespace, aiding modularity
     by avoiding global namespace pollution.
   - **Anonymous namespace (file/module scope)**: Restricts mutex visibility to a single file,
     making it accessible only within that file, which is useful for file-specific resources.
   - **Smart pointer (`std::shared_ptr` or `std::unique_ptr`)**: Enables dynamic or conditional
     mutex management, allowing shared or exclusive ownership of the mutex among objects.

#### Mutex Locking

1. When a thread wants to **access a shared resource protected by a mutex**, it calls `lock()` on
   the mutex (usually done via `std::lock_guard` or `std::unique_lock`).
2. If **no other thread has locked the mutex**, the thread **successfully acquires the lock** and
   can **access the shared resource**.
3. If **another thread has already locked the mutex**, the requesting thread will **block (wait)
   until the mutex is available**.

#### Mutual Exclusion

1. **Only one thread can own the lock** on the mutex at any given time.
2. **Other threads** attempting to lock the mutex **must wait**, ensuring that only one thread
   accesses the protected resource at a time.

#### Unlocking

1. **Once a thread finishes its operations** on the shared resource, it **unlocks the mutex**,
   **allowing another waiting thread to acquire the lock**.
2. If the thread used a `std::lock_guard` or `std::unique_lock`, the mutex will be automatically
   unlocked when the guard or lock object goes out of scope.

#### Key Points to Consider

1. **Deadlock**: If two or more threads try to lock multiple mutexes in different orders, a deadlock
   may occur, where each thread waits indefinitely for the other to release the mutex. Techniques
   like always locking mutexes in a specific order or using `std::scoped_lock` can prevent this.
2. **Performance**: Locking and unlocking a mutex are relatively inexpensive operations, but if many
   threads frequently compete for the same mutex, contention can slow down the program.
3. **Recursive Locking**: In C++, `std::mutex` does not allow a thread to lock the same mutex
   multiple times without unlocking, as it would lead to a deadlock with itself. To handle recursive
   locking by the same thread, `std::recursive_mutex` is available.

### `std::lock_guard`

#### Explanation

1. `std::lock_guard` is **a template class that manages a mutex object** by **keeping it always
   locked**.
2. **On construction**, the mutex object is **locked** by the calling thread, and **on
   destruction**, the mutex is **unlocked**.
3. It is the simplest lock, and is specially useful as an object with automatic duration that lasts
   until the end of its context.
4. In this way, it guarantees the mutex object is properly unlocked in case an exception is thrown.
5. Its header file is `<mutex>`.

#### Syntax

```CPP
// Its usage syntax.
MutexType mtx;
std::lock_guard< MutexType > lck( mtx );
```

```CPP
// Its usage syntax.
MutexType mtx;
mtx.lock();
std::lock_guard< MutexType > lck( mtx, std::adopt_lock );
```

#### Members and Related Stuffs

##### Links

1. [`std::lock_guard` in cplusplus](https://cplusplus.com/reference/mutex/lock_guard/).
2. [`std::lock_guard` in cppreference](https://en.cppreference.com/w/cpp/thread/lock_guard).

##### Template Parameters

1. `Mutex`: The type of the mutex to lock. The type must meet the `BasicLockable` requirements.

##### Member Types

1. `mutex_type`: `Mutex`.

##### Member Functions

1. (constructor): Constructs a `lock_guard`, optionally locking the given mutex. Not
   copy-constructable (public member function).
2. (destructor): Destructs the `lock_guard` object, unlocks the underlying mutex (public member
   function).
3. `operator=[deleted]`: Not copy-assignable (public member function).

### `std::unique_lock` and `std::shared_lock`

#### `std::unique_lock`

1. `std::unique_lock` is **a template class** that **manages a mutex object with unique ownership**
   in **both states**: **locked and unlocked**.
2. **On construction** (or by move-assigning to it), the object **acquires a mutex object**, for
   whose locking and unlocking operations becomes responsible.
3. This class **guarantees an unlocked status on destruction** (even if not called explicitly).
4. Therefore it is especially useful as an object with automatic duration, as it guarantees the
   mutex object is properly unlocked in case an exception is thrown.
5. Even when working **with a shared mutex**, **`std::unique_lock` essentially behaves like a normal
   lock**, **blocking other threads** from accessing the shared data.
6. This is because **a `std::unique_lock` provides exclusive access** to the resource, preventing
   other threads from acquiring either a shared or exclusive lock until the unique lock is released.
7. Its header file is `<mutex>`.

#### `std::shared_lock`

1. `std::shared_lock` is **a template class** that **manages a mutex object with shared ownership**.
2. **On construction** (or by move-assigning to it), the object **acquires a shared lock** on a
   mutex object, **allowing multiple threads to hold the lock concurrently**.
3. This class **guarantees an unlocked status on destruction**, releasing the shared lock when the
   `std::shared_lock` object goes out of scope.
4. It is especially useful for **shared access to a resource** when **multiple threads need to read
   from it concurrently**, without blocking each other.
5. However, that **`std::shared_lock` provides only shared access** to the resource, meaning
   **exclusive access is not possible** while a shared lock is held.
6. While **acquiring a shared lock** allows other threads to also acquire shared locks, **no thread
   can acquire an exclusive lock** until all shared locks are released.
7. The class does not manage the lifetime of the mutex object.
8. **The `MutexType` used with `std::shared_lock` must be a shared mutex type**.
9. Its header file is `<shared_mutex>`.

#### Syntax

```CPP
// Its usage syntax.
MutexType mtx;
std::unique_lock< MutexType > ulck( mtx );
std::shared_lock< MutexType > slck( mtx );
```

```CPP
// Its usage syntax.
MutexType mtx;
std::unique_lock< MutexType > ulck1( mtx );
std::shared_lock< MutexType > slck1( mtx );
// Move constructor.
std::unique_lock< MutexType > ulck2( std::move( ulck1 ) );
std::shared_lock< MutexType > slck2( std::move( slck1 ) );
```

```CPP
// Its usage syntax.
MutexType mtx;
std::unique_lock< MutexType > ulck( mtx, std::defer_lock );
ulck.lock();
std::shared_lock< MutexType > slck( mtx, std::defer_lock );
slck.lock();
```

```CPP
// Its usage syntax.
MutexType mtx;
mtx.lock();
std::unique_lock< MutexType > ulck( mtx, std::try_to_lock );
if( ulck.owns_lock() ) {
   // Critical section: code that must be executed atomically.
} else {
   // Lock acquisition failed, handle the situation appropriately.
};
std::shared_lock< MutexType > slck( mtx, std::try_to_lock );
if( slck.owns_lock() ) {
   // Critical section: code that must be executed atomically.
} else {
   // Lock acquisition failed, handle the situation appropriately.
};
```

```CPP
// Its usage syntax.
MutexType mtx;
mtx.lock();
std::unique_lock< MutexType > ulck( mtx, std::adopt_lock );
std::shared_lock< MutexType > slck( mtx, std::adopt_lock );
```

```CPP
// Its usage syntax.
MutexType mtx;
std::chrono::duration< Type, std::ratio< num1, num2 >(Optional) > dur;
std::unique_lock< MutexType > ulck( mtx, dur );
std::shared_lock< MutexType > slck( mtx, dur );
```

```CPP
// Its usage syntax.
MutexType mtx;
std::chrono::time_point< Clock > tpoint;
std::unique_lock< MutexType > ulck( mtx, tpoint );
std::shared_lock< MutexType > slck( mtx, tpoint );
```

#### Members and Related Stuffs

##### Links

1. [`std::unique_lock` in cplusplus](https://cplusplus.com/reference/mutex/unique_lock/).
2. [`std::unique_lock` in cppreference](https://en.cppreference.com/w/cpp/thread/unique_lock).
3. [`std::shared_lock` in cplusplus]().
4. [`std::shared_lock` in cppreference](https://en.cppreference.com/w/cpp/thread/shared_lock).

##### Template Parameters

1. `Mutex`: The type of the mutex to lock. The type must meet the `BasicLockable` requirements.

##### Nested Types

1. `mutex_type`: `Mutex`.

##### Member Functions

1. (constructor): Constructs a `std::unique_lock`, optionally locking (i.e., taking ownership of)
   the supplied mutex (public member function).
2. (destructor): Unlocks (i.e., releases ownership of) the associated mutex, if owned (public member
   function).
3. `operator=`: Unlocks (i.e., releases ownership of) the mutex, if owned, and acquires ownership of
   another (public member function).
4. `lock`: Locks (i.e., takes ownership of) the associated mutex (public member function).
5. `try_lock`: Tries to lock (i.e., takes ownership of) the associated mutex without blocking
   (public member function).
6. `try_lock_for`: Attempts to lock (i.e., takes ownership of) the associated TimedLockable mutex,
   returns if the mutex has been unavailable for the specified time duration (public member
   function).
7. `try_lock_until`: Tries to lock (i.e., takes ownership of) the associated TimedLockable mutex,
   returns if the mutex has been unavailable until specified time point has been reached (public
   member function).
8. `unlock`: Unlocks (i.e., releases ownership of) the associated mutex (public member function).
9. `swap`: Swaps state with another `std::unique_lock` (public member function).
10. `release`: Disassociates the associated mutex without unlocking (i.e., releasing ownership of)
    it (public member function).
11. `mutex`: Returns a pointer to the associated mutex (public member function).
12. `owns_lock`: Tests whether the lock owns (i.e., has locked) its associated mutex (public member
    function).
13. `operator bool`: Tests whether the lock owns (i.e., has locked) its associated mutex (public
    member function).

##### Non-member Functions

1. `std::swap( std::unique_lock )` (C++11), `std::swap( std::unique_lock )` (C++11): Specializes the
   `std::swap` algorithm (function template).

### `std::scoped_lock`

#### Explanation

1. **The template class** `std::scoped_lock` is **a mutex wrapper** that provides a convenient
   **RAII-style mechanism for owning zero or more mutexes** for the duration of a scoped block.
2. When a `std::scoped_lock` object is created, it attempts to take ownership of the mutexes it is
   given.
3. When control leaves the scope in which the `std::scoped_lock` object was created, the
   `std::scoped_lock` is destructed and the mutexes are released.
4. If **several mutexes** are **given**, **deadlock avoidance algorithm** is used as if by
   `std::lock`.
5. The `std::scoped_lock` class is **non-copyable**.
6. Its header file is `<mutex>`.

#### Syntax

```CPP
// Its declaration syntax.
template< class... MutexTypes > class scoped_lock;
```

```CPP
// Its declaration syntax.
MutexType1 mtx1;
MutexType2 mtx2;
...;
std::scoped_lock< MutexType1, MutexType2, ... > lck( mtx1, mtx2, ... );
```

```CPP
// Its declaration syntax.
MutexType1 mtx1;
MutexType2 mtx2;
...;
mtx1.lock;
mtx2.lock;
...;
std::scoped_lock< MutexType1, MutexType2, ... > lck( std::adopt_lock, mtx1, mtx2, ... );
```

#### Members and Related Stuffs

##### Links

1. [`std::scoped_lock` in cplusplus]().
2. [`std::scoped_lock` in cppreference](https://en.cppreference.com/w/cpp/thread/unique_lock).

##### Template Parameters

1. `MutexTypes`: The types of the mutexes to lock. The types must meet the Lockable requirements
   unless `sizeof...( MutexTypes ) == 1`, in which case the only type must meet BasicLockable.

##### Member Types

1. `mutex_type` (conditionally present): If `sizeof...( MutexTypes ) == 1`, member type `mutex_type`
   is the same as Mutex, the sole type in `MutexTypes...`. Otherwise, there is no member
   `mutex_type`.

##### Member Functions

1. (constructor): Constructs a `std::scoped_lock`, optionally locking the given mutexes (public
   member function).
2. (destructor): Destructs the `std::scoped_lock` object, unlocks the underlying mutexes (public
   member function).
3. `operator=[deleted]`: Not copy-assignable (public member function).

### `std::lock` and `std::try_lock`

#### `std::lock`

1. `std::lock` **locks all the objects passed as arguments**, blocking the calling thread if
   necessary.
2. The function locks the objects using an unspecified sequence of calls to their members lock,
   `try_lock` and unlock that ensures that all arguments are locked on return (without producing any
   deadlocks).
3. If the function **cannot lock all objects** (such as because one of its internal calls **threw an
   exception**), the function **first unlocks all objects it successfully locked** (if any) before
   failing.
4. **To prevent deadlock, the order of acquiring multiple locks must be consistent**.
5. Its header file is `<mutex>`.

#### `std::try_lock`

1. `std::try_lock` **attempts to lock all the objects passed as arguments using their
   `std::try_lock` member functions (non-blocking)**.
2. The function **calls the `std::try_lock` member function** for each argument (first `lock1`, then
   `lock2`, and eventually the others in `lockn`, in the same order), until either all calls are
   successful, or as soon as one of the calls fails (either by returning false or throwing an
   exception).
3. If the function ends because a call **fails**, unlock is called on all objects for which the call
   to `std::try_lock` was successful, and **the function returns the argument order number of the
   object whose lock failed**.
4. No further calls are performed for the remaining objects in the argument list.
5. If the function locks all mutex objects successfully, it returns `-1`.
6. Its header file is `<mutex>`.

#### Syntax

```CPP
// Its declaration syntax.
template< class Lockable1, class Lockable2, class... LockableN >
void lock( Lockable1& lock1, Lockable2& lock2, LockableN&... lockn );
```

```CPP
// Its declaration syntax.
template< class Lockable1, class Lockable2, class... LockableN >
int try_lock( Lockable1& lock1, Lockable2& lock2, LockableN&... lockn );
```

### Three Lock Type Tags

1. [`<mutex>` in cplusplus](https://cplusplus.com/reference/mutex/).
2. [`<mutex>` in cppreference](https://en.cppreference.com/w/cpp/header/mutex).
3. `std::defer`: A `constexpr defer_lock_t` object. Do not acquire ownership of the mutex. (Does not
   lock automatically; requires manual locking.)
4. `std::try_to_lock`: A `constexpr try_to_lock_t` object. Try to acquire ownership of the mutex
   without blocking.
5. `std::adopt_lock`: A `constexpr adopt_lock_t` object. Assume the calling thread already has
   ownership of the mutex. (The mutex has been locked.)

### `std::call_once` and `std::once_flag`

#### Explanation

1. `std::call_once` **executes** the callable object **`f` exactly once**, **even if** called
   concurrently from **several threads**.
2. `std::once_flag` is **a helper object** to **ensure** that **`std::call_once` invokes the
   function only once**.

#### Syntax

```CPP
// Its declaration syntax.
template< class Callable, class... Args >
void call_once( std::once_flag& flag, Callable&& f, Args&&... args );
```

### `std::atomic` and `std::atomic_ref`

#### `std::atomic`

1. `std::atomic` is **a template class** that **provides** a variety of **atomic operations** that
   guarantee the integrity of **data access across multiple threads**.
2. These operations include **read-modify-write operations** and **compare-and-swap (CAS)
   operations**.
3. These operations are implemented using hardware-level atomic instructions, ensuring that they are
   indivisible and **cannot be interrupted by other threads**.
4. `std::atomic` **allows** you to **specify the memory ordering of operations**, which
   **determines** how operations on **different threads are synchronized**.
5. This is crucial for ensuring correct behavior in complex concurrent programs.
6. Many of the operations provided by `std::atomic` are **lock-free**, meaning they don't require
   explicit locking mechanisms.
7. Besides, some operations are **wait-free**, ensuring that a thread will eventually succeed in its
   operation, even if other threads are also contending.
8. These two features can significantly **improve performance** in **high-concurrency scenarios**.
9. The `std::atomic` class is **non-copyable**.
10. Its header file is `<atomic>`.

#### `std::atomic_ref`

1. `std::atomic_ref` is **a template class** that **provides** atomic operations on **non-atomic
   objects**, allowing them to be accessed safely across multiple threads.
2. It **works** by **wrapping a reference to an existing object** and **providing atomic
   operations** such as **read-modify-write** and **compare-and-swap** (CAS) on the referenced
   object.
3. These operations are **implemented using hardware-level atomic instructions**, ensuring that they
   are indivisible and **cannot be interrupted by other threads**.
4. `std::atomic_ref` **allows** you to **specify the memory ordering of operations**, which
   **determines** how operations on **different threads are synchronized**.
5. This ensures correct behavior in multi-threaded programs, even when dealing with non-atomic
   types.
6. Unlike `std::atomic`, which requires atomic types, `std::atomic_ref` **works** with regular types
   like `int`, `double`, and user-defined types.
7. The class **does not manage the lifetime** of the referenced object, meaning you must ensure that
   the referenced object remains valid for the duration of the atomic operations.
8. The use of `std::atomic_ref` can help **reduce the overhead** of atomic operations on non-atomic
   objects and **improve performance** in multi-threaded scenarios.
9. `std::atomic_ref` is **non-copyable**, ensuring that the reference is consistent across multiple
   threads.
10. Its header file is `<atomic>`.

#### Syntax

```CPP
// Its usage syntax.
std::atomic< Type > avar_name1;
Type obj_name;
avar_name1 = obj_name;
// Allows temporary objects.
std::atomic< Type > avar_name2( obj_name );
```

```CPP
// Its usage syntax.
Type obj_name;
// Constructs an `atomic_ref` object referencing the object `obj_name`.
std::atomic_ref< Type > avar_name1( obj_name );
// Constructs an `atomic_ref` object referencing the object `avar_name1`.
std::atomic_ref< Type > avar_name2( avar_name1 );
```

#### Members and Related Stuffs

##### Links

1. [`<atomic>` in cplusplus](https://cplusplus.com/reference/atomic/).
2. [`<atomic>` in cppreference](https://en.cppreference.com/w/cpp/thread).
3. [`std::atomic` in cplusplus](https://cplusplus.com/reference/atomic/atomic/).
4. [`std::atomic` in cppreference](https://en.cppreference.com/w/cpp/atomic/atomic).

##### Member Types

1. `value_type`: `T` (regardless of whether specialized or not).
2. `difference_type`: `value_type` (only for `atomic< Integral >` and `atomic< Floating >`(since
   C++20) specializations), `std::ptrdiff_t` (only for `std::atomic< U* >` specializations).
3. `difference_type` is not defined in the primary `std::atomic` template or in the partial
   specializations for `std::shared_ptr` and `std::weak_ptr`.

##### Member Functions

1. (constructor): Constructs an atomic object (public member function).
2. `operator=`: Stores a value into an atomic object (public member function).
3. `is_lock_free`: Checks if the atomic object is lock-free (public member function).
4. `store`: Atomically replaces the value of the atomic object with a non-atomic argument (public
   member function).
5. `load`: Atomically obtains the value of the atomic object (public member function).
6. `operator T`: Loads a value from an atomic object (public member function).
7. `exchange`: Atomically replaces the value of the atomic object and obtains the value held
   previously (public member function).
8. `compare_exchange_weak`, `compare_exchange_strong`: Atomically compares the value of the atomic
   object with non-atomic argument and performs atomic exchange if equal or atomic load if not
   (public member function).
9. `wait` (C++20): Blocks the thread until notified and the atomic value changes (public member
   function).
10. `notify_one` (C++20): Notifies at least one thread waiting on the atomic object (public member
    function).
11. `notify_all` (C++20): Notifies all threads blocked waiting on the atomic object (public member
    function).

##### Constants

1. `is_always_lock_free` [`static`] (C++17): Indicates that the type is always lock-free (public
   static member constant).
2. `required_alignment` [`static`] (only for
   `std::atomic_ref): Indicates the required alignment of an object to be referenced by `atomic_ref`
   (public static member constant).

##### Specialized Member Functions

###### Specialized for Integral, Floating-point (Since C++20) and Pointer Types

1. `fetch_add`: Atomically adds the argument to the value stored in the atomic object and obtains
   the value held previously (public member function).
2. `fetch_sub`: Atomically subtracts the argument from the value stored in the atomic object and
   obtains the value held previously (public member function).
3. `operator+=/-=`: Adds to or subtracts from the atomic value (public member function).

###### Specialized for Integral and Pointer Types Only

1. `fetch_max` (C++26): Atomically performs `std::max` between the argument and the value of the
   atomic object and obtains the value held previously (public member function).
2. `fetch_min` (C++26): Atomically performs `std::min` between the argument and the value of the
   atomic object and obtains the value held previously (public member function).
3. `operator++/++(int)/--/--(int)`: Increments or decrements the atomic value by one (public member
   function).

###### Specialized for Integral Types Only

1. `fetch_and`: Atomically performs bitwise AND between the argument and the value of the atomic
   object and obtains the value held previously (public member function).
2. `fetch_or`: Atomically performs bitwise OR between the argument and the value of the atomic
   object and obtains the value held previously (public member function).
3. `fetch_xor`: Atomically performs bitwise XOR between the argument and the value of the atomic
   object and obtains the value held previously (public member function).
4. `operator&=/|=/^=`: Performs bitwise AND, OR, XOR with the atomic value (public member function).

##### Type Aliases (Only for `std::atomic`)

1. [`std::atomic` in cplusplus](https://cplusplus.com/reference/atomic/atomic/).
2. [`std::atomic` in cppreference](https://en.cppreference.com/w/cpp/atomic/atomic).

### `std::condition_variable` and `std::condition_variable_any`

#### `std::condition_variable`

1. A condition variable is **a class object** able to **block the calling thread until notified to
   resume**.
2. It **uses a `std::unique_lock`** (over a mutex) to **lock the thread** when one of its **wait
   functions** is called.
3. The thread **remains blocked until woken up by another thread** that calls **a notification
   function** **on the same `std::condition_variable` object**.
4. Objects of type `std::condition_variable` always use `std::unique_lock< std::mutex >` to `wait`:
   for an alternative that works with any kind of lockable type, see `std::condition_variable_any`.
5. Its header file is `<condition_variable>`.

#### `std::condition_variable_any`

1. It's **the same as `std::condition_variable`**, except that **its wait functions can take any
   lockable type** as argument (`std::condition_variable` objects can only take
   `std::unique_lock< std::mutex >`).
2. Other than that, they are identical.
3. However, `std::condition_variable_any` is slower than `std::condition_variable`.
4. Its header file is `<condition_variable>`.

#### Examples

```CPP
// condition_variable example
#include <iostream>             // std::cout
#include <thread>               // std::thread
#include <mutex>                // std::mutex, std::unique_lock
#include <condition_variable>   // std::condition_variable

std::mutex mtx;
std::condition_variable cv;
bool ready = false;

void print_id( int id ) {
   std::unique_lock< std::mutex > lck( mtx );
   while( !ready )
      cv.wait( lck );
   // ...;
   std::cout << "thread " << id << '\n';
};

void go() {
   std::unique_lock< std::mutex > lck( mtx );
   ready = true;
   cv.notify_all();
};

int main() {
   std::thread threads[10];
   // spawn 10 threads:
   for( int i = 0; i < 10; ++i )
      threads[i] = std::thread( print_id, i );

   std::cout << "10 threads ready to race...\n";
   go();   // go!

   for( auto& th: threads )
      th.join();

   return 0;
};
```

#### Members and Related Stuffs

##### Links

1. [`<condition_variable>` in cplusplus](https://cplusplus.com/reference/condition_variable/).
2. [`<condition_variable>` in cppreference](https://en.cppreference.com/w/cpp/thread#Condition_variables).
3. [`std::condition_variable` in cplusplus](https://cplusplus.com/reference/condition_variable/condition_variable/).
4. [`std::condition_variable` in cppreference](https://en.cppreference.com/w/cpp/thread/condition_variable).
5. [`std::condition_variable_any` in cplusplus](https://cplusplus.com/reference/condition_variable/condition_variable_any/).
6. [`std::condition_variable_any` in cppreference](https://en.cppreference.com/w/cpp/thread/condition_variable_any).

##### Nested Types

1. `native_handle_type`: Implementation-defined.

##### Member Functions

1. (constructor): Constructs the object (public member function).
2. (destructor): Destructs the object (public member function).
3. `operator=[deleted]`: Not copy-assignable (public member function).
4. `notify_one`: Notifies one waiting thread (public member function).
5. `notify_all`: Notifies all waiting threads (public member function).
6. `wait`: Blocks the current thread until the condition variable is awakened (public member
   function).
7. `wait_for`: Blocks the current thread until the condition variable is awakened or after the
   specified timeout duration (public member function).
8. `wait_until`: Blocks the current thread until the condition variable is awakened or until
   specified time point has been reached (public member function).
9. `native_handle`: Returns the native handle (public member function).

### `std::notify_all_at_thread_exit`

#### Explanation

1. When the calling **thread exits**, **all threads waiting on `cond`** are **notified to resume**
   execution.
2. The function also **acquires ownership of the lock on the mutex object** managed by `lck`, which
   is **stored internally** by the function and **unlocked at thread exit** (just **before notifying
   all threads**), behaving as if the following was called once all objects with thread storage
   duration have been destroyed:
   - `lck.unlock()`;
   - `cond.notify_all()`;

#### Syntax

```CPP
// Its declaration syntax.
void notify_all_at_thread_exit( std::condition_variable& cond,
                                std::unique_lock< std::mutex > lk );
```

### `std::async`

#### Explanation

1. `std::async` is **a template function** that **calls `F` (with `Args` as arguments)** at some
   point, **returning without waiting for the execution of `F` to complete**.
2. The **value returned** by `F` can be **accessed through the `future` object** returned (by
   **calling its member `future::get`**).
3. **The second version** (2) lets the caller **select a specific launching policy**, while **the
   first version** (1) uses **automatic selection**, as if calling (2) with
   `launch::async | launch::deferred` as policy.
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
3. **Automatic** (`launch::async | launch::deferred`):
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

### `std::future` and `std::shared_future`

#### `std::future`

1. `std::future` is **a template class** used to **represent the result of an asynchronous
   operation**.
2. It provides a mechanism to access the result of a function that runs concurrently, typically on a
   separate thread.
3. This allows **a thread** to **retrieve results at some point** in the future, **once the
   asynchronous task has completed**.
4. `std::future` is generally used in **combination with `std::async`, `std::promise`, or
   thread-based libraries**.
5. It **acts as a placeholder** for the result that will eventually become available.
6. A `std::future` object **cannot be copied**, but it can be moved.
7. Its header file is `<future>`.

#### `std::shared_future`

1. **The class template** `std::shared_future` provides a mechanism to **access the result of
   asynchronous operations**, similar to `std::future`, except that **multiple threads are allowed
   to wait for the same shared state**.
2. Unlike `std::future`, which is only moveable (so only one instance can refer to any particular
   asynchronous result), `std::shared_future` is **copyable** and **multiple shared future objects**
   may **refer to the same shared state**.
3. **Access to the same shared state from multiple threads** is safe if each thread does it through
   its own copy of a `shared_future` object.
4. Its header file is `<future>`.

#### Declaration Syntax

```CPP
std::future< Type > fut_name;
```

```CPP
std::shared_future< Type > sfut_name;
```

#### Initialization Syntax

```CPP
// Default constructor.
std::future< Type > fut_name1;
// Move constructor.
std::future< Type > fut_name1 = std::move( fut_name1 );
```

```CPP
// Default constructor.
std::shared_future< Type > sfut_name1;
// Copy constructor.
std::shared_future< Type > sfut_name2 = sfut_name1;
```

```CPP
// Default constructor.
std::shared_future< Type > sfut_name1;
// Move constructor.
std::shared_future< Type > sfut_name2 = std::move( sfut_name1 );
```

```CPP
std::future< Type > fut_name;
// Move constructor.
std::shared_future< Type > sfut_name = std::move( fut_name );
```

#### Members and Related Stuffs

##### Links

1. [`std::future` in cplusplus](https://cplusplus.com/reference/future/future/).
2. [`std::future` in cppreference](https://en.cppreference.com/w/cpp/thread/future).
3. [`std::shared_future` in cplusplus](https://cplusplus.com/reference/future/shared_future/).
4. [`std::shared_future` in cppreference](https://en.cppreference.com/w/cpp/thread/shared_future).

##### Member Functions

1. (constructor): Constructs the future object ( Only default and move ) (public member function).
2. (destructor): Destructs the future object (public member function).
3. `operator=`: Moves the future object ( Only Move ) (public member function).
4. `share` (only for `std::future`): Transfers the shared state from `*this` to a `shared_future`
   and returns it (public. member function)
5. `get`: Returns **the result** if the result is **available**. **Otherwise**, **blocks the calling
   thread**. And **only** allows to **call once**.(public member function).
6. `valid`: Checks if the future has a shared state (public member function).
7. `wait`: Waits for the result to become available (public member function).
8. `wait_for`: Waits for the result, returns if it is not available for the specified timeout
   duration (public member function).
9. `wait_until`: Waits for the result, returns if it is not available until specified time point has
   been reached (public member function).

##### `std::future_status` (Returned by `wait_for` and `wait_until` Functions)

1. `std::future_status::deferred`: The shared state contains a deferred function, so the result will
   be computed only when explicitly requested.
2. `std::future_status::ready`: The shared state is ready.
3. `std::future_status::timeout`: The shared state did not become ready before specified timeout
   duration has passed.

#### Differences Between `std::future` and `std::shared_future`

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

### `std::promise`

#### Explanation

1. A promise is **an template class object** that can **store a value of type `R` to be retrieved by
   a `std::future` object** (possibly in another thread), **offering a synchronization point**.
2. **On construction**, promise objects are **associated to a new shared state** on which they can
   **store either a value of type `R` or an exception** derived from `std::exception`.
3. This shared state can be **associated to a `std::future` object** by calling member `get_future`.
4. After the call, **both objects share the same shared state**:
   - **The promise object** is **the asynchronous provider** and is expected to **set a value for
     the shared state** at some point.
   - **The `std::future` object** is **an asynchronous return object** that can **retrieve the value
     of the shared state**, waiting for it to be ready, if necessary.
5. The lifetime of the shared state lasts at least until the last object with which it is associated
   releases it or is destroyed.
6. Therefore, it can survive the promise object that obtained it in the first place if associated
   also to a future.
7. Its header file is `<future>`.

#### Syntax

```CPP
std::promise< Type > pro_name;
// Get the `std::future` associated with the promise.
std::future< Type > fut_name = pro_name.get_future();
// Convert it to a shared future.
// Method that `std::shared_future` works with `std::promise`.
std::shared_future< Type > sfut_name = fut_name.share();
```

```CPP
std::promise< Type > pro_name;
// Convert it to a shared future.
// Method that `std::shared_future` works with `std::promise`.
std::shared_future< Type > sfut_name = fut_name.share();
```

#### Related Stuffs

##### Links

1. [`std::promise` in cplusplus](https://cplusplus.com/reference/future/promise/).
2. [`std::promise` in cppreference](https://en.cppreference.com/w/cpp/thread/promise).

##### Member Functions

1. (constructor): Constructs the promise object (public member function).
2. (destructor): Destructs the promise object (public member function).
3. `operator=`: Assigns the shared state (public member function).
4. `swap`: Swaps two promise objects (public member function).
5. `get_future`: Returns a future associated with the promised result (public member function).
6. `set_value`: Sets the result to specific value (public member function).
7. `set_value_at_thread_exit`: Sets the result to specific value while delivering the notification
   only at thread exit (public member function).
8. `set_exception`: Sets the result to indicate an exception (public member function).
9. `set_exception_at_thread_exit`: Sets the result to indicate an exception while delivering the
   notification only at thread exit (public member function).

##### Non-member Functions

1. `std::swap( std::promise )`: Specializes the `std::swap` algorithm (function template).

##### Helper Classes

1. `std::uses_allocator< std::promise >`: specializes the `std::uses_allocator` type trait (class
   template specialization).

### Notes

1. A game typically loads different objects asynchronously and in parallel using multiple threads.
   This is why, at times, players can control their characters while some objects remain
   unresponsive.
2. **To the best of my knowledge, all classes related to threads lack a copy constructor, except for
   some classes with a `shared` prefix or suffix.**
3. To prevent deadlock, the order of acquiring multiple locks must be consistent.

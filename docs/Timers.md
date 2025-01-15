<!-- vim-markdown-toc GFM -->

- [`std::chrono` Namespace](#stdchrono-namespace)
  - [Explanation](#explanation)
  - [Links](#links)
  - [Durations](#durations)
    - [Explanation](#explanation-1)
    - [Syntax](#syntax)
    - [Realted Stuffs](#realted-stuffs)
      - [Links](#links-1)
      - [Template Instantiations](#template-instantiations)
      - [Member Types](#member-types)
      - [Member Functions](#member-functions)
      - [Non-member Functions](#non-member-functions)
      - [Helper Classes](#helper-classes)
      - [Helper Specializations](#helper-specializations)
      - [Literals](#literals)
  - [Time Points](#time-points)
    - [Explanation](#explanation-2)
    - [Syntax](#syntax-1)
    - [Realted Stuffs](#realted-stuffs-1)
      - [Links](#links-2)
      - [Template Parameters](#template-parameters)
      - [Member Types](#member-types-1)
      - [Member Functions](#member-functions-1)
      - [Non-member Functions](#non-member-functions-1)
      - [Helper Classes](#helper-classes-1)
  - [Clocks](#clocks)
    - [Explanation](#explanation-3)
    - [Syntax](#syntax-2)
    - [Related Stuffs of Three Clock Classes](#related-stuffs-of-three-clock-classes)
      - [Links](#links-3)
      - [Member Types of Three Clock Classes](#member-types-of-three-clock-classes)
      - [Member Constants of Three Clock Classes](#member-constants-of-three-clock-classes)
      - [Member Functions of Three Clock Classes](#member-functions-of-three-clock-classes)
      - [Member Functions of `std::chrono::system_clock`](#member-functions-of-stdchronosystem_clock)
  - [Common Usage Syntax](#common-usage-syntax)
  - [Notes](#notes)

<!-- vim-markdown-toc -->

## `std::chrono` Namespace

### Explanation

1. `chrono` is **the name of a header**, but **also of a sub-namespace**: **All the elements in this
   header** (except for the `common_type` specializations) are not defined directly under the `std`
   namespace (like most of the standard library) but **under the `std::chrono` namespace**.
2. The elements in this header deal with time. This is done mainly by means of **three concepts**:
   **durations, time points and clocks**.

### Links

1. [`std::chrono` in cplusplus](https://cplusplus.com/reference/chrono/).
2. [`std::chrono` in cppreference](https://en.cppreference.com/w/cpp/chrono).

### Durations

#### Explanation

1. Durations are **template classes** that **measure time spans** by means of a count and a period.,
   like: one minute, two hours, or ten milliseconds.
2. For the `std::chrono::duration` class, **only `std::ratio< num1, num2 >` can be used**.
3. The **corresponding named** types of `std::ratio< num1, num2 >` (e.g., `std::chrono::seconds`)
   **cannot be used directly** in `std::chrono::duration`; instead, `use std::ratio< num1, num2 >`
   (e.g., `std::ratio< 1, 1 >`).
4. However, `std::chrono::time_point`, `std::chrono::time_point_cast`, and
   `std::chrono::duration_cast` support these named types.
5. In some C++ STL types, `std::ratio< num1, num2 >` **has alias names**, such as `std::milli`.

#### Syntax

```CPP
// Declaration syntax.
template< class Rep, class Period = ratio< 1 > > class duration;
```

```CPP
// Usage syntax.
// Default constructor.
std::chrono::duration< Type, std::ratio< num1, num2 >(Optional) > dur1;
// Copy constructor.
std::chrono::duration< Type, std::ratio< num1, num2 >(Optional) > dur2( dur1 );
```

```CPP
// Usage syntax.
// Default constructor.
std::chrono::duration< Type1, std::ratio< num1, num2 >(Optional) > dur1;
// Conversion constructor.
std::chrono::duration< Type2, std::ratio< num3, num4 > > dur2( dur1 );
```

#### Realted Stuffs

##### Links

1. [`std::chrono::duration` in cplusplus](https://cplusplus.com/reference/chrono/duration/).
2. [`std::chrono::duration` in cppreference](https://en.cppreference.com/w/cpp/chrono/duration).

##### Template Instantiations

1. **All of these are alias names are predefined `std::chrono::duration` specializations**.
2. `std::chrono::hours`: Signed integral type of at least 23 bits, period `std::ratio< 3600, 1 >`.
3. `std::chrono::minutes`: Signed integral type of at least 29 bits, period `std::ratio< 60, 1 >`.
4. `std::chrono::seconds` (Default period): Signed integral type of at least 35 bits, period
   `std::ratio< 1, 1 >`.
5. `std::chrono::milliseconds`: Signed integral type of at least 45 bits, period
   `std::ratio< 1, 1000 >`.
6. `std::chrono::microseconds`: Signed integral type of at least 55 bits, period
   `std::ratio< 1, 1000000 >`.
7. `std::chrono::nanoseconds`: Signed integral type of at least 64 bits, period
   `std::ratio< 1, 1000000000 >`.

##### Member Types

1. `rep`: `Rep`, an arithmetic type, or a class emulating an arithmetic type, representing the
   number of ticks.
2. `period`: `Period` (until C++17) `typename Period::type(since C++17)`, a `std::ratio`
   representing the tick period (i.e. the number of second's fractions per tick).

##### Member Functions

1. `(constructor)`: Constructs new duration (public member function).
2. `(destructor)`: Destroy duration (public member function).
3. `count`: Returns the count of ticks (public member function).
4. `zero` [`static`]: Returns the special duration value zero (public static member function).
5. `min` [`static`]: Returns the special duration value min (public static member function).
6. `max` [`static`]: Returns the special duration value max (public static member function).

##### Non-member Functions

1. `operators`: Duration operators (function template).
2. `duration_cast`: Converts a duration to another, with a different tick interval (function
   template).
3. `floor( std::chrono::duration )` (C++17): Converts a duration to another, rounding down (function
   template).
4. `ceil( std::chrono::duration )` (C++17): Converts a duration to another, rounding up (function
   template).
5. `round( std::chrono::duration )` (C++17): Converts a duration to another, rounding to nearest,
   ties to even (function template).
6. `abs( std::chrono::duration )` (C++17): Obtains the absolute value of the duration (function
   template).
7. `from_stream` (C++20): Parses a duration from a stream according to the provided format (function
   template).

##### Helper Classes

1. `std::common_type< std::chrono::duration >`: Specializes the `std::common_type` trait (class
   template specialization).
2. `treat_as_floating_point`: Indicates that a duration is convertible to duration with different
   tick period (class template).
3. `duration_values`: Constructs zero, min, and max values of a tick count of given type (class
   template).
4. `std::formatter< std::chrono::duration >` (C++20): Formatting support for duration (class
   template specialization).
5. `std::hash< std::chrono::duration >` (C++26): Hash support for `std::chrono::duration` (class
   template specialization).

##### Helper Specializations

1. `template< class Rep, class Period > constexpr bool enable_nonlocking_formatter_optimization< chrono::duration< Rep, Period > > = enable_nonlocking_formatter_optimization< Rep >;`
   (since C++23): This specialization of `std::enable_nonlocking_formatter_optimization` enables
   efficient implementation of `std::print` and `std::println` for printing a
   `std::chrono::duration` object when the template parameter Rep enables it.

##### Literals

1. Defined in inline namespace `std::literals::chrono_literals`.
2. `operator""h` (C++14): A `std::chrono::duration` literal representing hours (function).
3. `operator""min` (C++14): A `std::chrono::duration` literal representing minutes (function).
4. `operator""s` (C++14): A `std::chrono::duration` literal representing seconds (function).
5. `operator""ms` (C++14): A `std::chrono::duration` literal representing milliseconds (function).
6. `operator""us` (C++14): A `std::chrono::duration` literal representing microseconds (function).
7. `operator""ns` (C++14): A `std::chrono::duration` literal representing nanoseconds (function).
8. Note: the literal suffixes `d` and `y` do not refer to days and years but to day and year,
   respectively. (since C++20).

### Time Points

#### Explanation

1. Time points are **template classes** that **express a point in time** relative to a clock's
   epoch.
2. Internally, their instance objects store an object of a `std::chrono::duration` type, and uses
   the `Clock` type as a reference for its epoch.

#### Syntax

```CPP
// Declaration syntax.
template< class Clock, class Duration = typename Clock::duration >
class time_point;
```

```CPP
// Usage syntax.
// Default constructor.
std::chrono::time_point< Clock > start, end;
```

```CPP
// Usage syntax.
auto start = Clock::now();
auto start = Clock::now();
// `Clock::now()`: The `now()` function defined inside the `Clock` class.
```

#### Realted Stuffs

##### Links

1. [`std::chrono::time_point` in cplusplus](https://cplusplus.com/reference/chrono/time_point/).
2. [`std::chrono::time_point` in cppreference](https://en.cppreference.com/w/cpp/chrono/time_point).

##### Template Parameters

1. `Clock`: A clock class, such as `std::chrono::system_clock`, `std::chrono::steady_clock`,
   `std::chrono::high_resolution_clock` or a custom `clock` class.
2. `Duration`: A `std::chrono::duration` type. Programmers do **not need to specify it manually**.
   It is **automatically set to a `std::chrono::duration` type corresponding to the `Clock`**.
3. `Clock::duration`: The `std::chrono::duration` type defined inside the `Clock` class. Each
   `Clock` class has **its own default `std::chrono::duration` type**.

##### Member Types

1. `clock`: `Clock`, the clock on which this time point is measured.
2. `duration`: `Duration`, a `std::chrono::duration` type used to measure the time since epoch.
3. `rep`: `Rep`, an arithmetic type representing the number of ticks of the duration.
4. `period`: `Period`, a `std::ratio` type representing the tick period of the duration.

##### Member Functions

1. (constructor): Constructs a new time point (public member function).
2. `time_since_epoch`: Returns the time point as duration since the start of its clock (public
   member function).
3. `operators`: Operators for `std::chrono::time_point` (function template).
4. `time_since_epoch`: Time since epoch (public member function).
5. `min` [`static`]: Returns the time point corresponding to the smallest duration (public static
   member function).
6. `max` [`static`]: Returns the time point corresponding to the largest duration (public static
   member function).

##### Non-member Functions

1. `operators`: Operators for `std::chrono::time_point` (function template).
2. `time_point_cast`: Converts a time point to another time point on the same clock, with a
   different duration (function template).
3. `floor( std::chrono::time_point )` (C++17): Converts a `std::chrono::time_point` to another,
   rounding down (function template).
4. `ceil( std::chrono::time_point )` (C++17): Converts a `std::chrono::time_point` to another,
   rounding up (function template).
5. `round( std::chrono::time_point )` (C++17): Converts a `std::chrono::time_point` to another,
   rounding to nearest, ties to even (function template).
6. `clock_cast` (C++20): Convert time points of one clock to another (function template).

##### Helper Classes

1. `std::common_type< std::chrono::time_point >`: Specializes the `std::common_type` trait (class
   template specialization).
2. `std::hash< std::chrono::time_point >` (C++26): Hash support for `std::chrono::time_point` (class
   template specialization).

### Clocks

#### Explanation

1. Clocks are **a framework** that **relates a time point** to real physical time.
2. The library provides at least **three clocks** that **provide means to express the current time**
   **as a `std::chrono::time_point`**: `std::chrono::system_clock`, `std::chrono::steady_clock` and
   `std::chrono::high_resolution_clock`. All of them are **classes**.
3. Usage:
   - `std::chrono::system_clock`: Timestamps, timers.
   - `std::chrono::steady_clock`: Performance measurement, timeouts and delays.
   - `std::chrono::high_resolution_clock`: High-precision timing, profiling.

#### Syntax

```CPP
// Usage syntax.
// Default constructor.
std::chrono::time_point< Clock > start, end;
```

```CPP
// Usage syntax.
auto start = Clock::now();
auto start = Clock::now();
// `Clock::now()`: The `now()` function defined inside the `Clock` class.
```

#### Related Stuffs of Three Clock Classes

##### Links

1. [`std::chrono::system_clock` in cplusplus](https://cplusplus.com/reference/chrono/system_clock/).
2. [`std::chrono::system_clock` in cppreference](https://en.cppreference.com/w/cpp/chrono/system_clock).
3. [`std::chrono::stead_clock` in cplusplus](https://cplusplus.com/reference/chrono/steady_clock/).
4. [`std::chrono::stead_clock` in cppreference](https://en.cppreference.com/w/cpp/chrono/steady_clock).
5. [`std::chrono::high_resolution_clock` in cplusplus](https://cplusplus.com/reference/chrono/high_resolution_clock/).
6. [`std::chrono::high_resolution_clock` in cppreference](https://en.cppreference.com/w/cpp/chrono/high_resolution_clock).

##### Member Types of Three Clock Classes

1. `rep`: An arithmetic type representing the number of ticks in the clock's duration. **For system
   clocks**, it's a **signed** arithmetic type.
2. `period`: A `std::ratio` type representing the tick period of the clock, **in seconds**.
3. `duration`: `std::chrono::duration< rep, period >`. **For system clocks**, capable of
   representing negative durations.
4. `time_point`: `std::chrono::time_point< Clock >`.

##### Member Constants of Three Clock Classes

1. `constexpr bool is_steady` [`static`]: True if the time between ticks is always constant, i.e.
   calls to `now()` return values that increase monotonically even in case of some external clock
   adjustment, otherwise false. However, **for steady clock flag, always true** (public static
   member constant).

##### Member Functions of Three Clock Classes

1. `now` [`static`]: Returns a `std::chrono::time_point` representing the current point in time.
   (public static member function).

##### Member Functions of `std::chrono::system_clock`

2. `to_time_t` [`static`]: Converts a system clock time point to `std::time_t` (public static member
   function).
3. `from_time_t` [`static`]: Converts `std::time_t` to a system clock time point (public static
   member function).

### Common Usage Syntax

```CPP
// Measure performance.
std::chrono::time_point< Clock > start, end;
start = Clock::now();
// Do something.
end = Clock::now();
std::chrono::duration< float, std::ratio< num1, num2 > > dur
   = std::chrono::duration_cast< CorrespondingTemplateInstantiation > ( end - start );
std::cout << "Elapsed time: " << dur.count() << " time unit.\n";
```

```CPP
// Measure performance.
auto start = Clock::now();
// Do something.
auto end = Clock::now();
auto dur = std::chrono::duration_cast< CorrespondingTemplateInstantiation > ( end - start );
std::cout << "Elapsed time: " << dur.count() << " time unit.\n";
```

```CPP
// Timestamps.
auto now = std::chrono::system_clock::now();
std::time_t now_time_t = std::chrono::system_clock::to_time_t( now );
std::cout << "Current time: " << std::ctime( &now_time_t );
```

### Notes

1. Utilize a constructor, a destructor, and the object's lifetime to **implement a timer object**.
2. In Linux, the precision of all clocks is `std::chrono::nanoseconds`.

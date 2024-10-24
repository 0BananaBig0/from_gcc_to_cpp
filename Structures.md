<!-- vim-markdown-toc GFM -->

- [Structures ( `struct` )](#structures--struct-)
  - [Explanation](#explanation)
  - [Differences Between Structures and Classes](#differences-between-structures-and-classes)
  - [Notes](#notes)

<!-- vim-markdown-toc -->

## Structures ( `struct` )

### Explanation

1. Structures are **user-defined data types** that **group variables** of different types into a
   single unit.
2. They are particularly useful when managing related data.
3. While structures originated from the C language, **C++ enhances them** by **allowing member
   functions, constructors, and even inheritance**.
4. The `struct` keyword is used to define a structure.

### Differences Between Structures and Classes

1. Default access level: public(structure), private(class).
2. Usage preference: For simple data models(structure), For complex abstractions(class).
3. Inheritance: public by default(structure), Private by default(class).
4. Encapsulation: Less restrictive by design(structure), Promotes encapsulation(class).

### Notes

1. Except for the four differences mentioned above, the functions provided by structures are the
   same as those in classes.
2. **When using structures, you should treat them like in C code, not as classes**.

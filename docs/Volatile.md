<!-- vim-markdown-toc GFM -->

- [`volatile`](#volatile)
  - [Explanation](#explanation)
  - [Syntax](#syntax)
  - [Usage](#usage)
  - [Limitations](#limitations)

<!-- vim-markdown-toc -->

## `volatile`

### Explanation

1. The `volatile` keyword tells the compiler that **a variable's value may
   change unexpectedly**, **outside the program's control** (e.g., hardware,
   interrupts, etc.).
2. It **prevents the compiler from optimizing** reads and writes to the
   variable, ensuring that every read/write of a variable occurs exactly as
   written in the code.
3. It is used when variables **might be modified by hardware, interrupts, or
   external threads**.

### Syntax

```CPP
volatile Type var_name;
volatile Type* var_ptr;
```

### Usage

1. Embedded systems:
   - Hardware registers, memory-mapped I/O, and flags.
2. Interrupt service routines (ISRs):
   - Variables modified by ISRs to ensure the main program does not cache them.
3. Multi-threading (discouraged):
   - Shared variables accessed by multiple threads (use `std::atomic` instead
     for thread synchronization).

### Limitations

1. No atomicity:
   - Does not guarantee atomic access or synchronization between threads.
2. No memory ordering:
   - `volatile` does not enforce memory ordering or prevent reordering of
     instructions.
3. Not a synchronization mechanism:
   - `volatile` should not be used for thread synchronization.
   - Use `std::atomic` or other synchronization techniques instead.
4. Does not ensure thread safety:
   - Used for hardware interaction or volatile memory locations, not for
     controlling access to shared variables between threads.

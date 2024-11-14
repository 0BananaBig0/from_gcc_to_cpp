<!-- vim-markdown-toc GFM -->

- [Memory Partitions](#memory-partitions)
  - [**Stack**](#stack)
    - [Purpose](#purpose)
    - [Allocation/Deallocation](#allocationdeallocation)
    - [Lifetime](#lifetime)
    - [Scope](#scope)
    - [Size](#size)
    - [Structure](#structure)
    - [Performance](#performance)
    - [Other Characteristics](#other-characteristics)
  - [**Heap (Dynamic Memory)**](#heap-dynamic-memory)
    - [Purpose](#purpose-1)
    - [Allocation/Deallocation](#allocationdeallocation-1)
    - [Lifetime](#lifetime-1)
    - [Scope](#scope-1)
    - [Size](#size-1)
    - [Structure](#structure-1)
    - [Performance](#performance-1)
    - [Other Characteristics](#other-characteristics-1)
  - [Data Segment (Global/Static Memory)](#data-segment-globalstatic-memory)
    - [Purpose](#purpose-2)
    - [Allocation/Deallocation](#allocationdeallocation-2)
    - [Lifetime](#lifetime-2)
    - [Scope](#scope-2)
    - [Size](#size-2)
    - [Structure](#structure-2)
    - [Performance](#performance-2)
    - [Other Characteristics](#other-characteristics-2)
  - [Code Segment (Text Segment)](#code-segment-text-segment)
    - [Purpose](#purpose-3)
    - [Allocation/Deallocation](#allocationdeallocation-3)
    - [Lifetime](#lifetime-3)
    - [Scope](#scope-3)
    - [Size](#size-3)
    - [Structure](#structure-3)
    - [Performance](#performance-3)
    - [Other Characteristics](#other-characteristics-3)
  - [Memory Mapping Segment](#memory-mapping-segment)
    - [Purpose](#purpose-4)
    - [Allocation/Deallocation](#allocationdeallocation-4)
    - [Lifetime](#lifetime-4)
    - [Scope](#scope-4)
    - [Size](#size-4)
    - [Structure](#structure-4)
    - [Performance](#performance-4)
    - [Other Characteristics](#other-characteristics-4)
  - [Memory Partitioning in C++ Program Execution](#memory-partitioning-in-c-program-execution)
  - [Notes](#notes)

<!-- vim-markdown-toc -->

## Memory Partitions

### **Stack**

#### Purpose

1. Stores **local variables** and **function call information** (such as return addresses and
   parameters).
2. Data is **lost** when it goes **out of scope**.

#### Allocation/Deallocation

1. **Automatically handled** by the compiler.
2. Memory for local variables is **allocated when a function is called** and **deallocated when the
   function exits**.
3. Allocating memory requires **only one CPU instruction**.

#### Lifetime

1. Local variables exist only for **the duration of the function call**.

#### Scope

1. Limited to **the function** where **the variables** are **declared**.

#### Size

1. **Predefined to a default value** (typically between **1 MB and 10 MB**, determined by the OS),
   but the stack **can grow** as the application progresses. (Grows downward in memory).
2. However, **the stack's growth** is usually **limited by system settings**.
3. If the stack grows too large, a **stack overflow** occurs.
4. The stack is **prone to overflow** due to **deep recursion** or **large allocations** of local
   variables.
5. On Linux systems, **the stack size limit** for **a process** **can be adjusted**, either
   temporarily or permanently, **using the `ulimit` command**, providing flexibility in managing
   memory resources during runtime.

#### Structure

1. Follows a **LIFO (Last In, First Out)** structure.
2. Memory is deallocated in reverse order of allocation.
3. Stores data like a physical stack, pushing new data and updating the **stack pointer**.

#### Performance

1. **Fast access** due to contiguous memory layout and minimal overhead.
2. Allocation and deallocation are **faster** than heap operations.

#### Other Characteristics

1. Data is **close together** in memory, **reducing cache misses**.
2. Fits well into **one CPU cache line** due to the locality of reference.

### **Heap (Dynamic Memory)**

#### Purpose

1. Stores **dynamically allocated objects** created during runtime.
2. Used when the amount of memory needed is not known in advance.

#### Allocation/Deallocation

1. **Manual allocation** using `new/delete` or `malloc/free`.
2. Memory needs to be **explicitly deallocated** to avoid **leaks**.

#### Lifetime

1. Exists until **explicitly deallocated** by the programmer.
2. Remains available even after the function that allocated it exits, as long as the pointer is
   preserved.
3. If the programmer forgets to release these variables, the system will delete them and reclaim the
   memory they occupied after the program exits.

#### Scope

1. **Global scope** if the pointer to allocated memory is retained.
2. Accessible from **anywhere** in the program through the pointer.

#### Size

1. **Predefined** to a default value according to the system but **can grow and shrink** as the
   application progresses. (Grows upward in memory).
2. Limited by **system memory** and subject to **fragmentation**.
3. Large allocations are possible, unlike the stack.

#### Structure

1. **Unstructured** memory, allocated and freed in any order.
2. Can lead to **fragmentation** if memory is not carefully managed.

#### Performance

1. **Slower** than stack due to non-contiguous memory and overhead of managing free space.
2. Fragmentation can impact performance over time.

#### Other Characteristics

1. Maintains **a free list** to check if there is free memory available for the application to use.
2. If there is **not enough heap memory**, it will ask the system to **allocate more memory**. The
   **performance cost** of this allocation is **high**.
3. **More cache misses**.

### Data Segment (Global/Static Memory)

#### Purpose

1. Stores **global, static, and constant variables**.
2. Retains values throughout the **entire program lifecycle**.

#### Allocation/Deallocation

1. **Allocated at program startup** and **deallocated at program termination**.

#### Lifetime

1. Exists for the **entire duration** of the program.
2. Retains values across function calls.

#### Scope

1. **Global scope**: Accessible from any part of the program.

#### Size

1. Depends on the **size and number** of variables.
2. Limited by the **linker and system memory**.

#### Structure

1. Includes:
   - **Constant segment**: Stores **string literals** and **constants**.
   - **Initialized data segment**: Stores variables with **explicit initial** values.
   - **BSS (uninitialized data segment, block started by symbol)**: Stores variables with **no
     initial** values, which are initialized to **zero by default**.
2. Organized as **a continuous memory block** for static, global and const variables/values.
3. **The storage order: Constant segment, initialized data segment, BSS**.

#### Performance

1. **Fast access** due to fixed memory locations.
2. Avoids runtime allocation overhead.

#### Other Characteristics

1. **Persistent values** can introduce side effects if not managed properly.
2. Typically **read-only** for constants to prevent accidental modification.

### Code Segment (Text Segment)

#### Purpose

1. Stores **compiled instructions** (machine code) of the program.

#### Allocation/Deallocation

1. **Allocated at program startup** and remains until the program ends.
2. Managed by the **OS and loader**.

#### Lifetime

1. Exists for the **entire runtime** of the program.

#### Scope

1. Not applicable; **read-only** segment.

#### Size

1. Depends on the **size of the compiled code**.
2. Limited by **system memory** and linker constraints.

#### Structure

1. A **contiguous block** of machine instructions.
2. Organized for **sequential execution** by the CPU.

#### Performance

1. **Fast execution** due to CPU caching and sequential access.
2. Code segment is often **optimized** for cache utilization.

#### Other Characteristics

1. **Read-only** to prevent accidental or malicious modification.
2. Supports **function-level optimizations** during compilation.

### Memory Mapping Segment

#### Purpose

1. Used for **mapping files or shared libraries** into memory.
2. Enables efficient access to large files without loading them entirely into RAM.

#### Allocation/Deallocation

1. Managed by the **OS** using functions like `mmap`.
2. Deallocated when the **file is closed** or the mapping is removed.

#### Lifetime

1. Varies based on **file or library usage**.

#### Scope

1. Accessible globally from **any part** of the program.

#### Size

1. Depends on the **size of the mapped file or library**.
2. **Either fixed or dynamic (grows upward in memory)**, depending on the type of mapping.
#### Structure

1. Divided into **read-only** and **read-write** segments.
2. Supports **lazy loading**, where only accessed portions are loaded.

#### Performance

1. **Efficient** for large files as only necessary parts are loaded.
2. Reduces memory usage compared to loading the entire file.

#### Other Characteristics

1. Enables **shared access** across processes for libraries or files.
2. Requires **OS-level support** for memory mapping.

### Memory Partitioning in C++ Program Execution

1. Stack vs. Heap:
   - The stack is **fast** and **automatically managed**, but **limited in size**.
   - The heap allows for more flexible memory usage at the cost of **manual management**.
2. Global/Static vs. Local:
   - Global and static variables have global lifetimes, while local variables (on the stack) have a
     shorter scope, limited to the block they are declared in.

### Notes

1. store data on stack > store data on heap > store pointers on stack > store pointers on heap.
2. The storage order: Text segment, data segment, memory mapping segment, heap, stack. (May vary,
   depending on OS, hardwares and compiler settings)

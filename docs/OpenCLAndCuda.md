<!-- vim-markdown-toc GFM -->

- [CUDA and OpenCL Compilation Processes](#cuda-and-opencl-compilation-processes)
  - [Introduction](#introduction)
  - [CUDA Compilation Process](#cuda-compilation-process)
  - [OpenCL Compilation Process](#opencl-compilation-process)
  - [Key Differences Between CUDA and OpenCL Compilation](#key-differences-between-cuda-and-opencl-compilation)
  - [Summary of Execution Flow](#summary-of-execution-flow)
  - [How to Determine the Size of a Local Work Group](#how-to-determine-the-size-of-a-local-work-group)
- [Copy Engine, DMA, MMU, GPU Memory, and CPU Memory](#copy-engine-dma-mmu-gpu-memory-and-cpu-memory)
  - [Introduction](#introduction-1)
  - [Copy Engine](#copy-engine)
  - [Direct Memory Access (DMA)](#direct-memory-access-dma)
  - [Memory Management Unit (MMU)](#memory-management-unit-mmu)
  - [GPU Memory](#gpu-memory)
  - [CPU Memory](#cpu-memory)
  - [Interaction Between Components](#interaction-between-components)
- [Command Queues (or Cuda Streams), Blocking or Non-blocking and Priorities](#command-queues-or-cuda-streams-blocking-or-non-blocking-and-priorities)

<!-- vim-markdown-toc -->

## CUDA and OpenCL Compilation Processes

### Introduction

The compilation processes for CUDA and OpenCL involve several steps, each
transforming source code into executable code that can run on GPU hardware.
Below is a detailed breakdown of the processes for both CUDA and OpenCL,
including the input files, output files, types of code generated, linking
processes, and the files executed at runtime.

### CUDA Compilation Process

1. **Input File**:
   - `.cu` files: These are CUDA C/C++ source files containing both host (CPU)
     and device (GPU) code.
2. **Compilation Steps**:
   - **Step 1: Compile `.cu` to PTX (Parallel Thread Execution)**:
     - The CUDA compiler (`nvcc`) compiles the `.cu` file into PTX, which is an
       intermediate representation (IR) of the GPU code. PTX is
       architecture-independent and can be executed on any NVIDIA GPU with a
       compatible driver.
     - **Output**: `.ptx` file.
   - **Step 2: Specify Target and Compile PTX to SASS (Optional)**:
     - The PTX code can be further compiled into SASS (Shader Assembly), which
       is the machine code for a specific GPU architecture (e.g., sm_50 for
       Maxwell, sm_75 for Turing).
     - This step is optional because PTX can be JIT-compiled at runtime by the
       GPU driver.
     - **Output**: `.cubin` file (binary format for GPU code).
   - **Step 3: Linking**:
     - The GPU code (PTX or SASS) is linked with the host code (CPU code) to
       create a single executable.
     - **Output**: Host executable (e.g., `.exe` on Windows or a binary on
       Linux).
3. **Runtime Execution**:
   - When the program runs, the host executable is executed on the CPU.
   - The GPU code (PTX or SASS) is loaded onto the GPU and executed when the
     host code calls a CUDA kernel.
4. **Files Executed at Runtime**:
   - Host executable (CPU code).
   - GPU code (PTX or SASS) loaded by the GPU driver.

### OpenCL Compilation Process

1. **Input Files**:
   - `.cl` files: These are OpenCL C source files containing kernel code (GPU
     code).
   - Host code: Written in C/C++ and compiled using `gcc` or `g++`.
2. **Compilation Steps**:
   - **Step 1: Compile Host Code**:
     - The host code is compiled using `gcc` or `g++` to create an executable.
     - **Output**: Host executable.
   - **Step 2: Compile OpenCL Kernel Code**:
     - The OpenCL kernel code (`.cl` files) is compiled at runtime by the OpenCL
       runtime.
     - The kernel code can be compiled into PTX (for NVIDIA GPUs) or SPIR
       (Standard Portable Intermediate Representation) for cross-platform
       compatibility.
     - **Output**: PTX or SPIR binary.
   - **Step 3: Linking**:
     - The OpenCL runtime links the compiled kernel code (PTX or SPIR) with the
       host executable at runtime.
     - **Output**: No separate file is generated; the linking happens in memory.
3. **Runtime Execution**:
   - When the program runs, the host executable is executed on the CPU.
   - The OpenCL runtime compiles and links the kernel code (PTX or SPIR) at
     runtime, and the GPU executes the kernel when invoked by the host code.
4. **Files Executed at Runtime**:
   - Host executable (CPU code).
   - Kernel code (PTX or SPIR) compiled and executed by the OpenCL runtime.

### Key Differences Between CUDA and OpenCL Compilation

| Aspect                | CUDA                                  | OpenCL                                   |
| --------------------- | ------------------------------------- | ---------------------------------------- |
| **Input Files**       | `.cu` (host + device code)            | `.cl` (kernel code) + host C/C++ code    |
| **Intermediate Code** | PTX (architecture-independent)        | PTX or SPIR (architecture-independent)   |
| **Target Code**       | SASS (GPU-specific machine code)      | PTX or SPIR (compiled at runtime)        |
| **Linking**           | Linked at compile time                | Linked at runtime by OpenCL runtime      |
| **Runtime Execution** | Host executable + GPU code (PTX/SASS) | Host executable + kernel code (PTX/SPIR) |

### Summary of Execution Flow

1. **CUDA**:
   - `.cu` -> PTX -> (Optional: SASS) -> `.cubin` -> Linked with host code ->
     Host executable -> Runs on CPU + GPU.
2. **OpenCL**:
   - `.cl` + Host C/C++ -> Host executable -> Kernel compiled to PTX/SPIR at
     runtime -> Runs on CPU + GPU.
3. Both CUDA and OpenCL rely on intermediate representations (PTX for CUDA,
   PTX/SPIR for OpenCL) to ensure portability across different GPU
   architectures. However, CUDA performs most of the compilation and linking
   steps at compile time, while OpenCL performs kernel compilation and linking
   at runtime.

### How to Determine the Size of a Local Work Group

1. **Find the Warp Size or Preferred Work Group Size Multiple**:
   - Look up your GPU architecture to determine its warp size, or use the
     `clinfo` command to find the `Preferred work group size multiple`.
2. **Find the Number of Warps per SM**:
   - Research your GPU architecture to determine the number of warps each
     Streaming Multiprocessor (SM) can handle.
3. **Consider Warp Scheduling and Work Group Size**:
   - Modern GPUs support warp scheduling, which allows idle warps within an SM
     to process parts of another workgroup while one workgroup is being
     processed. To maximize efficiency, the optimal workgroup size should have a
     multiple relationship with the product of the warp size and the number of
     warps per SM.
4. **Determine the Local Work Group Size**:
   - When deciding the size of a local workgroup, consider the following
     priority order:
     - `local_size % (warp_size * warp_number) == 0`;
     - `(warp_size * warp_number) % local_size == 0`;
     - `local_size % warp_size == 0`;
     - Other considerations.

## Copy Engine, DMA, MMU, GPU Memory, and CPU Memory

### Introduction

1. In modern computing systems, the **Copy Engine**, **Direct Memory Access
   (DMA)**, **Memory Management Unit (MMU)**, **GPU Memory**, and **CPU Memory**
   are integral components that work together to manage data transfers and
   memory access efficiently.

### Copy Engine

1. The Copy Engine is a dedicated hardware component within the GPU responsible
   for efficiently transferring data between different memory regions, such as
   between system memory (CPU memory) and GPU memory, or between multiple GPUs.
2. This engine operates independently of the GPU's main compute resources,
   allowing for concurrent data transfers without interrupting computational
   tasks.
3. For example, NVIDIA's Volta GV100 GPU features copy engines that can generate
   page faults for addresses not mapped in the GPU's page tables, enhancing data
   transfer capabilities.

### Direct Memory Access (DMA)

1. DMA is a feature that allows hardware peripherals, such as GPUs, to access
   system memory directly, bypassing the CPU.
2. This direct access facilitates efficient data transfers between the GPU and
   system memory, reducing CPU overhead and enhancing performance.
3. For instance, when programming using CUDA, the `memcpy` function can be used
   to copy data to the CPU or GPU, utilizing the PCIe controller and the DMA
   engine to handle the data transfer.

### Memory Management Unit (MMU)

1. The MMU is responsible for translating virtual memory addresses to physical
   addresses, enabling the operating system to manage memory effectively.
2. In GPUs, the MMU ensures that memory accesses are valid and that the GPU
   operates within its allocated memory space.
3. It also enforces memory protection, preventing unauthorized access to certain
   memory regions.
4. For instance, a miss in the GPU MMU can result in an Address Translation
   Request (ATR) to the CPU, which then looks in its page tables for the
   virtual-to-physical mapping.

### GPU Memory

1. GPU memory, often referred to as VRAM (Video RAM), is dedicated memory used
   by the GPU to store textures, frame buffers, and other data necessary for
   rendering graphics and performing computations.
2. Efficient management of GPU memory is crucial for high-performance computing
   tasks, as it directly impacts the GPU's ability to process data quickly.

### CPU Memory

1. CPU memory, or system memory, is the main memory used by the CPU to store
   data and instructions for processing.
2. This memory is typically larger and slower than GPU memory but is essential
   for general-purpose computing tasks.

### Interaction Between Components

1. When a GPU performs a DMA operation, the Copy Engine utilizes the DMA engine
   to transfer data between GPU memory and CPU memory.
2. The MMU ensures that these memory accesses are valid and properly mapped,
   translating virtual addresses to physical addresses and enforcing memory
   protection.
3. This collaboration allows for efficient and secure data transfers between the
   CPU and GPU, enhancing overall system performance.
4. In summary, the Copy Engine, DMA, MMU, GPU memory, and CPU memory work
   together to manage data transfers and memory access in modern computing
   systems.
5. Their coordinated operation ensures efficient and secure data handling, which
   is essential for high-performance computing tasks.

## Command Queues (or Cuda Streams), Blocking or Non-blocking and Priorities

1.  Command queues deliver events sequentially and cache all events that have
    not been delivered.
2.  The next event is delivered only when the current event has finished in the
    same command queue, even if multiple physical queues are used.
3.  The blocking and non-blocking flags indicate whether the host needs to wait
    for the current blocking or non-blocking enqueued event to finish.
4.  If it’s blocking, the host does not execute any tasks until the command has
    finished.
5.  Otherwise, after enqueuing the command, the host continues doing other work.
6.  Priorities in OpenCL can influence the order in which events are scheduled
    for execution, but tasks from different command queues do not preempt each
    other. The OpenCL runtime schedules tasks based on availability of physical
    command queues, and higher-priority tasks are executed when a physical queue
    becomes available. But, the task itself will not forcefully stop the task
    currently executing in the physical queue.
7.  In OpenCL, when the number of command queues exceeds the number of available
    physical queues, the scheduling of events is influenced by:
    - Enqueued order in the host code: The sequence in which events are added to
      the queues in the host code matters.
    - Event order in their own event queue: Events within the same command queue
      are executed in the order they are enqueued, respecting the dependency
      chain of the events.
    - Priorities of the command queues: If the command queues have different
      priorities, the OpenCL runtime will favor executing tasks from
      higher-priority queues when physical queues become available.
8.  Pseudocode: Host code, driver, and events run asynchronously
    1. Host creates multiple command queues.
    2. Host enqueues an event into a command queue:
       - The event may not be enqueued as the last event.
       - Its position depends on its priority and the priorities of other events
         cached in the command queue.
    3. Driver enqueues the command queue into a software queue:
       - The command queue may not be enqueued as the last command queue.
       - Its position depends on its priority and the priorities of other
         command queues cached in the software queue.
    4. Driver checks if there is an available physical queue:(This step varies
       depending on the implementation of the driver.)
       - If a physical queue is available, the software dequeues a command
         queue:
         - Driver checks if the command queue is related to a busy physical
           queue:
           - If it is, the counter of the busy physical queue is incremented
             by 1.
           - If it is not, the command queue dequeues an event, and the counter
             of the available physical queue is incremented by 1.
       - Otherwise, the driver waits for an available command queue.
    5. At the same time, the host checks if the enqueue function is a blocking
       function:
       - If it is a blocking function, the host waits for the enqueued event to
         finish.
       - If it is not a blocking function, the host continues executing the next
         code.

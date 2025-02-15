<!-- vim-markdown-toc GFM -->

- [CUDA and OpenCL Compilation Processes](#cuda-and-opencl-compilation-processes)
  - [Introduction](#introduction)
  - [CUDA Compilation Process](#cuda-compilation-process)
  - [OpenCL Compilation Process](#opencl-compilation-process)
  - [Key Differences Between CUDA and OpenCL Compilation](#key-differences-between-cuda-and-opencl-compilation)
  - [Summary of Execution Flow](#summary-of-execution-flow)

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

---

### Key Differences Between CUDA and OpenCL Compilation

| Aspect                | CUDA                                  | OpenCL                                   |
| --------------------- | ------------------------------------- | ---------------------------------------- |
| **Input Files**       | `.cu` (host + device code)            | `.cl` (kernel code) + host C/C++ code    |
| **Intermediate Code** | PTX (architecture-independent)        | PTX or SPIR (architecture-independent)   |
| **Target Code**       | SASS (GPU-specific machine code)      | PTX or SPIR (compiled at runtime)        |
| **Linking**           | Linked at compile time                | Linked at runtime by OpenCL runtime      |
| **Runtime Execution** | Host executable + GPU code (PTX/SASS) | Host executable + kernel code (PTX/SPIR) |

### Summary of Execution Flow

- **CUDA**:
  - `.cu` -> PTX -> (Optional: SASS) -> `.cubin` -> Linked with host code ->
    Host executable -> Runs on CPU + GPU.
- **OpenCL**:
  - `.cl` + Host C/C++ -> Host executable -> Kernel compiled to PTX/SPIR at
    runtime -> Runs on CPU + GPU.
- Both CUDA and OpenCL rely on intermediate representations (PTX for CUDA,
  PTX/SPIR for OpenCL) to ensure portability across different GPU architectures.
  However, CUDA performs most of the compilation and linking steps at compile
  time, while OpenCL performs kernel compilation and linking at runtime.

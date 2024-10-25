<!-- vim-markdown-toc GFM -->

- [`make` and Makefile](#make-and-makefile)
  - [1) `make`](#1-make)
  - [2) Makefile](#2-makefile)
  - [Basic Syntax of Makefile](#basic-syntax-of-makefile)
    - [Code](#code)
    - [Explanation](#explanation)
  - [How `make` Processes a Makefile](#how-make-processes-a-makefile)
    - [1) Prerequisite](#1-prerequisite)
    - [2) Steps](#2-steps)
  - [`.PHONY`, a Pseudo Target](#phony-a-pseudo-target)
    - [1) Syntax:](#1-syntax)
    - [2) Explanation and Usage:](#2-explanation-and-usage)
    - [3) Example:](#3-example)
  - [Implicit Rule](#implicit-rule)
    - [1) Explanation](#1-explanation)
    - [2) Common Implicit Rules](#2-common-implicit-rules)
    - [3) Suggestion](#3-suggestion)
  - [Variables in Makefile](#variables-in-makefile)
    - [1) Explanation and Usage](#1-explanation-and-usage)
    - [2) The Syntax of Defining a Variable](#2-the-syntax-of-defining-a-variable)
    - [3) The Syntax of Referencing a Variable](#3-the-syntax-of-referencing-a-variable)
    - [4) Default Variables, Common Variables, Automatic Variables, Special Symbols and Environment Variables](#4-default-variables-common-variables-automatic-variables-special-symbols-and-environment-variables)
      - [(1) Explanation](#1-explanation-1)
      - [(2) Name of Default Variables](#2-name-of-default-variables)
      - [(3) Name of Common Variables](#3-name-of-common-variables)
      - [(4) Common Automatic Variables](#4-common-automatic-variables)
      - [(5) Some Common Special Symbols](#5-some-common-special-symbols)
      - [(6) Environment Variables](#6-environment-variables)
        - [1 The Syntax of Referencing an Environment Variable](#1-the-syntax-of-referencing-an-environment-variable)
        - [2 The Syntax of Overriding an Environment Variable](#2-the-syntax-of-overriding-an-environment-variable)
        - [3 Important Notes](#3-important-notes)
        - [4 Some Common Environment Variables in Makefiles](#4-some-common-environment-variables-in-makefiles)
  - [Functions in Makefiles](#functions-in-makefiles)
    - [Functions for Transforming Text ( Usage )](#functions-for-transforming-text--usage-)
    - [Function Call Syntax](#function-call-syntax)
    - [More Information](#more-information)
  - [Pattern Rules](#pattern-rules)
    - [1) Explanation and Usage](#1-explanation-and-usage-1)
    - [2) Basic Syntax](#2-basic-syntax)
      - [Code](#code-1)
      - [Explanation](#explanation-1)
    - [3) Important Notes](#3-important-notes-1)
    - [4) How to Understand the Actual Process of Pattern Rules](#4-how-to-understand-the-actual-process-of-pattern-rules)
    - [5) Example Without Variables](#5-example-without-variables)
      - [Example 1: Compiling `.cpp` files to `.o` files](#example-1-compiling-cpp-files-to-o-files)
        - [Code](#code-2)
        - [Explanation](#explanation-2)
      - [Example 2: Creating Executables](#example-2-creating-executables)
        - [Code](#code-3)
        - [Explanation](#explanation-3)
      - [Example 3: Custom Pattern Rule](#example-3-custom-pattern-rule)
        - [Code](#code-4)
        - [Explanation](#explanation-4)
      - [Example 4: Chaining Pattern Rules](#example-4-chaining-pattern-rules)
        - [Code](#code-5)
        - [Explanation](#explanation-5)
      - [Example 5: Using `$*` for Matching Stems](#example-5-using--for-matching-stems)
        - [Code](#code-6)
        - [Explanation](#explanation-6)
    - [6) Example With Variables](#6-example-with-variables)
      - [Example 1: Using Variables for File Extensions](#example-1-using-variables-for-file-extensions)
        - [Code](#code-7)
        - [Explanation](#explanation-7)
      - [Example 2: Using Variables for Directories](#example-2-using-variables-for-directories)
        - [Code](#code-8)
        - [Explanation](#explanation-8)
      - [Example 3: Using Variables for Compiler and Flags](#example-3-using-variables-for-compiler-and-flags)
        - [Code](#code-9)
        - [Explanation](#explanation-9)
      - [Example 4: Using Variables for Custom Commands](#example-4-using-variables-for-custom-commands)
        - [Code](#code-10)
        - [Explanation](#explanation-10)
      - [Example 5: Combining Multiple Variables](#example-5-combining-multiple-variables)
        - [Code](#code-11)
        - [Explanation](#explanation-11)
      - [Example 6: Using a Variable for a List of Targets](#example-6-using-a-variable-for-a-list-of-targets)
        - [Code](#code-12)
        - [Explanation](#explanation-12)
      - [Example 7: Using a Variable with Multiple Targets for an Executable](#example-7-using-a-variable-with-multiple-targets-for-an-executable)
        - [Code](#code-13)
        - [Explanation](#explanation-13)
      - [Example 9: Using a Variable for Source Files and a Pattern Rule to Compile Them](#example-9-using-a-variable-for-source-files-and-a-pattern-rule-to-compile-them)
        - [Code](#code-14)
        - [Explanation](#explanation-14)
      - [Example 10: Pattern Rule with Variable Target-Pattern Using wildcard](#example-10-pattern-rule-with-variable-target-pattern-using-wildcard)
        - [Code](#code-15)
        - [Explanation](#explanation-15)
      - [Example 11: Pattern Rule with a Prefix](#example-11-pattern-rule-with-a-prefix)
        - [Code](#code-16)
        - [Explanation](#explanation-16)
      - [Example 12: Limitations and an Error Demonstration](#example-12-limitations-and-an-error-demonstration)
        - [Code](#code-17)
        - [Explanation](#explanation-17)
  - [How to Process Header Files Effectively](#how-to-process-header-files-effectively)
    - [1) Problem](#1-problem)
    - [2) Solution](#2-solution)
      - [Code](#code-18)
      - [Explanation](#explanation-18)
  - [Some Common `make` command](#some-common-make-command)
    - [0) `make`](#0-make)
    - [1) `make -jn`](#1-make--jn)
    - [2) `make target_name`](#2-make-target_name)
    - [3) `make -C a_path`](#3-make--c-a_path)
    - [4) `make -C a_path target_name`](#4-make--c-a_path-target_name)
    - [5) `make target_name VAR_NAME1="..." VAR_NAME2="..." ...`](#5-make-target_name-var_name1-var_name2-)
    - [6) `make -C a_path target_name VAR_NAME1="..." VAR_NAME2="..." ...`](#6-make--c-a_path-target_name-var_name1-var_name2-)
  - [How to Manage Libraries or Dependencies Your Project Denpends On](#how-to-manage-libraries-or-dependencies-your-project-denpends-on)

<!-- vim-markdown-toc -->

## `make` and Makefile

#### 1) `make`

1. The `make` command is a build automation tool primarily used for compiling and building projects
   in C, C++, and other programming languages. It simplifies the process of compiling code, linking
   libraries, and creating executables by reading instructions from a configuration file called a
   Makefile. Additionally, it checks the return value of each executed command in the Makefile. If a
   command returns an error (a non-zero value), `make` will exit.

#### 2) Makefile

1. A Makefile consists of a set of rules, each specifying how to compile files, generate targets, or
   perform other tasks related to building the project. These rules may include shell commands as
   well as custom commands defined within the Makefile syntax. A rule consists of three parts:
   target, dependency ( prerequisite ) and command. The dependency set of a rule can be empty.

### Basic Syntax of Makefile

#### Code

```Makefile
target1: dependency set1
  command set1
target2: dependency set2
  command set2
  ...
```

#### Explanation

1. target: It is a file you want to create, except for a pseudo target. It can be an object file, a
   `.cpp` file, a `.txt` file, and so on.
2. dependency: It is a file that a target requires during its creation. It can be an object file, a
   `.cpp` file, a `.txt` file, and so on. Typically, it's unnecessary to explicitly list header
   files because the compiler can automatically track dependencies between source files and header
   files.
3. command set: It is a set of commands used to compile all dependency files into a target file.
4. Note: Only files listed as targets or within the dependency set will be checked for existence or
   modifications.

### How `make` Processes a Makefile

#### 1) Prerequisite

1. Simply type the make command without any suffix or option.
2. Ensure all source files and the Makefile are in the same folder.

#### 2) Steps

1. Check for a Makefile in the current folder:
   - (1) If the Makefile does not exist, exit and report an error: "No targets specified and no
     makefile found. Stop.".
   - (2) If the Makefile is found, proceed to the next step.
2. Identify the first target: Locate the first target in the Makefile and treat it as the final or
   default target. For example, in the basic rule of the makefile above, target1 is the first
   target.
3. Build the dependency graph: `make` examines the dependencies listed in the Makefile and
   constructs a dependency graph.
   - (1) Each target can depend on other files or targets, which are updated recursively if
     necessary.
   - (2) Each node in the dependency graph represents a target or file and its associated commands,
     except for the leaf nodes.
   - (3) A child node represents a dependency of its parent (a file or target), except for the leaf
     nodes. (4) Each leaf node represents a source or a library file or a target file and its
     command set witout any dependency.
   - (5) The root node represents the final target and its command set.
4. Recursively scan the dependency graph: Traverse the dependency graph in a breadth-first manner,
   starting from the leaves up to the root. While scanning the tree, check if the file corresponding
   to the current node exists or if its timestamp is newer than the root's.
   - (1) If the file exists and its timestamp is not newer than the root’s, continue scanning.
   - (2) If the file’s timestamp is newer than the root’s, execute the parent node's commands to
     rebuild it.
   - (3) If the file does not exist and it's not a leaf, execute its command set and rebuild it.
   - (4) If the file does not exist and it's a leaf with a command set, execute its command set and
     rebuild it.
   - (5) If the file does not exist and it's a leaf without a command set, exit and report an error:
     "No rule to make target 'xxx', needed by 'yyy'. Stop.".

### `.PHONY`, a Pseudo Target

#### 1) Syntax:

```Makefile
.PHONY: a_pseudo_target1, a_pseudo_target2, ...
```

#### 2) Explanation and Usage:

1. A pseudo-target (also called a phony target) in a Makefile is a target that does not represent a
   real file.
2. It is used to group commands or perform actions, such as cleaning up files or running non-file
   related tasks like tests.
3. Since these targets do not correspond to actual files, they are marked as "phony" to avoid
   conflicts with files of the same name that might exist in the directory.

#### 3) Example:

```Makefile
.PHONY: clean

clean:
  rm -f *.o *.exe
```

### Implicit Rule

#### 1) Explanation

1. In a Makefile, an implicit rule is a predefined or general rule that tells make how to build
   certain types of files automatically without explicitly specifying a rule for each file. These
   rules are built into make and handle common tasks like compiling `.c` or `.cpp` files into object
   files, linking object files into executables, and more.

#### 2) Common Implicit Rules

1. Compiling `.c` to .`o`:

   - (1) Implicit rule: `n.o`: `n.c`
   - (2) Command: `$(CC) -c $(CFLAGS) n.c -o n.o`
   - (3) This rule tells make how to compile a `.c` file into an object (`.o`) file.

2. Compiling `.cpp` to `.o`:

   - (1) Implicit rule: `n.o`: `n.cpp`
   - (2) Command: `$(CXX) -c $(CXXFLAGS) n.cpp -o n.o`
   - (3) Similarly, this rule tells make how to compile C++ files into object files.

3. Linking object files into an executable:

   - (1) Implicit rule: `prog`: `prog.o`
   - (2) Command: `$(CC) prog.o $(LDFLAGS) -o prog`
   - (3) This rule links an object file into an executable.

#### 3) Suggestion

1. Avoid using implicit rules, as they can lead to various issues. Instead, define your own rules to
   override them.
2. Use the command `make -r` or add `.SUFFIXES:` to your Makefile to prevent the use of implicit
   rules.

### Variables in Makefile

#### 1) Explanation and Usage

1. In a Makefile, variables are used to store values (such as flags, paths, or file lists) that can
   be referenced multiple times, simplifying the Makefile's maintenance. They are used in targets,
   dependency sets, and command sets. A variable can represent multiple targets in a pattern rule or
   a list of target files, allowing the pattern rule to apply to those targets. However, there is an
   important limitation: a variable cannot be used directly in place of the % in the target pattern.

#### 2) The Syntax of Defining a Variable

1. Simple assignment (`VAR_NAME = value`): The value is expanded when the variable is used.
2. Immediate assignment (`VAR_NAME := value`): The value is expanded when the variable is defined.
3. Conditional assignment (`VAR_NAME ?= value`): Only assigns if the variable is not already
   defined.

#### 3) The Syntax of Referencing a Variable

```Makefile
$(VAR_NAME)
```

#### 4) Default Variables, Common Variables, Automatic Variables, Special Symbols and Environment Variables

##### (1) Explanation

1. Default variables: In Makefiles, default variables are pre-defined by make itself. They come with
   default values and they can be overridden in your Makefile if necessary.

2. Common variables: In Makefiles, common variables refer to variables that are frequently used in
   build scripts, such as CC for the compiler or CFLAGS for compiler options. These are often
   user-defined or customized for specific projects.

3. Automatic variables: In Makefile, automatic variables are predefined variables that hold specific
   values based on the rule being executed. These variables are automatically set by make and allow
   you to write more flexible and generalized rules. They represent parts of a rule, such as the
   target, prerequisites ( prerequisities = dependencies ), or the stem ( The part of the file name
   that `%` matches is called the stem. ) of a filename in pattern rules.

4. Special symbols: In Makefiles, special symbols help define rules and control execution.

5. Environment variables: In a Makefile, environment variables play an important role in controlling
   the build process. These variables are inherited from the shell's environment and can be used in
   the Makefile to set values for compilers, paths, flags, or other settings.

##### (2) Name of Default Variables

1. `CC`: Defaults to `cc`.
2. `CXX`: Defaults to `g++`.
3. `MAKE`: Defaults to `make`.
4. `AR`: Defaults to `ar`.
5. `RM`: Defaults to `rm -f`.

##### (3) Name of Common Variables

1. `CC`: C compiler.
2. `CXX`: C++ compiler.
3. `CFLAGS`: Compiler flags for C.
4. `CXXFLAGS`: Compiler flags for C++.
5. `LDFLAGS`: Linker options.
6. `LDLIBS`: Libraries to link.
7. `OBJS`: List of object files.
8. `SRC`: List of source files.

##### (4) Common Automatic Variables

1. `$@`: Represents the full target name. This is used when you need to refer to the target being
   generated, like in commands that create that target.
2. `$<`: Refers to the first prerequisite of the target. It is often used in rules where only the
   first dependency is needed, like in compiling a source file.
3. `$^`: Contains all the prerequisites for the target, but with any duplicates removed. This is
   useful for linking or when all dependencies are needed.
4. `$+`: Similar to $^, but includes duplicates. It is often used in cases where the order of
   prerequisites is significant.
5. `$?`: Contains all prerequisites that are newer than the target. This is helpful for incremental
   builds, as it allows make to rebuild only when necessary.
6. `$*`: Represents the stem of the target name, which is the part matched by the % in pattern
   rules. It is useful when constructing filenames based on patterns.
7. `$%`: This variable is used when the target is an archive. It represents the member name being
   processed, which is useful for commands dealing with archive files.
8. `$$`: Used to represent a literal dollar sign ($). In commands where a dollar sign is needed
   (e.g., for shell commands), this is necessary to prevent it from being interpreted as the
   beginning of a variable.
9. `$(a function or a VAR_NAME)`: Used for function calls or to evaluate the value of a variable.

##### (5) Some Common Special Symbols

1. `%`: Wildcard used in pattern rules (matches any string).
2. `:`: Separates targets from their prerequisites in rules.
3. `$`: Introduces a variable or automatic variable (e.g., `$@`, `$<`).
4. `@`: Represents a command prefix to suppress command echoing.
5. `-`: Represents a command prefix that ignores errors for the command without causing make to
   exit, thereby allowing subsequent commands to execute.

##### (6) Environment Variables

###### 1 The Syntax of Referencing an Environment Variable

```
$(ENV_VAR)
```

###### 2 The Syntax of Overriding an Environment Variable

1. Use an assignment operation to assign a value to it in a Makefile: `ENV_VAR = value`,
   `ENV_VAR := value` or `ENV_VAR ?= value`.
2. Override environment variables when invoking make from the command line: `make ENV_VAR = value`,
   `make ENV_VAR := value` or `make ENV_VAR ?= value`.

###### 3 Important Notes

1. Command-Line Precedence: Command-line variable assignments (e.g., `make CC=clang`) take
   precedence over both environment variables and variables defined in the Makefile.

2. Override Directive: If you want to ensure that a Makefile variable cannot be overridden by the
   environment or the command line, you can use the override directive: `override ENV_VAR = value`,
   `override ENV_VAR := value` or `override ENV_VAR ?= value`.

###### 4 Some Common Environment Variables in Makefiles

1. `CC`: C compiler (e.g., `gcc`, `clang`).
2. `CXX`: C++ compiler.
3. `CFLAGS`: C compiler flags.
4. `CXXFLAGS`: C++ compiler flags.
5. `LDFLAGS`: Linker flags.
6. `AR`: Archiver (used for static libraries).
7. `LD`: Linker.

### Functions in Makefiles

#### Functions for Transforming Text ( Usage )

1. Functions allow you to do text processing in the makefile to compute the files to operate on or
   the commands to use in recipes. You use a function in a function call, where you give the name of
   the function and some text (the arguments) for the function to operate on. The result of the
   function’s processing is substituted into the makefile at the point of the call, just as a
   variable might be substituted.

#### Function Call Syntax

1.  `$(function arguments)`
2.  `${function arguments}`

#### More Information

1. If you want to know more about functions in Makefiles, you can refer to `<<GNU Make.pdf>>`.

### Pattern Rules

#### 1) Explanation and Usage

1. In Makefiles, pattern rules allow you to define generalized rules that apply to multiple targets
   with similar file extensions or naming patterns.
2. Pattern rules use the `%` symbol to represent a pattern that can be matched by different file
   names.
3. This is particularly useful when you have repetitive build steps, like compiling several .cpp
   files into `.o` files.

#### 2) Basic Syntax

##### Code

```Makefile
target-pattern: prerequisite-pattern
 command set
```

##### Explanation

1. target-pattern: The pattern for the file(s) to be created. `%` matches any part of the target
   name.
2. prerequisite-pattern: A pattern for the required dependencies. `%` in this part of the rule
   matches the same text as in the target pattern.
3. command set: It a set of commands to run when the pattern rule is triggered.

#### 3) Important Notes

1. The `%` symbol is the only wildcard symbol available for pattern rules in Makefiles. It is
   specifically designed to represent a pattern wildcard that can match any part of a file name.
2. `%` is used to represent a placeholder for a part of the target or prerequisite name. It matches
   any string of characters in the file names and is used to create general rules for targets that
   follow a similar pattern.
3. The part of the file name that `%` matches is called the stem. The stem is used to correlate the
   target with the prerequisite.

#### 4) How to Understand the Actual Process of Pattern Rules

1. Create a simple `C/C++` project.
2. Writing multiple simple `C/C++` files.
3. Copy the following code example into your `Makefile`.
4. Execute the `make` command in a terminal.
5. Check the printed information in the terminal.
6. The printed information shows the actual process of the pattern rules of the code example.

#### 5) Example Without Variables

##### Example 1: Compiling `.cpp` files to `.o` files

###### Code

```Makefile
%.o: %.cpp
  g++ -c $< -o $@
```

###### Explanation

1. This rule applies to all `.cpp` files in the project and compiles them into `.o` object files.
2. `%.o`: Target pattern that matches any `.o` file.
3. `%.cpp`: Prerequisite pattern that matches the corresponding .cpp file.
4. `$<`: Refers to the first prerequisite (the .cpp file in this case).
5. `$@`: Refers to the target (the `.o` file).

##### Example 2: Creating Executables

###### Code

```Makefile
%: %.cpp
  g++ $< -o $@
```

###### Explanation

1. This rule compiles `.cpp` files into executable files directly.
2. `%`: Represents any executable name without any suffix.
3. `%.cpp`: The prerequisite is a `.cpp` file with the same base name as the target.
4. `$<`: Refers to the .cpp file.
5. `$@`: Refers to the executable.

##### Example 3: Custom Pattern Rule

###### Code

```Makefile
build/%: src/%.cpp
  g++ -Wall $< -o $@
```

###### Explanation

1. This rule apply a custom command to get dependencies from `src/` and generate targets into
   `build/`.
2. Targets files in the `build/` directory.
3. Matches .cpp files in the `src/` directory.
4. The `g++ -Wall` command is applied to the matched files.

##### Example 4: Chaining Pattern Rules

###### Code

```Makefile
%.o: %.cpp
  g++ -c $< -o $@

Exe: Main.o Fun.o
  g++ Main.o Fun.o -o Exe
```

###### Explanation

1. Pattern rules can be chained, meaning one pattern rule can produce an intermediate file, which
   can then be used as a prerequisite for another pattern rule.
2. In this case, `.cpp` files are first compiled into `.o` files, which are then linked together to
   produce the app executable.

##### Example 5: Using `$*` for Matching Stems

###### Code

```Makefile
%.test: %.o
  ./run_tests $*
```

###### Explanation

1. This pattern rule applies to any `.test` file, using the corresponding `.o` file as a
   prerequisite. `$*` represents the stem.
2. The part of the file name that `%` matches is called the stem. The stem is used to correlate the
   target with the prerequisite.

#### 6) Example With Variables

##### Example 1: Using Variables for File Extensions

###### Code

```Makefile

EXT = cpp

%.o: %.$(EXT)
  g++ -c $< -o $@
```

###### Explanation

1. Define a variable to hold file extensions, and then use that variable in a pattern rule.
2. `EXT = cpp`: Defines a variable `EXT` with the value cpp.
3. `%.o: %.$(EXT)`: Matches any `.cpp` file (or whatever extension is stored in `EXT`) to produce a
   `.o` file.
4. `$<` and `$@`: Standard automatic variables for prerequisites and targets.

##### Example 2: Using Variables for Directories

###### Code

```Makefile

SRC_DIR = src
BUILD_DIR = build

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
  g++ -c $< -o $@
```

###### Explanation

1. Define a variable to to specify directory paths in pattern rules. This is useful if your source
   files and build outputs are in different directories.
2. SRC_DIR and BUILD_DIR: Variables for source and build directories.
3. `$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp`: For any `.cpp` file in `src/`, compile it into a `.o` file
   in `build/`.
4. `$<`: Refers to the prerequisite (the `.cpp` file).
5. `$@`: Refers to the target (the `.o` file).

##### Example 3: Using Variables for Compiler and Flags

###### Code

```Makefile

CC = g++
CFLAGS = -Wall -O2

%.o: %.cpp
  $(CC) $(CFLAGS) -c $< -o $@
```

###### Explanation

1. Define the compiler and compilation flags using variables and use them within the pattern rule.
2. `CC = g++`: Defines the compiler variable.
3. `CFLAGS = -Wall -O2`: Defines the flags to be used during compilation.
4. `$(CC) $(CFLAGS)`: Expands to the actual compiler command with flags inside the pattern rule.

##### Example 4: Using Variables for Custom Commands

###### Code

```Makefile

LINTER = cppcheck

%.lint: %.cpp
  $(LINTER) $<
```

###### Explanation

1. Store a command in a variable and use it within a rule.
2. This rule runs a linting tool (`cppcheck` in this case) on every `.cpp` file and creates a
   `.lint` file.

##### Example 5: Combining Multiple Variables

###### Code

```Makefile

SRC_DIR = src
OBJ_DIR = obj
CC = g++
CFLAGS = -O2 -Wall

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
  $(CC) $(CFLAGS) -c $< -o $@
```

###### Explanation

1. Combine multiple variables in a single pattern rule to control paths, files, and commands
   flexibly.
2. Compile each `.cpp` file from `src/` into a corresponding `.o` file in the `obj/` directory.
3. The compiler and flags are customizable through variables (`CC` and `CFLAGS`).

##### Example 6: Using a Variable for a List of Targets

###### Code

```Makefile
OBJS = Main.o Fun.o FunN.o

$(OBJS): %.o: %.cpp
g++ -c $< -o $@
```

###### Explanation

1. Define a variable that contains a list of targets and use it with a pattern rule.
2. `OBJS`: A variable containing a list of object files (`Main.o`, `Fun.o`, `FunN.o`).
3. `$(OBJS): %.o: %.cpp`: A pattern rule that applies to all targets in the `OBJS` list, and the `%`
   matches the base name of the file.

##### Example 7: Using a Variable with Multiple Targets for an Executable

###### Code

```Makefile

OBJS = Main.o Fun.o FunN.o
EXEC = Main.exe

$(EXEC): $(OBJS)
  g++ $(OBJS) -o $(EXEC)
```

###### Explanation

1. Define two variables: one containing a list of `.o` and the other containing a target separately,
   and use them with a pattern rule..
2. `OBJS`: A list of object files (`Main.o`, `Fun.o`, `FunN.o`).
3. `$(EXEC)`: The name of the executable (`Main.exe`).
4. `g++ $(OBJS) -o $(EXEC)`: Links the object files into the executable.

##### Example 9: Using a Variable for Source Files and a Pattern Rule to Compile Them

###### Code

```Makefile

SRCS = Main.cpp Fun.cpp FunN.cpp
OBJS = $(SRCS:.cpp=.o)

$(OBJS): %.o: %.cpp
  g++ -c $< -o $@
```

###### Explanation

1. Use a variable to represent multiple source files and compile them into object files
2. `SRCS`: A variable containing a list of `.cpp` source files.
3. `OBJS`: A variable that automatically transforms the `.cpp` file list in SRCS into a list of
   corresponding `.o` files.
4. `$(OBJS): %.o: %.cpp`: A pattern rule that applies to all the object files in `OBJS`, and each
   `.cpp` file will be compiled to its corresponding `.o` file.

##### Example 10: Pattern Rule with Variable Target-Pattern Using wildcard

###### Code

```Makefile

SRCS = $(wildcard src/\*.cpp)
OBJS = $(SRCS:src/%.cpp=build/%.o)

$(OBJS): build/%.o: src/%.cpp
  g++ -c $< -o $@
```

###### Explanation

1. Generate a list of files dynamically using the `wildcard` function and apply a pattern rule to
   them.
2. `SRCS`: Uses wildcard to get all `.cpp` files in the `src/` directory.
3. `OBJS`: Automatically generates a list of object files in the `build/` directory.
4. `$(OBJS): build/%.o: src/%.cpp`: A pattern rule that applies to each `.cpp` file in `src/` and
   compiles it into its corresponding `.o` file in `build/`.

##### Example 11: Pattern Rule with a Prefix

###### Code

```Makefile
# List all .cpp files, .o files, and .so files
SRCS = Main.cpp Fun.cpp FunN.cpp
OBJS = Main.o
SHARED_LIBS = libFun.so libFunN.so
TARGET = Main.exe
PREFIX = lib

$(TARGET): $(OBJS) $(STATIC_LIBS) $(SHARED_LIBS)
  $(CC) -o $@ $< -L. -lFun -lFunN

# Pattern rules:
%.o: %.cpp
  $(CC) -c -fPIC -o $@ $<

# Rule to create the shared library from Fun.cpp
$(SHARED_LIBS): $(PREFIX)%.so: %.o
  $(CC) -shared -o $@ $<
```

###### Explanation

1. Generate shared libraries and link them into a final executable.
2. `$(SHARED_LIBS): $(PREFIX)%.so: %.o`: A pattern rule that applies to each `$(PREFIX)%.so` file in
   `$(SHARED_LIBS)`, and each `.o` file is compiled into its corresponding `$(PREFIX)%.so` file.

##### Example 12: Limitations and an Error Demonstration

###### Code

```Makefile
TARGET_PATTERN = %.o
$(TARGET_PATTERN): %.cpp
  g++ -c $< -o $@
```

###### Explanation

1. The target-pattern itself cannot directly contain a variable that includes a `%`.
2. `TARGET_PATTERN`: A variable contains a `%`. This is a wrong demonstration.

### How to Process Header Files Effectively

#### 1) Problem

1. I have introduced the common knowledge regarding custom rules, implicit rules, and pattern rules.
   However, these rules cannot process header files effectively. The make command cannot determine
   which header files the C/C++ files depend on. These dependencies are only identified when the
   compiler processes the C/C++ files, and there isn't a straightforward name-mapping rule.
   Consequently, issues arise: if any header files are updated, the make command remains unaware of
   the modifications and does nothing to update the project.

#### 2) Solution

##### Code

```Makefile
.PHONY: clean
# Define the compiler variable
CC = g++

# List all .cpp files
SRCS = $(wildcard *.cpp)

# Generate a list of .o files from SRCS
OBJS = $(SRCS:.cpp=.o)

# Generate a list of .d files from SRCS
DEPS = $(SRCS:.cpp=.d)

TARGET = Main.exe

# Default target:
$(TARGET): $(OBJS)
  $(CC) -o $@ $^

# The rule for # xyz.d is generated by xyz.cpp:
%.d: %.cpp
  $(CC) -MM $< > $@

# Pattern rules:
%.o: %.cpp
  $(CC) -c -o $@ $<

clean:
  rm -rf *.o *.d $(TARGET)

# Include all .d files:
include $(DEPS)
```

##### Explanation

1. `gcc -MM` and `g++ -MM` can identify the header dependencies of the source file.
2. `include $(DEPS)`: This line includes all the `.d` files in the Makefile. It tells make to use
   the dependency information to track changes to header files.

### Some Common `make` command

#### 0) `make`

1. For the default make command, please refer to
   [4) How to Understand the Actual Process of Pattern Rules](#4-how-to-understand-the-actual-process-of-pattern-rules)
2. Notes: If you want to use this command in Makefiles, please use `$(MAKE)` instead of `make`. This
   is the more commonly used option.

#### 1) `make -jn`

1. This flag `-j` allows make to run multiple jobs in parallel, speeding up the build process by
   utilizing multiple CPU cores. The number `n` ( `n ≥ 1` )following `-j` (if provided) specifies
   the maximum number of jobs to run simultaneously. Without a number `n`, make will use a default
   value.
2. Notes: If you want to use this command in Makefiles, please use `$(MAKE)` instead of `make`. This
   is the more commonly used option.

#### 2) `make target_name`

1. This command tells `make` to build a specific target named `target_name` as defined in the
   Makefile. If `target_name` has prerequisites, `make` will first build those before building the
   specified target.
2. Notes: If you want to use this command in Makefiles, please use `$(MAKE)` instead of `make`. This
   is the more commonly used option.

#### 3) `make -C a_path`

1. The `-C` option changes the directory to `a_path` before executing the `make` command. This
   allows you to run `make` in a different directory than the current one, where the Makefile is
   located. If no target is specified, `make` will build the default target defined in the Makefile
   in that directory.
2. Notes: If you want to use this command in Makefiles, please use `$(MAKE)` instead of `make`. This
   is the more commonly used option.

#### 4) `make -C a_path target_name`

1. Similar to the previous command, this changes the directory to `a_path` and then builds the
   specified `target_name` defined in the Makefile located in that directory. This allows you to
   target specific builds in different directories.
2. Notes: If you want to use this command in Makefiles, please use `$(MAKE)` instead of `make`. This
   is the more commonly used option.

#### 5) `make target_name VAR_NAME1="..." VAR_NAME2="..." ...`

1. This command builds the specified `target_name` while overriding or setting variables `VAR_NAME1`
   and `VAR_NAME2` to the specified values. These variables can be used in the Makefile to customize
   the build process or pass configuration options.
2. Notes: If you want to use this command in Makefiles, please use `$(MAKE)` instead of `make`. This
   is the more commonly used option.

#### 6) `make -C a_path target_name VAR_NAME1="..." VAR_NAME2="..." ...`

1. This command combines the previous concepts. It changes the directory to `a_path`, builds the
   specified `target_name`, and overrides or sets the variables `VAR_NAME1` and `VAR_NAME2` for that
   build. This allows for targeted builds in different directories with specific configurations.
2. Notes: If you want to use this command in Makefiles, please use `$(MAKE)` instead of `make`. This
   is the more commonly used option.

### How to Manage Libraries or Dependencies Your Project Denpends On

1. Add source code for dependencies: Include the source code of your dependencies in your project
   and build them from scratch.
2. Compile them into static or dynamic libraries: Compile the dependencies as either static
   libraries or dynamic libraries, depending on your project's needs.
3. Link against binaries (if no source code available): If you lack access to the source code, time
   to set them up, or prefer not to, linking against pre-built binaries is also an option.
4. Build from source if binaries aren't available: If binaries for your dependencies aren't
   available, you'll need to download and build their source code from scratch.
5. Include directories and libraries: Make sure to include the dependencies' header directories and
   library/link directories. Header directories contain the files required for inclusion in your
   code, while library directories contain the pre-built binary files for linking. Header files
   provide declarations, and library files contain definitions that link your code with these
   binaries.
6. Static (`.lib` or `.a`) vs dynamic libraries (`.dll` or `.so`): Linking with static libraries is
   faster than dynamic libraries because the C++ linker performs optimizations during static
   linking.
7. Import libraries (`xxxdll.lib` files): These files contain references to functions and symbols
   defined in the `xxx.dll` files, allowing linking at **compile time**, ensuring that the correct
   function signatures and addresses are used and allowing the linker to know where to find them at
   runtime.
8. Use relative paths: When building dependencies from scratch, use relative paths instead of
   absolute paths to ensure portability.
9. Header file inclusion: Use angle brackets (`<>`) to include header files if you’ve specified the
   paths for the compiler (compiler include paths). Otherwise, use quotes (`""`) for relative paths.
   The search order for quoted includes starts with relative paths, followed by the main `.cpp`
   files, and finally, the compiler include paths. It’s recommended to use angle brackets for
   external headers and quotes for project-specific headers. Prefer compiler include paths over
   relative paths to avoid common errors.
10. Visual Studio project and solution: In Visual Studio, a project contains the code, resources,
    and configuration needed to build an executable, library, or component. A solution acts as a
    container that groups multiple related projects, providing organizational structure for managing
    them.

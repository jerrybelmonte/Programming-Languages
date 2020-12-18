# Principles of Programming Languages

## Table of Contents
* [Introduction](#introduction)
* [Objective](#objective)
* [Functional vs Imperative Programming](#functional-vs-imperative-programming)
  - [Haskell vs C](#haskell-vs-c)
  - [Lists in Haskell](#lists-in-haskell)
  - [Algebraic Data Types](#algebraic-data-types)
  - [Turing Machine and Lambda Calculus](#turing-machine-and-lambda-calculus)
  - [Evaluation Strategies](#evaluation-strategies)
* [Memory Allocation](#memory-allocation)
  - [Dynamic Memory Allocation](#dynamic-memory-allocation)
  - [Binding Time](#binding-time)
* [Generators and Iterators](#generators-and-iterators)
* [Logic Programming](#logic-programming)
* [Generic Programming](#generic-programming)

## Introduction
Fundamental topics in the design and implementation of programming languages. 
Programing language paradigms. Comparison of languages in type systems, data 
types, control flow, subroutines, concurrency, and exception handling.

## Objective
Study the how's and why's of programming language design and implementation 
to a much greater level of detail than is possible in lower-level courses. 
Cover essential programming language concepts like binding time, type systems, 
abstraction mechanisms, reflection, recursion, memory management, lambda 
calculus, and message passing. Also, contrast different language paradigms 
(procedural, object-oriented, functional, logic, concurrent) and complete 
programming assignments in each. Particular emphasis will be placed on the 
functional programming paradigm, and its concerns of higher-order functions 
and immutable state.

## Functional vs Imperative Programming
* Loops vs. Recursion
  - Accumulating parameter 
  - Tail call optimization
* Algebraic Datatypes
  - Products
  - Co-Products
  - Type-Recursion
* Turing Machine & λ-Calculus
  - Theoretical foundations of imperative and functional programing paradigms
* Evaluation strategies
  - call-by-value
  - call-by-need and in particular lazy evaluation
* Programming languages comparison:
  - C: Classic imperative language
  - Haskell: Modern pure functional language
* Functions in Haskell that produce lists
* Right vs left folds
  - foldl vs. foldr

### Haskell vs C
* Basic Language Constructs in C & Haskell
  - Variables
    - Mutable/Immutable
  - Functions
    - Side effects
  - Conditionals
  - Loops
  - Recursion
* Loops vs. Recursion
  - Accumulating parameter 
  - Tail call optimization

[BasicLanguageConstructs in C](BasicLanguageConstructs/BasicLanguageConstructs.c)  
[BasicLanguageConstructs in Haskell](BasicLanguageConstructs/BasicLanguageConstructs.hs)

### Lists in Haskell
* Syntactic sugar
  - `[1, 2, 3] == 1:(2:(3:[]))`
* Constructors
  - **`:`**  "Cons"
  - **`[]`** "Nil"
* Functions consuming lists
  - **`sum`**
  - **`product`**
  - **`length`**
* Recursion patterns
  - **`foldr`**
* Functions in Haskell that produce lists
  - Right vs left folds
    - **`foldl`** vs. **`foldr`**

[FunctionsConsumingLists](FunctionsOnLists/FunctionsConsumingLists.hs)  
[FunctionsProducingLists](FunctionsOnLists/FunctionsProducingLists.hs)

### Algebraic Data Types
* User defined data types in Haskell
  - **`data`** keyword to define:
    - types
    - type constructors
    - data constructors
* Algebraic Data Types
  - Co-Product (disjunction, enumeration)
  - Product (conjunction, tuple, struct, record)
  - Type recursion
* Type classes
  - _Type-classes_ in Haskell are similar to _interfaces_ in other languages (e.g. Java).
  - **`class`** keyword to define a type-class and declare its methods
    - Example type classes: **`Show, Eq, Ord, Num, Foldable`**
  - **`instance`** keyword to declare a type an instance of a type-class
    - Example:
      - Make our own list data type foldable
      - Call **`sum, product, length`** on our own lists
* Trees in C and Haskell
  - Use algebraic data types to model trees in C and Haskell
* Examples:
  - Binary trees
  - Tree traversal
  - Tree sort

[AlgebraicDataTypes in Haskell](AlgebraicDataTypes/AlgebraicDataTypes.hs)  
[AlgebraicDataTypes in C](AlgebraicDataTypes/AlgebraicDataTypes.c)

### Turing Machine and Lambda Calculus
* Turing Machine
  - Motivation
  - Definition
  - Example
    - Running a Turing Program
* λ-Calculus
  - Motivation
  - Definition
    - Syntax
      * λ-Terms
        * Variables
        * Application
        * λ-Abstraction
    - Operational Semantics
      * α-conversion
      * β-reduction
  - Example
    - Evaluating a λ-Term
* Church–Turing Thesis
  - Computability

### Evaluation Strategies
* Normal form and Weak Head Normal Form (WHNF)
  - **Redex** := Left hand side of a reduction rule.
  - A λ-expression with no redex is said to be in **normal form**.
  - It is in **weak head normal form (WHNF)** if it has a λ-abstraction at the top level.
  - **Computation** := Reduction of a λ-expression to normal form (or WHNF)
* Evaluation strategies:
  - Applicative order := right-most/inner-most redex first
  - Call-by-value := like applicative order, but no reductions inside λ-abstractions
  - Normal order := left-most/outer-most redex first
  - Call-by-name := like normal order, but stop at WHNF (e.g. no reductions inside λ-abstractions, etc.)
  - Call-by-need := call-by-name + **memoization**
  - **Lazy evaluation** := An implementation of call-by-need with **thunks** used by Haskell. A **thunk** is an object in heap memory storing the state of the delayed evaluation of a function.
* λ-calculus is **confluent**: Church–Rosser theorem (1936)
  - i.e. (informally) the order of reduction steps doesn't matter, in particular any two reductions to normal form will reach equivalent normal forms.
  - However, some evaluation strategies might now find it at all or take a long time to do so.
* In general non-normalizing
* Step-By-Step examples evaluation in Haskell
  - Illustrate strategies, memoization, WHNF

## Memory Allocation
* Memory allocation
  - Static
  - Dynamic
    - Stack
    - Heap
* Binding time
* Programming Languages comparison:
  - C
    - **malloc/free**
  - C++
    - **new/delete**
    - STL Containers
  - C#
    - **new**/Garbage Collector
  - Haskell
    - *Thunks* (and other closures) are stored on the *heap* during lazy evaluation.
* Influence of lazy (and strict) evaluation on stack (and heap) usage in Haskell.

### Dynamic Memory Allocation
* Memory allocation
  - Static vs. dynamic
    - **stack** vs. **heap**
    - garbage collection
  - Static
    - fixed size during lifetime of a process
    - global variables
  - Stack
    - automatic
    - local variables
    - return addresses
    - fixed and limited size
  - Heap
    - for big data
    - for heavy items
    - C: malloc/free
    - C++: new/delete
    - C#: new/GC

### Binding Time
* Process Memory Layout
  - **stack**
    - stack frames
      * return address
      * arguments
      * **automatic local variables**
    - bound at *runtime* when *pushed on stack*
  - **heap**
    - **manually dynamically allocated memory**
    - bound at *runtime* when allocated (with *malloc*)
  - **bss** (uninitialized data) & **data** (initialized data)
    - **static varibales**
    - bound at *load time*
  - **text**
    - program code
* Compile, link, and run time
  1. C preprocessor
     - Source code file
       * hello.c
       * hello.cpp
  2. C Compiler
     - Preprocessed code file
       * hello.i
  3. Assembler
     - Assembly code file
       * hello.s
  4. Linker/link editor
     - Object code file
       * hello.o
     - Relocation object code information
     - Other objects file/modules
     - Library files
  5. Executable code
     - hello
     - hello.exe
  6. Stored in secondary storage such as hard disk (hdd) as an executable image
  7. Loader
     - when running/execute the program (a process)
     - Run time objects/modules/libraries (deferred linking)
  8. Process Address Space
  9. Primary memory e.g. RAM

### Haskell Folds, Strictness, & Stack Usage
* Lazy evaluation on lists
* Folds vs strictness

## Generators and Iterators


## Logic Programming


## Generic Programming

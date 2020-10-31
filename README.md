# Principles of Programming Languages

## Table of Contents
* [Introduction](#introduction)
* [Objective](#objective)
* [Functional vs Imperative Programming](#functional-vs-imperative-programming)
  - [Haskell vs C](#haskell-vs-c)
  - [Lists in Haskell](#lists-in-haskell)
  - [Algebraic Data Types](#algebraic-data-types)
* [Memory Allocation](#memory-allocation)
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

[AlgebraicDataTypes in Haskell](DataTypes/AlgebraicDataTypes.hs)  
[AlgebraicDataTypes in C](DataTypes/AlgebraicDataTypes.c)

## Memory Allocation


## Generators and Iterators


## Logic Programming


## Generic Programming

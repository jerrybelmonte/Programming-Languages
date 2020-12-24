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
  - [Haskell Folds, Strictness, and Stack Usage](#haskell-folds-strictness-and-stack-usage)
* [Generators and Iterators](#generators-and-iterators)
  - [Coroutines, Generators, and Iterators](#coroutines-generators-and-iterators)
  - [C# and LINQ](#c#-and-linq)
* [Logic Programming](#logic-programming)
  - [Introduction to Prolog](#introduction-to-prolog)
  - [SLD Resolution](#sld-resolution)
  - [Negation As Failure](#negation-as-failure)
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
      - λ-Terms
        - Variables
        - Application
        - λ-Abstraction
    - Operational Semantics
      - α-conversion
      - β-reduction
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
  - Dynamic
    - Stack
      - automatic
      - local variables
      - return addresses
      - fixed and limited size
      - `pop`
      - `push`
    - Heap
      - for big data
      - for heavy items
      - **C: malloc/free**
      - **C++: new/delete**
      - **C#: new/GC**

### Binding Time
* Process Memory Layout
  - **stack**
    - stack frames
      - return address
      - arguments
      - **automatic local variables**
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
       - hello.c
       - hello.cpp
  2. C Compiler
     - Preprocessed code file
       - hello.i
  3. Assembler
     - Assembly code file
       - hello.s
  4. Linker/link editor
     - Object code file
       - hello.o
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

### Haskell Folds, Strictness, and Stack Usage
* Lazy evaluation on lists
  - Right fold evaluation example
    ```haskell
    foldr _ z [] = z
    foldr f z (x:xs) = x `f` foldr f z xs

    (++) []     ys = ys
    (++) (x:xs) ys = x : (xs ++ ys)

    head (x:xs) = x

    => head (foldr (++) [] [[], [1], ...])
    => head ([] ++ foldr (++) [] [[1], ...])
    => head (foldr (++) [] [[1], ...])
    => head ([1] ++ foldr (++) [] [...])
    => head (1 : ([] ++ foldr (++) [] [...]))
    => 1
    ```
  - More examples of functions that process lists lazily
    ```haskell
    foldr _ z [] = z
    foldr f z (x:xs) = x `f` foldr f z xs

    -- scanl works just like foldl, but outputs a list
    -- of all intermediate values of the accumulating parameter
    scanl _ z [] = [z]
    scanl f z (x:xs) = z : scanl f (z `f` x) xs

    -- combine two lists element-wise with a binary operator
    zipWith f (x:xs) (y:ys) = (x `f` y) : (zipWith f xs ys)
    zipWith _ _ _ = []
    ```
  - Examples of infinite lists
    ```haskell
    -- An infinite list of ones [1,1,1,...]
    ones = 1 : ones
    
    -- The infinite list of all fibonacci numbers [f0,f1,...]
    -- f0 = 0, fn+2 = 1 + sum([fk=0,...,fk=n])
    fibs' = 0 : scanl (+) 1 fibs'

    -- The infinite list of all prime numbers [2,3,5,7,11,13,...]
    import Data.List.Ordered(minus)

    primes = head <$> scanl minus [2..] [[p, p+p..] | p <- primes]
    ```
* Folds vs strictness
  - Right fold evaluation example
    ```haskell
    foldr _ z [] = z
    foldr f z (x:xs) = x `f` foldr f z xs

    => foldr (+) 0 [1, 2, 3]
    => 1 + foldr (+) 0 [2, 3]
    => 1 + (2 + foldr (+) 0 [3])
    => 1 + (2 + (3 + foldr (+) 0 []))
    => 1 + (2 + (3 + 0))
    => 1 + (2 + 3)
    => 1 + 5
    => 6
    ```
  - Left fold evaluation example
    ```haskell
    foldl _ z [] = z
    foldl f z (x:xs) = foldl f (z `f` x) xs

    => foldl (+)    0         [1, 2, 3]
    => foldl (+)   (0 + 1)       [2, 3]
    => foldl (+)  ((0 + 1) + 2)     [3]
    => foldl (+) (((0 + 1) + 2) + 3) []
    =>           (((0 + 1) + 2) + 3)
    =>            ((1 + 2) + 3)
    =>              3 + 3
    =>              6
    ```
    **Definition**: `a 'seq' b` evaluates `a` to WHNF and returns the value of `b`.
    ```haskell
    foldl' _ z [] = z
    foldl' f z (x:xs) = z' `seq` foldl' f z' xs
                          where z' = z `f` x
    
    => foldl' (+) 0 [1, 2, 3] 
    => foldl' (+) 1 [2, 3]
    => foldl' (+) 3 [3]
    => foldl' (+) 6 []
    =>            6
    ```

## Generators and Iterators
* Generators/Enumerators
* Iterables/Enumerables
* Programing Language comparison:
  - C#/LINQ & Python
    - **yield** keyword
  - Haskell
    - Lazy lists

### Coroutines, Generators, and Iterators
* Motivation: C filters & Unix pipeline
  - Generators & iterators by example

    As a first example let's implement a modular algorithm that computes the expression: $$\sum_{k=0}^{9} k^{2} = 285$$
  
    The problem can be decomposed into three components that can be implented separately:
    - **generate**  the generation of the sequence 0,1,...,9
    - **square**    the calculation of the squares k |-> k^2
    - **sum**       the computation of the $\sum$
  
    We'd like to combine these components in such a way, that we can _pipeline_ elements from one component to the next _one-by-one_:
    - **generate** ~> **square** ~> **sum** ~> 285
* **`yield`** keyword in C# and Python
  - [PipeliningWithPython](PipeliningWithGenerators/pipeline.py)
  - [PipeliningWithCsharp](PipeliningWithGenerators/Pipeline.cs)
* Iterators (Enumerators) & Generators
  - **Defintion (Iterator)**: An **iterator** (or *enumerator*) is an *object* used to traverse containers (e.g. arrays or lists). It *enumerates* the elements as a *sequence* (or*stream*).
  - **Defintion (Generator)**: A **generators** is *coroutine* that *yields* a *sequence* of values. Unlike *subroutines*, which `return` one value on exit, a **generator** can `yield` multiple values without terminating. **Generators** can  be used to implement *iterators*.
* Coroutines
  - **Defintion (Coroutine)**: A *coroutine* is a generalization of a *subroutine*: A *subroutine* has *one* entry point and multiple exit points. A **coroutine** has *multiple* entry and multiple exit points.

### C# and LINQ
* Motivation: List comprehension & SQL
* Iterators & Generators in LINQ
* Functional construction of XML from LINQ query results
* Comparison with Haskell lazy lists
* C#/LINQ Motivation
  - Mathematic set builder notation or set comprehension  
    $\{2 \cdot a | a \in A \land a \lt 3\}$
  - Haskell list comprehension
    ```haskell
    [2*a | a<-as, a>3]
    ```
  - SQL (Structured Query Language)
    ```sql
    SELECT 2 * a FROM as WHERE a > 3
    ```
  - LINQ(Language Integrated Query)
    - LINQ query syntax
      ```csharp 
      from a in as where a > 3 select 2 * a
      ```
    - LINQ fluent syntax
      ```csharp
      as.Where(a => a > 3).Select(a => 2 * a)
      ```
* LINQ Cheat Sheet
  - Filtering
    ```csharp
    // Query Syntax
    var col = from o in Orders
              where o.CustomerID == 84
              select o;
    
    // Fluent Syntax
    var col2 = Orders.Where(o => o.CustomerID == 84);
    ```
  - Return Anonymous Type
    ```csharp
    // Query Syntax
    var col = from o in orders
              select new 
              {
                OrderID = o.OrderID,
                Cost = o.Cost
              };
    
    // Fluent Syntax
    var col2 = orders.Select(0 => new 
          {
            OrderID = o.OrderID,
            Cost = o.Cost
          }
        );
    ```
  - Ordering
    ```csharp
    // Query Syntax
    var col = from o in orders
              orderby o.Cost ascending
              select o;

    // Fluent Syntax
    var col2 = orders.OrderBy(o => o.Cost);

    // Query Syntax
    var col3 = from o in orders
               orderby o.Cost descending
               select o;

    // Fluent Syntax
    var col4 = orders.OrderByDescending(o => o.Cost);

    // Query Syntax
    var col9 = from o in orders
               orderby o.CustomerID, o.Cost descending
               select o;
    // returns same results as above
    var col5 = from o in orders
               orderby o.Cost descending
               orderby o.CustomerID
               select o;
    // NOTE the ordering of the orderby's

    // Fluent Syntax
    var col6 = orders.OrderBy(o => o.CustomerID).
              ThenByDescending(o => o.Cost);
    ```
  - Joining
    ```csharp
    // Query Syntax
    var col = from c in customers
              join o in orders on
              c.CustomerID equals o.CustomerID
              select new 
              {
                c.CustomerID,
                c.Name,
                o.OrderID,
                o.Cost
              };

    // Fluent Syntax
    var col2 = customers.Join(orders, 
        c => c.CustomerID, o => o.CustomerID, 
        (c, o) => new 
          {
            c.CustomerID,
            c.Name,
            o.OrderID,
            o.Cost
          } 
        );
    ```
  - Grouping
    ```csharp
    // Query Syntax
    var OrderCounts = from o in orders
            group o by o.CustomerID into g
            select new 
            {
              CustomerID = g.Key,
              TotalOrders = g.Count()
            };

    // Fluent Syntax
    var OrderCounts1 = orders.GroupBy(
            o => o.CustomerID).
            Select(g => new 
            {
              CustomerID = g.Key,
              TotalOrders = g.Count()
            });
    // NOTE: The grouping's key has the same type as the grouping's value.
    // E.g. in the above example the grouping's key is an int because o.CustomerID is an int.
    ```
  - Paging (using Skip & Take)
    ```csharp
    // Query Syntax
    // select top 3
    var col = (from o in orders 
               where o.CustomerID == 84 
               select o).Take(3);

    // Fluent Syntax
    var col2 = orders.Where(
               o => o.CustomerID == 84
               ).Take(3);
    
    // Query Syntax
    // skip first 2 and return the 2 after
    var col3 = (from o in orders 
                where o.CustomerID == 84 
                orderby o.Cost 
                select o).Skip(2).Take(2);
    
    // Fluent Syntax
    var col3 = orders.Where(
               o => o.CustomerID == 84
               ).OrderBy(o => o.Cost).
               Skip(2).Take(2);
    ```
  - Element Operators (Single, Last, First, ElementAt, Defaults)
    ```csharp
    // Query Syntax
    // throws exeption if no elements
    var cust = (from c in customers
                where c.CustomerID == 84
                select c).Single();

    // Fluent Syntax
    var cust1 = customers.Single(
                c => c.CustomerID == 84);
    
    // Query Syntax
    // returns null if no elements
    var cust = (from c in customers
                where c.CustomerID == 84
                select c).SingleOrDefault();

    // Fluent Syntax
    var cust1 = customers.SingleOrDefault(
                c => c.CustomerID == 84);

    // Query Syntax
    // returns a new customer instance if no elements
    var cust = (from c in customers
                where c.CustomerID == 85
                select c).DefaultIfEmpty(
                  new Customer()).Single();

    // Fluent Syntax
    var cust1 = customers.Where(
                c => c.CustomerID == 85
                ).DefaultIfEmpty(new Customer()).Single();

    // Query Syntax
    // First, Last, and ElementAt used in same way
    var cust4 = (from o in orders
                 where o.CustomerID == 84
                 orderby o.Cost
                 select o).Last();

    // Fluent Syntax
    var cust5 = orders.Where(
                o => o.CustomerID == 84).
                OrderBy(o => o.Cost).Last();

    // Query Syntax
    // returns 0 if no elements
    var i = (from c in customers
             where c.CustomerID == 85
             select c.CustomerID).SingleOrDefault();

    // Fluent Syntax
    var j = customers.Where(
            c => c.CustomerID == 85).
            Select(o => o.CustomerID).SingleOrDefault();
    ```
  - Conversions
    - **`ToArray`**
      ```csharp
      string[] names = (from c in customers 
                        select c.Name).ToArray();
      ```
    - **`ToDictionary`**
      ```csharp
      Dictionary<int, Customer> col = customers.ToDictionary(c => c.CustomerID);

      Dictionary<string, double> customerOrdersWithMaxCost = (from oc in
              
              (from o in orders
              join n in customers on o.CustomerID equals c.CustomerID
              select new {c.Name, o.Cost})
              
              group oc by oc.Name into g
              select g).ToDictionary(g => g.key, g => g.Max(oc => oc.Cost));
      ```
    - **`ToList`**
      ```csharp
      List<Order> ordersOver10 = (from o in orders 
              where o.Cost > 10
              orderby o.Cost).ToList();
      ```
    - **`ToLookup`**
      ```csharp
      ILookup<int, string> customerLookup = 
              customers.ToLookup(c => c.CustomerID, c => c.Name);
      ```

## Logic Programming
* Introduction to Logic Programming with Prolog
  - Example Prolog programs
  - First-order logic
    - Horn clauses
  - SLD resolution
    - Cut
    - Negation as failure
* Proof that Prolog is Turing complete

### Introduction To Prolog
* Prolog is a logic programming language based on 1st order predicate logic.
* A good introduction to the language and an online REPL can be found at https://swish.swi-prolog.org
* Prolog
  - Prolog is a **logic** programming langauge based on 1st order predicate logic.
  - The name **Prolog** is short for *"**Pro**graming in **log**ic"*
  - **Syntax**: A pure Prolog program consists of **facts** and **rules**:
    - **Facts** are terms like `parent(bob, ada).` composed of
      - **`atoms`** like `bob/0`, and
      - **`functors`** like `parent/2` which is a functor of arity 2, meaning it has 2 arguments.
    - **Rules** are terms like `brother(X, Y) :- male(X), sibling(X, Y).`
      - where the terms may contain **`variables`** like X or Y, combined with
      - logical implication `:-` **"if"**, and
      - logical conjunction `,` **"and"**.
    - That's it. Everything elses is syntactic sugar like `[1, 2, 3]` for terms that represent lists, etc.
    - ...actually there's one more thing called the **cut** `!` that we'll learn a bit later...
* Syntax & Semantics
  - **Syntax**:  
  Which character sequences are valid programs?  
  *"Does it compile?"*
  - **Semantics**: 
    - **Denotational Semantics**:  
    What does a program mean?  
    *"What is it modeling?"*
    - **Operational Semantics**:  
    What does a program do?  
    *"Which instructions does it execute when it runs?"*
  - **Soundness**: A denoational semantics is **sound** wrt. an operational semantics, if the operational evaludation of expressions preserves their denotational meaning.
* Denotational Semantics of Prolog
  - A prolog rule, e.g.  
  `aunt(X, Y) :- female(X), parent(Z, Y), sibling(X, Z).`  
  is just a different syntax for a *1st order predicate logic* formula:  
  for every X.for every Y.aunt(X, Y) <- female(X) AND there exists Z.parent(Z, Y) AND sibling(X, Z)  
  Using the definition of the implication A <- B is defined A OR NOT B, and De Morgan's laws NOT(A AND B) is defined as NOT A OR NOT B and NOT there exists X.p(X) is defined as for every X.NOT p(X) we can write this as  
  for every X.for every Y.for every Z.aunt(X, Y) OR NOT female(X) OR NOT parent(Z, Y) OR NOT sibling(X, Z).
  - A formula in the latter form, i.e. a disjuntion of literals with exactly one positive literal, is called a **definite clause**.
  - *A prolog program is a set of **definite clauses**.*
* Family Tree example
  ```prolog
  male(tom).
  male(bob).
  male(jim).
  male(pat).
  female(ada).
  female(michelle).

  parent(tom, bob).
  parent(bob, pat).
  parent(bob, ada).
  parent(pat, jim).
  parent(ada, michelle).

  sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
  brother(X, Y) :- male(X), sibling(X, Y).
  aunt(X, Y)    :- female(X), parent(Z, Y), sibling(X, Z).

  ancestor(X, Y) :- parent(X, Y).
  ancestor(X, Y) :- parent(Z, Y), ancestor(X, Z).
  ```

### SLD Resolution
* The denotation semantics of Prolog is **SLD resolution**:
  - **S** - Selective
  - **L** - Linear
  - **D** - Definite clause
* SLD resolution is a depth first recursive tree search algorithm.
* The result of SLD resolution is either **failure** or a **linear proof** with **variable assignments**.
- [Haskell type inference](PrologExamples/Haskell_type_inference.pl)
* Operational Semantics of Prolog
  - Prolog's **SLD-resolution** algorithm is a *depth first tree search* that works as follows:
    - Select the first literal of the goal clause
      - Find the head of the first rule in the program that can be unified with it, i.e. is equal to it where
        - functors and atoms match exactly and
        - variables are bound to matching values.
      - Substitute the selected literal with the body of the rule.
    - Repeat the above until either
      - the goal clause is empty:
        - then *report success* and output the variable assignments, or
      - no matching head can be found:
        - then backtrack and try the next matching rule.
    - *Report failure.*
  - SLD-tree example
    ```prolog
    p(X,Y) :- q(X,Z), r(Z,Y).
    p(X,X) :- s(X).
    q(X,b).
    q(b,a).
    q(X,a) :- r(a,X).
    r(b,a).
    s(X) :- t(X,a).
    s(X) :- t(X,b).
    s(X) :- t(X,X).
    t(a,b).
    t(b,a).
    ?- p(X, X).
    ```

### Negation As Failure
* Lists in Prolog
  - Quicksort in Prolog
* Cut
  - Pruning the search tree
  - Green cut and red cut
  - Negation as failure
- [Quicksort - Selfmade Lists](PrologExamples/Quicksort_Selfmade_Lists.pl)
- [Quicksort - Prolog List Syntax](PrologExamples/Quicksort_Prolog_List_Syntax.pl)
- [Quicksort - Prolog List Syntax with Cut](PrologExamples/Quicksort_Prolog_List_Syntax_with_Cut.pl)
- [Negation](PrologExamples/Negation.pl)
- [It's a tie](PrologExamples/Its_a_tie.pl)

## Generic Programming
* Introduction to Generic programming
* Definition (Generic programming)
  - **Lift algorithms and data structures from concrete examples to their most general and abstract form.** (Bjarne Stroustrup)
* Programming languages comparison:
  - C
    - Macros
    - **`void *`**
    - (C11 Generic Switch)
  - C++
    - Templates
  - C#
    - Type parameters and Interfaces
  - Python
    - Duck-Typing
  - Haskell
    - Parametric polymorphism
      - Type parameters
    - Ad-hoc polymorphism
      - Type classes
- Algorithms can be written in terms of **type parameters** instead of specific types.
- Such an implementation of an algorithm can then be instantiated for many specific types.
- This is known as **generics** in C#, Java, Swift, etc. and as **polymorphism** in functional languages like Haskell.
- max functions in Haskell & Python
  ```haskell
  -- Haskell
  max :: Ord a => a -> a -> a
  max a b = if a > b then a else b
  ```
  ```python
  # Python
  def max(a, b):
    if a > b:
      return a
    else:
      return b
  ```
- MAX macro in C
  ```c
  // The classic C MAX macro
  #define MAX1(a, b) (((a) > (b)) ? (a) : (b))

  // A better C MAX macro using local variables
  #define MAX2(a, b) ({ \
      typeof(a) _a = (a); \
      typeof(b) _b = (b); \
      (_a > _b) ? _a : _b; })
  
  // MAX macro with C11 _Generic selection
  #define MAX3(a, b) _Generic((a), \
      int:    max_int, \
      double: max_double, \
      char *: max_string)((a), (b))
  
  int max_int(int a, int b) { return (a > b) ? a : b; }

  int max_double(double a, double b) { return (a > b) ? a : b; }

  const char *max_string(const char *s, const char *t) {
    return (strcmp(s, t) > 0) ? s : t;
  }
  ```
- MAX function with template in C++ and type parameter in C#
  ```c++
  // max function template in C++
  template<typename T>
  const T& max(const T& a, const T& b) {
    return (a > b) ? a : b;
  }
  ```
  ```csharp
  // generic Max function in C#
  public static T Max<T>(T x, T y) where T : IComparable<T>
  {
    return (x.CompareTo(y) > 0) ? x : y;
  }
  ```
- Type parameters in Haskell and C#
  |                 | Haskell       | C#                            |
  | :-------------- | :-----------: | :---------------------------: |
  | Type variable   | `a`           | `T`                           |
  | List            | `[a]`         | `List<T>`                     |
  | Optional value  | `Maybe a`     | `T?`                          |
  | Type constraint | `Ord a =>...` | `...where T : IComparable<T>` |
- Parametric vs ad-hoc polymorphism in Haskell
  - **Definition (Parametric polymorphism)**: One implementation works for *all* types.  
  The function `map` e.g. works for lists of elements of any type:
    ```haskell
    map :: (a -> b) -> [a] -> [b]
    map f [] = []
    map f (x:xs) = f x : map f xs
    ```
  - **Definition (Ad-hoc polymorphism)**: One implementation works for all types that are instances of some **type class**.  
  E.g. there's only one implementation of `max` for all types that are instances of `Ord`. However, there's a specific implementation of `>` for each instance of `Ord`.
    ```haskell
    max :: Ord a => a -> a -> a
    max a b = if a > b then a else b
    ```
- Language comparison (i)
  | Language | Paradigm | Execution | Syntax | Type-System | Language |
  | :------- | :------: | :-------: | :----: | :---------: | :------: |
  | C | Imperative **not OO** | Compiled to native code | C-like | Static | C |
  | C++ | Imperative OO | Compiled to native code | C-like | Static | C++ |
  | C# | Imperative OO | Compiled to CIL | C-like | Static | C# |
  | Python | Imperative OO | Interpreted | Terse - Layout | Dynamic "Duck typing" | Python |
  | Haskell | Purely functional | Compiled or interpreted | Very terse - Layout - Currying | Static with type inference | Haskell |
- Language comparison (ii)
  | Language | Generics | Memory Management | Evaluation Strategy | Language |
  | :------- | :------: | :---------------: | :-----------------: | :------: |
  | C | Very limited Macros / `void *` | Manual `malloc` / `free` | Strict | C |
  | C++ | Templates | Manual `new`/`delete` RAII (STL Containers) | Strict | C++ |
  | C# | Type parameters Interfaces | Allocation: `new` Deallocation: GC | Strict | C# |
  | Python | No such concept | GC | Strict | Python |
  | Haskell | Polymorphism Parametric and ad-hoc | GC | Lazy | Haskell |
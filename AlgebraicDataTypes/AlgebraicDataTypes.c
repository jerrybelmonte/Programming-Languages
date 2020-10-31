// AlgebraicDataTypes.c
// C vs Haskell
// To contrast C and Haskell see: AlgebraicDataTypes.hs
#include <stdio.h>
#include <stdlib.h>

// Define the list data type
typedef struct Node *List;

struct Node
{
    int value;
    List next;
};

// Construct a list from an element and another list
List cons(int a, List as)
{
    List p = malloc(sizeof(struct Node));
    p->value = a;
    p->next = as;
    return p;
}

// Construct an empty list
const List NIL = NULL;

// Deconstruct a list
void delete (List p)
{
    while (p)
    {
        List t = p->next;
        free(p);
        p = t;
    }
}

// Sum a list recursively (functionally)
int sum1(List p)
{
    return p ? p->value + sum1(p->next) : 0;
}

// Sum a list with a while loop (imperatively)
int sum2(List p)
{
    int s = 0;
    while (p)
    {
        s += p->value;
        p = p->next;
    }

    return s;
}

// Define a binary tree data type
typedef struct TreeNode *Tree;

struct TreeNode
{
    Tree left;
    int value;
    Tree right;
};

// Insert an element into a sorted tree
Tree insert(int a, Tree p)
{
    if (p)
    {
        if (a <= p->value)
        {
            p->left = insert(a, p->left);
        }
        else
        {
            p->right = insert(a, p->right);
        }
    }
    else
    {
        p = malloc(sizeof(struct TreeNode));
        p->left = NULL;
        p->value = a;
        p->right = NULL;
    }

    return p;
}

// Traverse a tree in order
void inOrder(Tree p)
{
    if (p)
    {
        inOrder(p->left);
        printf("%d ", p->value);
        inOrder(p->right);
    }
}

// An example sequence
int data[] = {4, 65, 2, -31, 0, 99, 2, 83, 782, 1};

// A simple test suite
int testAlgebraicDataTypes()
{
    puts("Test Algebraic Data Types");

    // construct a list
    List list123 = cons(1, cons(2, cons(3, NIL)));

    printf("sum1 [1,2,3] = %d\n", sum1(list123));
    printf("sum2 [1,2,3] = %d\n", sum2(list123));

    //deconstruct the list
    delete (list123);

    Tree p = NULL;

    for (int i = 0; i < sizeof(data) / sizeof(int); ++i)
    {
        p = insert(data[i], p);
    }

    inOrder(p);

    puts("");

    return 0;
}

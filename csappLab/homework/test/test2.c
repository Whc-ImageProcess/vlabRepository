#include <stdio.h>

typedef enum {N_LEAF, N_INTERNAL} nodetype_t;

typedef struct node_t
{
    nodetype_t type;
    union
    {
        struct
        {
            struct node_t *left;
            struct node_t *right;
        }internal;
        double data[2];
    }info;
}node_t;

void test()
{
    printf("sizeof(nodetype_t) = %ld\n", sizeof(nodetype_t));
    node_t node;
    node.info.internal.left = NULL;
    node.info.internal.right = NULL;
    printf("node.info.data[1] = %lf\n", node.info.data[1]);
}

void main()
{
    test();
}
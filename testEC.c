//
// Created by james on 5/27/2021.
//

#include "types.h"
#include "user.h"

// Prevent this function from being optimized, which might give it closed form
#pragma GCC push_options
#pragma GCC optimize ("O0")
static int
recurse(int n)
{
    if(n == 0)
        return 0;
    return n + recurse(n - 1);
}
#pragma GCC pop_options

int
main(int argc, char *argv[])
{
    int n, m;

    if(argc != 2){
        printf(1, "Usage: %s levels\n", argv[0]);
        exit();
    }

    n = atoi(argv[1]);
    printf(1, "Lab 3: Recursing %d levels\n", n);
    m = recurse(n);
    printf(1, "Lab 3: Yielded a value of %d\n", m);
    exit();
}
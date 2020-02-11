#include <stdio.h>

unsigned int target_function(int n)
{
    int a,b,c,r;

    a = 12;
    b = 56;
    c = 127;

    r = a + b + c + n;

    return r;
}

int main(int argc, char* argv[])
{
    unsigned int n = target_function(argc);

    printf("n=%u\n", n);

    return 0;
}

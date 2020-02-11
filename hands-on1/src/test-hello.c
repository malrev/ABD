#include <stdio.h>

void target_function(void)
{
    char* msg = "hello world";
    printf("%s\n", msg);
}

int main(int argc, char* argv[])
{
    target_function();
    return 0;
}

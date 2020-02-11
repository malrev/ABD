#include <stdio.h>

unsigned int target_function(int n)
{
    if(n % 2 == 0)
        return 0;
    else
        return 1;
}

int main(int argc, char* argv[])
{
  unsigned int n = target_function(argc);

  printf("n=%u\n", n);

  return 0;
}

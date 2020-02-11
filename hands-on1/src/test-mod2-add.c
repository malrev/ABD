#include <stdio.h>

int target_function(int n)
{
    int a, b;

    a = 0xdeadbeef;
    b = 0x8badf00d;

    int c = a + b;
    int d = a - b;
    int e = c + d + n;

    if(e % 2 == 0){
        return 0;
    }else{
        return 1;
    }
}

int main(int argc, char* argv[])
{
  int n = target_function(argc);
  printf("n=%d\n", n);
  return n;
}

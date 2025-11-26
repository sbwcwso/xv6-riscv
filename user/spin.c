#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"


#define N  10

int main(void)
{
  int i = 0;
  int pid;

  char *args[] = { 0 };

  pid = fork();
  if(pid < 0)
    exit(1);
  if(pid == 0)
    exec("spin-child", args);

  for(;;)
    i++;

  return 0;
}

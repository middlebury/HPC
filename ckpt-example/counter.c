// A simple counter

#include <stdio.h>
#include <unistd.h>

// Unsed array to use enough memory to prevent dmtcp error mesage
int bigarray[10000];

int main(void) {
  unsigned long ii = 0;
  while (1) {
    printf("%lu ", ii);
    ii = ii + 1;
    sleep(1);
    fflush(stdout);
  }
}


#include <stdio.h>
#include <stdlib.h>

int main() {
    int* a;
    int b, c;
    b = 5;
    c = 10;
    a = malloc(4 * 100000);
    a[b] = c;
    return 0;
}
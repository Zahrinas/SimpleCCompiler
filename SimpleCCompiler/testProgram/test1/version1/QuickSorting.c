#include <stdio.h>
#include <stdlib.h>


void Quicksort(int* a, int low, int high) {

    if (low >= high) {
        return;
    }

    int key = a[low];

    int i = low;
    int j = high;

    while (i < j) {

        while (i < j && a[j] >= key) {
            j--;
        }

        a[i] = a[j];

        while (i < j && a[i] <= key) {
            i++;
        }

        a[j] = a[i];
    }

    a[i] = key;

    Quicksort(a, low, i - 1);
    Quicksort(a, i + 1, high);
}


int main() {

    int N;

    scanf("%d", &N);

    int a[100000];

    for (int i = 0; i < N; i++) {
        scanf("%d", &a[i]);
    }

    Quicksort(a, 0, N - 1);

    for (int i = 0; i < N; i++) {
        printf("%d\n", a[i]);
    }
    return 0;
}

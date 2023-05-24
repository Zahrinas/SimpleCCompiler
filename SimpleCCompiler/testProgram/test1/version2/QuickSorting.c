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

    if (N < 0 || N > 10000) {
        printf("Invalid input: N should be between 0 and 10000.\n");
        exit(1);
    }

    int* a = malloc(sizeof(int)*100000);

    for (int i = 0; i < N; i++) {
        scanf("%d", &a[i]);

        if (a[i] <= -10000 || a[i] >= 10000) {
            printf("Invalid input: each integer should be between -10000 and 10000.\n");
            exit(1);
        }
    }

    Quicksort(a, 0, N - 1);

    for (int i = 0; i < N; i++) {
        printf("%d\n", a[i]);
    }
    return 0;
}

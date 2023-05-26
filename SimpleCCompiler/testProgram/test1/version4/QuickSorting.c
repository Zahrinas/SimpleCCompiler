#include <stdio.h>
#include <stdlib.h>


void Quicksort(int* a, int low, int high) {

    if (low >= high) {
        return;
    }

    int key;
    key = a[low];

    int i;
    i = low;
    int j;
    j = high;

    label1:

        if (i < j) {

        label2:
            if (i < j && a[j] >= key) {
                j = j - 1;
                goto label2;

            }

            a[i] = a[j];

        label3:
            if (i < j && a[i] <= key) {
                i = i + 1;
                goto label3;
            }   

            a[j] = a[i];

            goto label1;
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
    int i;
    i = 0;
    label4:
        if (i < N) {

            scanf("%d", &a[i]);

            if (a[i] <= -10000 || a[i] >= 10000) {
                printf("Invalid input: each integer should be between -10000 and 10000.\n");
                exit(1);
            }

            i = i + 1;

            goto label4;

        }

    Quicksort(a, 0, N - 1);

    i = 0;
    label5:

        if ( i < N) {
            printf("%d\n", a[i]);
            i = i + 1;
            goto label5;
        }
    return 0;
}

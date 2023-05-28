


void Quicksort(int *a, int low, int high) {
    if (low >= high) {
        return;
    }

    int key, i, j;
    key = a[low];
    i = low;
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

    int N, i;

    scanf("%d", &N);

    int *a = malloc(400000);

    i = 0;
label1:
    if (i < N) {
        scanf("%d", &a[i]);
        i = i + 1;
        goto label1;
    }

    Quicksort(a, 0, N - 1);

    i = 0;
label2:
    if (i < N) {
        printf("%d\n", a[i]);
        i = i + 1;
        goto label2;
    }

    return 0;
}

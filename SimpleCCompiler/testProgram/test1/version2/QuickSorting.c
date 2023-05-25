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

    int N, i;

    scanf("%d", &N);

    int* a = malloc(sizeof(int)*100000);
	
	i = 0;
	label1:
		if(i < N){
			scanf("%d", &a[i]);
			i++;
			goto label1;
		}

    Quicksort(a, 0, N - 1);

	i = 0;
	label2:
		if(i < N){
        	printf("%d\n", a[i]);
			i++;
			goto label2;
		}
	
    return 0;
}

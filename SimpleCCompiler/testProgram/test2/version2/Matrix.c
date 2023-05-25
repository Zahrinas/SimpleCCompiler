#include<stdio.h>
#include <stdlib.h>

int main() {
    int RowA, RowB, RowC = 0;
    int ColA, ColB, ColC = 0;
    int* DataA = malloc(sizeof(int) * 625);
    int* DataB = malloc(sizeof(int) * 625);
    int* DataC = malloc(sizeof(int) * 625);



    scanf("%d %d", &RowA, &ColA);
    for (int i = 0; i < RowA; i++) {
        for (int j = 0; j < ColA; j++) {
            scanf("%d", &DataA[i * ColA + j]); 
        }
    }
    scanf("%d %d", &RowB, &ColB);
    for (int i = 0; i < RowB; i++) {
        for (int j = 0; j < ColB; j++) {
            scanf("%d", &DataB[i * ColB + j]); 
        }
    }

    if (ColA != RowB) {
        printf("Incompatible Dimensions\n");
    }
    else {
        RowC = RowA;
        ColC = ColB;
        for (int i = 0; i < RowC; i++) {
            for (int j = 0; j < ColC; j++) {
                DataC[i * ColC + j] = 0; 
                for (int k = 0; k < ColA; k++) {
                    DataC[i * ColC + j] = DataC[i * ColC + j] + DataA[i * ColA + k] * DataB[k * ColB + j];
                }
            }
        }
        for (int i = 0; i < RowC; i++) {
            for (int j = 0; j < ColC; j++) {
                printf("%10d", DataC[i * ColC + j]); 
            }
            printf("\n");
        }
    }
    return 0;
}

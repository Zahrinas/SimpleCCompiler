
#include <stdio.h>


int main() {
    int RowA, RowB, RowC = 0;
    int ColA, ColB, ColC = 0;
    int DataA[25][25] = { 0 };
    int DataB[25][25] = { 0 };
    int DataC[25][25] = { 0 };


    scanf("%d %d", &RowA, &ColA);
    for (int i = 0; i < RowA; i++) { 
        for (int j = 0; j < ColA; j++) {
            scanf("%d", &DataA[i][j]); 
        }
    }
    scanf("%d %d", &RowB, &ColB);
    for (int i = 0; i < RowB; i++) { 
        for (int j = 0; j < ColB; j++) { 
            scanf("%d", &DataB[i][j]); 
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
                DataC[i][j] = 0; 
                for (int k = 0; k < ColA; k++) { 
                    DataC[i][j] = DataC[i][j] + DataA[i][k] * DataB[k][j]; 
                }
            }
        }
        for (int i = 0; i < RowC; i++) {
            for (int j = 0; j < ColC; j++) { 
                printf("%10d", DataC[i][j]);
            }
            printf("\n"); 
        }
    }
    return 0; 
}

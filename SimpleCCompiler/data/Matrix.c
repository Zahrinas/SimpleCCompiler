int main() {
    int RowA;
    int RowB;
    int RowC;
    int ColA;
    int ColB;
    int ColC;
    RowA = 0;
    RowB = 0;
    RowC = 0;
    ColA = 0;
    ColB = 0;
    ColC = 0;

    int * DataA;
    int * DataB;
    int * DataC;
	DataA = malloc(5000);
    DataB = malloc(5000);
	DataC = malloc(5000);

    int i;
	int j;
	int k;

    scanf("%lld", &RowA);
    scanf("%lld", &ColA);
    i = 0;
label1:
    if (i < RowA) {
        j = 0;
    label2:
        if (j < ColA) {
            scanf("%lld", &DataA[i * ColA + j]);
            j = j + 1;
            goto label2;
        }
        i = i + 1;
        goto label1;
    }
    scanf("%lld", &RowB);
    scanf("%lld", &ColB);
    i = 0;
label3:
    if (i < RowB) {
        j = 0;
    label4:
        if (j < ColB) {
            scanf("%lld", &DataB[i * ColB + j]);
            j = j + 1;
            goto label4;
        }
        i = i + 1;
        goto label3;
    }

    if (ColA != RowB) {
        printf("Incompatible Dimensions\n");
    }
    if(ColA == RowB) {
        RowC = RowA;
        ColC = ColB;
        i = 0;
    label5:
        if (i < RowC) {
            j = 0;
        label6:
            if (j < ColC) {
                DataC[i * ColC + j] = 0;
                k = 0;
            label7:
				if (k < ColA) {
                    DataC[i * ColC + j] = DataC[i * ColC + j] + DataA[i * ColA + k] * DataB[k * ColB + j];
                    k = k + 1;
                    goto label7;
                }
                j = j + 1;
                goto label6;
            }
            i = i + 1;
            goto label5;
        }
        i = 0;
    label8:
        if (i < RowC) {
            j = 0;
        label9:
            if (j < ColC) {
                printf("%10d", DataC[i * ColC + j]);
                j = j + 1;
                goto label9;
            }
            printf("\n");
            i = i + 1;
            goto label8;
        }
    }
    return 0;
}

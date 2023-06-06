void Quicksort(int * a, int low, int high) {

    if (low < high) {
    	
	    int key;
	    key = a[low];
	
	    int i;
	    i = low;
	    int j;
	    j = high;
	
	    label1:
	
	        if (i < j) {
	
	        label2:
	            if (i < j){
					if(a[j] >= key) {
		                j = j - 1;
		                goto label2;
	
	            	}
				}
	
	            a[i] = a[j];
	
	        label3:
	            if (i < j) {
	            	if(a[i] <= key){
		                i = i + 1;
		                goto label3;
					}
	            }   
	
	            a[j] = a[i];
	
	            goto label1;
	        }
	
	    a[i] = key;
	
	    Quicksort(a, low, i - 1);
	    Quicksort(a, i + 1, high);
    }
    return;
}


int main() {

    int N;
    
    int i;
    
    scanf("%lld", &N);

    int * a;
	a = malloc(1000000);
    
    i = 0;
    label4:
        if (i < N) {

            scanf("%lld", &a[i]);
            i = i + 1;
            goto label4;

        }

    Quicksort(a, 0, N - 1);

    i = 0;
    label5:

        if ( i < N) {
            printf("%lld\n", a[i]);
            i = i + 1;
            goto label5;
        }
    return 0;
}

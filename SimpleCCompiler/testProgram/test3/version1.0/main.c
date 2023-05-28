#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int orlist[1000+5],ornext[1000+5];
int andlist[10000+5], andnext[10000+5];
int orsize, andsize;

char* input[100+5];
char name[100+5][10+5];
int credit[100+5];
int orhead[100+5];
char grade[100+5];

int cnt;

void mergeOrList(int head, int data){
	int cur = ++orsize;
	orlist[cur] = data;
	while(ornext[head]) head = ornext[head];
	ornext[head] = cur;
}

void mergeAndList(int head, int data){
	int cur = ++andsize;
	andlist[cur] = data;
	while(andnext[head]) head = andnext[head];
	andnext[head] = cur;
}

int store(char* tar, char* src){
	int i;
	for(i = 0; src[i] != '|' && src[i] != ',' && src[i] != ';'; ++i) tar[i] = src[i];
	tar[i] = 0;
	return i;
}

int storeOrSeq(char* src){
	char buf[10+5];
	int heador = ++orsize, headand;
	int bfirst = 1, cfirst = 1;
	while(true){
		if(src[0] == ';') cfirst = 1;
		if(src[0] == '|'){
			if(bfirst == 0 || src[1] == '|') return heador;
		}
		
		src = src + 1;
		src = src + store(buf, src);
		int mems;
		for(int i = 1; i <= cnt; ++i){
			if(strcmp(buf, name[i]) == 0){
				mems = i;
				break;
			}
		}
		
		if(cfirst){
			headand = ++andsize;
			andlist[headand] = mems;
			if(bfirst) orlist[heador] = headand;
			else mergeOrList(heador, headand);
		}else{
			mergeAndList(headand, mems);
		}
		
		bfirst = 0;
		cfirst = 0;
	}
}

double getGPA(){
	double sum = 0;
	int xcnt = 0;
	for(int i = 1; i <= cnt; ++i){
		if(grade[i]) xcnt += credit[i];
		if(grade[i] == 'A') sum += credit[i] * 4;
		if(grade[i] == 'B') sum += credit[i] * 3;
		if(grade[i] == 'C') sum += credit[i] * 2;
		if(grade[i] == 'D') sum += credit[i] * 1;
	}
	if(xcnt == 0) return 0.0;
	else return sum / xcnt;
}

int getAttempted(){
	int xcnt = 0;
	for(int i = 1; i <= cnt; ++i) if(grade[i]) xcnt += credit[i];
	return xcnt;
}

int getCompleted(){
	int xcnt = 0;
	for(int i = 1; i <= cnt; ++i) if(grade[i] && grade[i] != 'F') xcnt += credit[i];
	return xcnt;
}

int getRemaining(){
	int xcnt = 0;
	for(int i = 1; i <= cnt; ++i) if(grade[i] == 0 || grade[i] == 'F') xcnt += credit[i];
	return xcnt;
}

bool SatisfiedAnd(int id){
	int i = andlist[id];
	while(id){
		if(grade[i] == 0 || grade[i] == 'F') return false;
		id = andnext[id];
		i = andlist[id];
	}
	return true;
}

bool Satisfied(int id){
	int i = orlist[id];
	while(id){
		if(SatisfiedAnd(i)) return true;
		id = ornext[id];
		i = orlist[id];
	}
	return false;
}

int main(){
	while(true){
		cnt = cnt + 1;
		input[cnt] = (char*)malloc(sizeof(char) * 1000);
		fgets(input[cnt], 1000, stdin);
		if(input[cnt][0] == '\n'){
			cnt = cnt - 1;
			break;
		}
	}
	for(int i = 1; i <= cnt; ++i) store(name[i], input[i]);
	for(int i = 1; i <= cnt; ++i){
		input[i] = strchr(input[i], '|') + 1;
		sscanf(input[i], "%d", &credit[i]);
		input[i] = strchr(input[i], '|');
		orhead[i] = storeOrSeq(input[i]);
		input[i] = strchr(input[i], '|') + 1;
		input[i] = strchr(input[i], '|') + 1;
		if(input[i][0] != '\n') grade[i] = input[i][0];
	}
	printf("GPA: %.1lf\n", getGPA());
	printf("Hours Attempted: %d\n", getAttempted());
	printf("Hours Completed: %d\n", getCompleted());
	printf("Credits Remaining: %d\n", getRemaining());
	printf("\nPossible Courses to Take Next\n");
	
	int xcnt = 0;
	for(int i = 1; i <= cnt; ++i){
		if(grade[i] == 0 || grade[i] == 'F'){
			if(Satisfied(orhead[i])){
				++xcnt;
				printf("  %s\n", name[i]);
			}
		}
	}
	if(getRemaining() == 0 && xcnt == 0) printf("  None - Congratulations!\n");
	return 0;
}
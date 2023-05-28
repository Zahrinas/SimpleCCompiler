#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int* orlist;
int* ornext;
int* andlist;
int* andnext;
int* credit;
int* orhead;
char* grade;
int cnt;
int orsize;
int andsize;

char* input;
char* name;

void mergeOrList(int head, int data){
	orsize = orsize + 1;
	orlist[orsize] = data;
	
	label1:
	if(ornext[head] != 0){
		head = ornext[head];
		goto label1;
	}
	
	ornext[head] = orsize;
	return;
}

void mergeAndList(int head, int data){
	andsize = andsize + 1;
	andlist[andsize] = data;
	
	label2:
	if(andnext[head] != 0){
		head = andnext[head];
		goto label2;
	}
	
	andnext[head] = andsize;
	return;
}

int store(char* tar, char* src){
	int i;
	i = 0;
	
	label3:
	if(src[i] != '|'){
		if(src[i] != ','){
			if(src[i] != ';'){
				tar[i] = src[i];
				++i;
				goto label3;
			}
		}
	}
	
	tar[i] = 0;
	return i;
}

int storeOrSeq(char* src){
	char* buf;
	buf = malloc(20);
	int heador = ++orsize, headand;
	int bfirst = 1, cfirst = 1;
	
	label4:
	{
		if(src[0] == ';') cfirst = 1;
		if(src[0] == '|'){
			if(bfirst == 0) return heador;
			if(src[1] == '|') return heador;
		}
		
		src = src + 1;
		src = src + store(buf, src);
		
		int mems;
		
		int i;
		i = 1;
		
		label5:
		if(i <= cnt){
			if(strcmp(buf, name + i * 10) == 0){
				mems = i;
				goto label6;
			}
			i = i + 1;
			goto label5;
		}
		
		label6:
		
		if(cfirst != 0){
			headand = ++andsize;
			andlist[headand] = mems;
			if(bfirst != 0) orlist[heador] = headand;
			if(bfirst == 0) mergeOrList(heador, headand);
		}
		if(cfirst == 0) mergeAndList(headand, mems);
		
		bfirst = 0;
		cfirst = 0;
		goto label4;
	}
	
	return 0;
}

double getGPA(){
	double sum = 0;
	int xcnt = 0;
	int i;
	i = 1;
	
	label7:
	if(i <= cnt){
		if(grade[i]) xcnt += credit[i];
		if(grade[i] == 'A') sum += credit[i] * 4;
		if(grade[i] == 'B') sum += credit[i] * 3;
		if(grade[i] == 'C') sum += credit[i] * 2;
		if(grade[i] == 'D') sum += credit[i] * 1;
		i = i + 1;
		goto label7;
	}
	
	if(xcnt == 0) return 0.0;
	return sum / xcnt;
}

int getAttempted(){
	int xcnt;
	int i;
	xcnt = 0;
	i = 1;
	
	label8:
	if(i <= cnt){
		if(grade[i]) xcnt += credit[i];
		i = i + 1;
		goto label8;
	}
	
	return xcnt;
}

int getCompleted(){
	int xcnt;
	int i;
	xcnt = 0;
	i = 1;
	
	label9:
	if(i <= cnt){
		if(grade[i] != 0){
			if(grade[i] != 'F') xcnt += credit[i];
		}
		i = i + 1;
		goto label9;
	}
	
	return xcnt;
}

int getRemaining(){
	int xcnt;
	int i;
	xcnt = 0;
	i = 1;
	
	label10:
	if(i <= cnt){
		if(grade[i] == 0) xcnt += credit[i];
		if(grade[i] == 'F') xcnt += credit[i];
		i = i + 1;
		goto label10;
	}
	
	return xcnt;
}

int SatisfiedAnd(int id){
	int i;
	i = andlist[id];
	
	label11:
	if(id != 0){
		if(grade[i] == 0) return 0;
		if(grade[i] == 'F') return 0;
		id = andnext[id];
		i = andlist[id];
		goto label11;
	}
	
	return 1;
}

int Satisfied(int id){
	int i = orlist[id];
	
	label12:
	if(id != 0){
		if(SatisfiedAnd(i) == 1) return 1;
		id = ornext[id];
		i = orlist[id];
		goto label12;
	}
	
	return 0;
}

int main(){
	int i;
	int xcnt;
	
	orlist = malloc(5000);
	memset(orlist, 0, 5000);
	ornext = malloc(5000);
	memset(ornext, 0, 5000);
	andlist = malloc(50000);
	memset(andlist, 0, 5000);
	andnext = malloc(50000);
	memset(andnext, 0, 5000);
	
	credit = malloc(500);
	orhead = malloc(500);
	grade = malloc(200);
	
	input = malloc(200000);
	name = malloc(4000);
	
	label13:
	{
		cnt = cnt + 1;
		gets(input + cnt * 1000);
		if(input[cnt * 1000] == 0){
			cnt = cnt - 1;
			goto label14;
		}
		goto label13;
	}
	
	label14:
		
	i = 1;
	
	label15:
	if(i <= cnt){
		store(name + i * 10, input+ i * 1000);
		i = i + 1;
		goto label15;
	}
	
	i = 1;
	
	label16:
	if(i <= cnt){
		char* s;
		s = input + i * 1000;
		s = strchr(s, '|') + 1;
		sscanf(s, "%d", &credit[i]);
		s = strchr(s, '|');
		orhead[i] = storeOrSeq(s);
		s = s + 1;
		s = strchr(s, '|') + 1;
		if(s[0] != '\n') grade[i] = s[0];
		i = i + 1;
		goto label16;
	}
	
	printf("GPA: %.1lf\n", getGPA());
	printf("Hours Attempted: %d\n", getAttempted());
	printf("Hours Completed: %d\n", getCompleted());
	printf("Credits Remaining: %d\n", getRemaining());
	printf("\nPossible Courses to Take Next\n");
	
	i = 1;
	
	label17:
	if(i <= cnt){
		if(grade[i] == 0){
			if(Satisfied(orhead[i])){
				xcnt = xcnt + 1;
				printf("  %s\n", name + i * 10);
			}
		}
		if(grade[i] == 'F'){
			if(Satisfied(orhead[i])){
				xcnt = xcnt + 1;
				printf("  %s\n", name +i * 10);
			}
		}
		i = i + 1;
		goto label17;
	}
	
	if(getRemaining() == 0){
		if(xcnt == 0){
			printf("  None - Congratulations!\n");
		}
	}
	return 0;
}
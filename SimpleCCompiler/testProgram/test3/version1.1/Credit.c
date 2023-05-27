#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void mergeOrList(int head, int data, int* orsize, int* orlist, int* ornext){
	*orsize = *orsize + 1;
	orlist[*orsize] = data;
	
	label1:
	if(ornext[head] != 0){
		head = ornext[head];
		goto label1;
	}
	
	ornext[head] = *orsize;
	return;
}

void mergeAndList(int head, int data, int* andsize, int* andlist, int* andnext){
	*andsize = *andsize + 1;
	andlist[*andsize] = data;
	
	label2:
	if(andnext[head] != 0){
		head = andnext[head];
		goto label2;
	}
	
	andnext[head] = *andsize;
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

int storeOrSeq(char* src, int* cnt, char* name, int* andsize, int* orsize, int* andlist, int* orlist, int* andnext, int* ornext){
	char* buf;
	buf = malloc(20);
	int heador = ++*orsize, headand;
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
		if(i <= *cnt){
			if(strcmp(buf, name + i * 10) == 0){
				mems = i;
				goto label6;
			}
			i = i + 1;
			goto label5;
		}
		
		label6:
		
		if(cfirst != 0){
			headand = ++*andsize;
			andlist[headand] = mems;
			if(bfirst != 0) orlist[heador] = headand;
			if(bfirst == 0) mergeOrList(heador, headand, orsize, orlist, ornext);
		}
		if(cfirst == 0) mergeAndList(headand, mems, andsize, andlist, andnext);
		
		bfirst = 0;
		cfirst = 0;
		goto label4;
	}
	
	return 0;
}

double getGPA(int* cnt, char* grade, int* credit){
	double sum = 0;
	int xcnt = 0;
	int i;
	i = 1;
	
	label7:
	if(i <= *cnt){
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

int getAttempted(int* cnt, char* grade, int* credit){
	int xcnt;
	int i;
	xcnt = 0;
	i = 1;
	
	label8:
	if(i <= *cnt){
		if(grade[i]) xcnt += credit[i];
		i = i + 1;
		goto label8;
	}
	
	return xcnt;
}

int getCompleted(int* cnt, char* grade, int* credit){
	int xcnt;
	int i;
	xcnt = 0;
	i = 1;
	
	label9:
	if(i <= *cnt){
		if(grade[i] != 0){
			if(grade[i] != 'F') xcnt += credit[i];
		}
		i = i + 1;
		goto label9;
	}
	
	return xcnt;
}

int getRemaining(int* cnt, char* grade, int* credit){
	int xcnt;
	int i;
	xcnt = 0;
	i = 1;
	
	label10:
	if(i <= *cnt){
		if(grade[i] == 0) xcnt += credit[i];
		if(grade[i] == 'F') xcnt += credit[i];
		i = i + 1;
		goto label10;
	}
	
	return xcnt;
}

int SatisfiedAnd(int id, int* andlist, int* andnext, char* grade){
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

int Satisfied(int id, int* orlist, int* ornext, int* andlist, int* andnext, char* grade){
	int i = orlist[id];
	
	label12:
	if(id != 0){
		if(SatisfiedAnd(i, andlist, andnext, grade) == 1) return 1;
		id = ornext[id];
		i = orlist[id];
		goto label12;
	}
	
	return 0;
}

int main(){
	int* orlist;
	int* ornext;
	int* andlist;
	int* andnext;
	int* credit;
	int* orhead;
	
	int i;
	int cnt;
	int xcnt;
	int orsize;
	int andsize;
	
	char* grade;
	char* input;
	char* name;
	
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
	
	orsize = 0;
	andsize = 0;
	
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
		orhead[i] = storeOrSeq(s, &cnt, name, &andsize, &orsize, andlist, orlist, andnext, ornext);
		s = s + 1;
		s = strchr(s, '|') + 1;
		if(s[0] != '\n') grade[i] = s[0];
		i = i + 1;
		goto label16;
	}
	
	printf("GPA: %.1lf\n", getGPA(&cnt, grade, credit));
	printf("Hours Attempted: %d\n", getAttempted(&cnt, grade, credit));
	printf("Hours Completed: %d\n", getCompleted(&cnt, grade, credit));
	printf("Credits Remaining: %d\n", getRemaining(&cnt, grade, credit));
	printf("\nPossible Courses to Take Next\n");
	
	i = 1;
	
	label17:
	if(i <= cnt){
		if(grade[i] == 0){
			if(Satisfied(orhead[i], orlist, ornext, andlist, andnext, grade)){
				xcnt = xcnt + 1;
				printf("  %s\n", name + i * 10);
			}
		}
		if(grade[i] == 'F'){
			if(Satisfied(orhead[i], orlist, ornext, andlist, andnext, grade)){
				xcnt = xcnt + 1;
				printf("  %s\n", name +i * 10);
			}
		}
		i = i + 1;
		goto label17;
	}
	
	if(getRemaining(&cnt, grade, credit) == 0){
		if(xcnt == 0){
			printf("  None - Congratulations!\n");
		}
	}
	return 0;
}
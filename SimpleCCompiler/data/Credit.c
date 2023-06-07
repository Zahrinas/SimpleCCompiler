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
	if(src[i] != 124){
		if(src[i] != 44){
			if(src[i] != 59){
				tar[i] = src[i];
				i = i + 1;
				goto label3;
			}
		}
	}
	
	tar[i] = 0;
	return i;
}

int storeOrSeq(char* src, int* cnt, char* name, int* andsize, int* orsize, int* andlist, int* orlist, int* andnext, int* ornext, char* buf){
	int headand;
	int heador;
	int bfirst;
	int cfirst;
	int flag;
	*orsize = *orsize + 1;
	heador = *orsize;
	bfirst = 1;
	cfirst = 1;
	flag = 1;
	
	label4:
	if(flag == 1){
		if(src[0] == 59) cfirst = 1;
		if(src[0] == 124){
			if(bfirst == 0){
				flag = 0;
				goto label4;
			}
			if(src[1] == 124){
				flag = 0;
				goto label4;
			}
		}
		
		src = &src[1];
		src = &src[store(buf, src)];
		
		int mems;
		mems = 10000;
		
		int i;
		i = 1;
		
		label5:
		if(i <= *cnt){
			if(strcmp(buf, &name[i * 10]) == 0) mems = i;
			i = i + 1;
			goto label5;
		}
		
		if(cfirst != 0){
			*andsize = *andsize + 1;
			headand = *andsize;
			andlist[headand] = mems;
			if(bfirst != 0) orlist[heador] = headand;
			if(bfirst == 0) mergeOrList(heador, headand, orsize, orlist, ornext);
		}
		if(cfirst == 0) mergeAndList(headand, mems, andsize, andlist, andnext);
		
		bfirst = 0;
		cfirst = 0;
		goto label4;
	}
	
	return heador;
}

double getGPA(int* cnt, char* grade, double* credit){
	double sum;
	double xcnt;
	int i;
	int flag;
	xcnt = 0.0;
	sum = 0.0;
	i = 1;
	flag = 0;
	
	label7:
	if(i <= *cnt){
		if(grade[i] != 0){
			flag = 1;
			xcnt = xcnt + credit[i];
		}
		if(grade[i] == 65) sum = sum + credit[i] + credit[i] + credit[i] + credit[i];
		if(grade[i] == 66) sum = sum + credit[i] + credit[i] + credit[i];
		if(grade[i] == 67) sum = sum + credit[i] + credit[i];
		if(grade[i] == 68) sum = sum + credit[i]; 
		i = i + 1;
		goto label7;
	}
	
	sum = sum / xcnt;
	if(flag == 0) sum = 0.0;
	return sum;
}

double getAttempted(int* cnt, char* grade, double* credit){
	double xcnt;
	int i;
	xcnt = 0.0;
	i = 1;
	
	label8:
	if(i <= *cnt){
		if(grade[i] != 0) xcnt = xcnt + credit[i];
		i = i + 1;
		goto label8;
	}
	
	return xcnt;
}

double getCompleted(int* cnt, char* grade, double* credit){
	double xcnt;
	int i;
	xcnt = 0.0;
	i = 1;
	
	label9:
	if(i <= *cnt){
		if(grade[i] != 0){
			if(grade[i] != 70) xcnt = xcnt + credit[i];
		}
		i = i + 1;
		goto label9;
	}
	
	return xcnt;
}

double getRemaining(int* cnt, char* grade, double* credit){
	double xcnt;
	int i;
	xcnt = 0.0;
	i = 1;
	
	label10:
	if(i <= *cnt){
		if(grade[i] == 0) xcnt = xcnt + credit[i];
		if(grade[i] == 70) xcnt = xcnt + credit[i];
		i = i + 1;
		goto label10;
	}
	
	return xcnt;
}

int SatisfiedAnd(int id, int* andlist, int* andnext, char* grade){
	int i;
	int ret;
	ret = 1;
	i = andlist[id];
	if(i == 10000) ret = 0;
	label11:
	if(id != 0){
		if(grade[i] == 0) ret = 0;
		if(grade[i] == 70) ret = 0;
		id = andnext[id];
		i = andlist[id];
		goto label11;
	}
	
	return ret;
}

int Satisfied(int id, int* orlist, int* ornext, int* andlist, int* andnext, char* grade){
	int i;
	int ret;
	ret = 0;
	i = orlist[id];
	
	label12:
	if(id != 0){
		if(SatisfiedAnd(i, andlist, andnext, grade) == 1) ret = 1;
		id = ornext[id];
		i = orlist[id];
		goto label12;
	}
	
	return ret;
}

int main(){
	int* orlist;
	int* ornext;
	int* andlist;
	int* andnext;
	int* orhead;
	
	double* credit;
	
	int i;
	int cnt;
	int flag;
	int xcnt;
	int orsize;
	int andsize;
	
	char* grade;
	char* input;
	char* name;
	char* buf;
	char* s;
	char z;
	
	z = 0;
	orlist = malloc(10000);
	s = orlist;
	memset(s, z, 10000);
	ornext = malloc(10000);
	s = ornext;
	memset(s, z, 10000);
	andlist = malloc(100000);
	s = andlist;
	memset(s, z, 100000);
	andnext = malloc(100000);
	s = andnext;
	memset(s, z, 100000);
	
	credit = malloc(1000);
	orhead = malloc(1000);
	grade = malloc(200);
	
	input = malloc(200000);
	name = malloc(4000);
	buf = malloc(20);
	
	cnt = 0;
	xcnt = 0;
	flag = 0;
	orsize = 0;
	andsize = 0;
	
	label13:
	{
		cnt = cnt + 1;
		gets(&input[cnt * 1000]);
		if(input[cnt * 1000] == 0){
			cnt = cnt - 1;
			flag = 1;
		}
		if(flag != 1) goto label13;
	}
	
	flag = 0;
		
	i = 1;
	
	label15:
	if(i <= cnt){
		store(&name[i * 10], &input[i * 1000]);
		i = i + 1;
		goto label15;
	}
	
	i = 1;
	
	label16:
	if(i <= cnt){
		s = &input[i * 1000];
		s = strchr(s, 124);
		s = &s[1];
		sscanf(s, "%lf", &credit[i]);
		s = strchr(s, 124);
		orhead[i] = storeOrSeq(s, &cnt, name, &andsize, &orsize, andlist, orlist, andnext, ornext, buf);
		s = &s[1];
		s = strchr(s, 124);
		s = &s[1];
		if(s[0] != 10) grade[i] = s[0];
		i = i + 1;
		goto label16;
	}
	
	printf("GPA: %.1lf\n", getGPA(&cnt, grade, credit));
	printf("Hours Attempted: %.0lf\n", getAttempted(&cnt, grade, credit));
	printf("Hours Completed: %.0lf\n", getCompleted(&cnt, grade, credit));
	printf("Credits Remaining: %.0lf\n", getRemaining(&cnt, grade, credit));
	printf("\nPossible Courses to Take Next\n");
	
	i = 1;
	
	label17:
	if(i <= cnt){
		if(grade[i] == 0){
			flag = 1;
			if(Satisfied(orhead[i], orlist, ornext, andlist, andnext, grade) != 0){
				xcnt = xcnt + 1;
				printf("  %s\n", &name[i * 10]);
			}
		}
		if(grade[i] == 70){
			flag = 1;
			if(Satisfied(orhead[i], orlist, ornext, andlist, andnext, grade) != 0){
				xcnt = xcnt + 1;
				printf("  %s\n", &name[i * 10]);
			}
		}
		i = i + 1;
		goto label17;
	}
	
	if(flag == 0) printf("  None - Congratulations!\n");
	return 0;
}
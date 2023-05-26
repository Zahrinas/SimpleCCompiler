#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

// 定义结构体存储课程信息
typedef struct course {
    char name[5]; // 课程名称
    int credit; // 学分
    char prereq[20];// 前置课程
    char grade; // 成绩
    struct course* next; // 指向下一个节点
} course;

// 定义结构体存储培养方案信息
typedef struct plan {
    course* head; // 指向第一个节点
    int total_credit; // 总学分
    int attempted_credit; // 尝试学分
    int completed_credit; // 已修学分
    double gpa; // GPA
} plan;

// 定义函数原型
void input_course(plan* p); // 输入一门课程信息并添加到培养方案中
void output_course(course* c); // 输出一门课程信息
void output_plan(plan* p); // 输出培养方案信息和统计结果
bool check_prereq(char* prereq, plan* p); // 检查是否满足前置条件
void recommend_course(plan* p); // 推荐可选的课程

int main() {
    plan p; // 创建一个培养方案变量
    p.head = NULL; // 初始化头指针为空
    p.total_credit = 0; // 初始化总学分为0
    p.attempted_credit = 0; // 初始化尝试学分为0
    p.completed_credit = 0; // 初始化已修学分为0
    p.gpa = 0.0; // 初始化GPA为0.0

    printf("请输入培养方案，每行一门课程，空行代表输入结束。\n");
    printf("每门课程格式为：\n");
    printf("课程名称|学分|前置课程|成绩\n");

    input_course(&p); // 输入培养方案

    output_plan(&p); // 输出培养方案

    if (p.total_credit == p.completed_credit) {
        printf("Possible Courses to Take Next\n");
        printf("  None - Congratulations!");

    }
    else {
        recommend_course(&p); // 推荐可选的课程
    }


    return 0;
}

// 输入一门课程信息并添加到培养方案中
void input_course(plan* p) {
    char line[300]; // 存储输入的一行字符串
    course* c;

    course* tail; // 创建一个新节点和一个尾指针
    tail = NULL;
    while (true) {
        fgets(line, sizeof(line), stdin); // 从标准输入读取一行字符串

        if (strcmp(line, "\n") == 0) { // 如果是空行，表示输入结束
            break;
        }

        for (int i = 0; i < 299; i++) {
            if (line[i] == '|'&& line[i+1] == '|') {
                for (int k = 299; k > i+1; k--) {
                    line[k] = line[k - 1];
                }
                line[i + 1] = ' ';
            }
        }

        c = (course*)malloc(sizeof(course)); // 分配内存空间给新节点
        //strcpy(c->prereq, ""); // 初始化为空字符串
        //c->grade = '\n'; // 初始化为空字符


        // sscanf(line, "%[^|]|%d|%[^|]|%c", c->name, &c->credit, c->prereq, &c->grade);
        sscanf(line, "%[^|]|%d|%[^|]|%c", c->name, &c->credit, c->prereq, &c->grade);
        // 根据格式解析字符串并赋值给新节点

        c->next = NULL; // 新节点的下一个指针为空

        if (p->head == NULL) { // 如果培养方案为空，新节点作为头节点
            p->head = c;
            tail = c;
        }
        else { // 如果培养方案不为空，新节点插入到尾部，并更新尾指针
            tail->next = c;
            tail = c;
        }

        p->total_credit += c->credit; // 更新总学分

        if (c->grade != '\n') { // 如果有成绩，更新尝试学分和GPA

            p->attempted_credit += c->credit;

            switch (c->grade) {
            case 'A':
                p->gpa += c->credit * 4.0;
                break;
            case 'B':
                p->gpa += c->credit * 3.0;
                break;
            case 'C':
                p->gpa += c->credit * 2.0;
                break;
            case 'D':
                p->gpa += c->credit * 1.0;
                break;
            case 'F':
                break;
            }

            if (c->grade != 'F') { // 如果不是F，更新已修学分

                p->completed_credit += c->credit;
            }
        }

    }

    if (p->attempted_credit > 0) {
        p->gpa /= p->attempted_credit;
        p->gpa = ((int)(p->gpa * 10 + 0.5)) / 10.0;
        // 计算GPA并保留一位小数（四舍五入）

    }
}

// 输出一门课程信息
// 输出一门课程信息
void output_course(course* c) {

    printf("%s|%d|%s|", c->name, c->credit, c->prereq);

    if (c->grade == '\n') {
        printf("\n");
    }
    else if (c->grade == ' ') { // 如果成绩为空，输出一个空格
        printf(" \n");
    }
    else {
        printf("%c\n", c->grade);
    }
}



// 输出培养方案信息和统计结果
void output_plan(plan* p) {
    course* c;
    //printf("培养方案如下：\n");
    //printf("课程名称|学分|前置课程|成绩\n");
    c = p->head;
    while (c != NULL) {
        //output_course(c);
        c = c->next;
    }
    printf("GPA: %.1f\n", p->gpa);
    printf("Hours Attempted: %d\n", p->attempted_credit);
    printf("Hours Completed: %d\n", p->completed_credit);
    printf("Credits Remaining: %d\n", p->total_credit - p->completed_credit);
}

// 检查是否满足前置条件
bool check_prereq(char* prereq, plan* p) {
    char* token; // 存储分割后的子字符串
    char temp[20]; // 存储前置课程字符串的副本
    bool result; // 存储最终结果
    bool and_result; // 存储逻辑与的结果
    bool or_result; // 存储逻辑或的结果
    course* c; // 用于遍历培养方案

    if (strcmp(prereq, " ") == 0) { // 如果前置课程为空，返回真
        return true;
    }

    strcpy(temp, prereq); // 复制前置课程字符串，避免修改原字符串

    token = strtok(temp, ";"); // 以分号为分隔符，获取第一个子字符串

    or_result = false; // 初始化逻辑或的结果为假

    while (token != NULL) { // 当还有子字符串时

        and_result = true; // 初始化逻辑与的结果为真

        for (int i = 0; i < strlen(token); i += 2) { // 遍历子字符串中的每个课程名称

            result = false; // 初始化结果为假

            c = p->head; // 从头节点开始遍历培养方案

            while (c != NULL) { // 当还有节点时

                if (c->name[0] == token[i]) { // 如果找到匹配的课程名称

                    if (c->grade != '\n' && c->grade != 'F') { // 如果该课程已修且不是F

                        result = true; // 结果为真

                    }

                    break; // 跳出循环

                }

                c = c->next; // 移动到下一个节点

            }

            and_result = and_result && result; // 更新逻辑与的结果

        }

        or_result = or_result || and_result; // 更新逻辑或的结果

        token = strtok(NULL, ";"); // 获取下一个子字符串

    }

    return or_result; // 返回最终结果
}

// 推荐可选的课程
void recommend_course(plan* p) {

    course* c;

    int Norecommend = 0;

    printf("Possible Courses to Take Next\n");

    c = p->head;

    while (c != NULL) { // 遍历培养方案

        if (c->grade == '\n' && check_prereq(c->prereq, p)) {
            // 如果该课程未修且满足前置条件

            printf("  %s\n", c->name); // 输出课程名称

        }

        c = c->next; // 移动到下一个节点

    }

}

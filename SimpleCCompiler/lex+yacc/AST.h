#pragma once

#include <assert.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <string>

enum class AST_type {
    program,
    seq_tree, eseq_tree, deflist,
    decl_inst, return_inst, assign_inst,
    call_inst,
    int_type,
    name, string, constant,
    plus, minus, multiply, divide, mod,
    and_type, or_type, not_type,
    equal, not_equal, greater, less, greater_equal, less_equal,
    band, bor, bxor,
    uband, uminus, ustar,

    array, // 暂时用array表示

    func_decl, label_decl,
    void_type, double_type, char_type,
    if_inst, for_inst, while_inst,
    goto_inst
};

enum class dataType {
    voidType, intType, doubleType, stringType
};

struct datum {
    dataType type;
    void *ptr;

    datum(int i);
    datum(double d);
    datum(std::string s);
    datum(dataType dt = dataType::voidType);

    int getDataInt();
    double getDataDouble();
    std::string getDataString();
};

struct node {
    AST_type type;
    std::string name;
    datum value;

    struct node *child;
    struct node *next;

};

static inline struct node *newNode(AST_type type, std::string name, int argc, ...) {
    struct node *curNode = NULL;

    curNode = (struct node *)malloc(sizeof(struct node));
    assert(curNode != NULL);

    curNode->type = type;
    curNode->name = name;

    if (argc == 0) {
        curNode->child = NULL;
        return curNode;
    }

    va_list vaList;
    va_start(vaList, argc);

    struct node *tempNode = va_arg(vaList, struct node *);

    while (tempNode == nullptr && argc > 1) {
        tempNode = va_arg(vaList, struct node *);
        --argc;
    }

    if (tempNode != nullptr) {
        curNode->child = tempNode;

        for (int i = 1; i < argc; ++i) {
            struct node *nextNode = va_arg(vaList, struct node *);
            if (nextNode != nullptr) {
                tempNode->next = nextNode;
                tempNode = tempNode->next;
            }
        }
    }

    va_end(vaList);
    return curNode;
}

static inline struct node *newTerNode(AST_type type, std::string name, datum v) {
    struct node *curNode = NULL;

    curNode = (struct node *)malloc(sizeof(struct node));
    assert(curNode != NULL);

    curNode->type = type;
    curNode->name = name;
    curNode->value = v;
    curNode->child = NULL;
    curNode->next = NULL;

    return curNode;
}

static inline void printTreeInfo(struct node *curNode, int height) {
    if (curNode == NULL) {
        return;
    }

    for (int i = 0; i < height; ++i) {
        printf("  ");
    }
    printf("%s", curNode->name.c_str());
    if (curNode->type == AST_type::constant) {
        if (curNode->value.type == dataType::intType) {
            printf("(%d)", curNode->value.getDataInt());
        } else if (curNode->value.type == dataType::doubleType) {
            printf("(%lf)", curNode->value.getDataDouble());
        }
    } else if (curNode->type == AST_type::string || curNode->type == AST_type::name) {
        printf("(%s)", curNode->value.getDataString().c_str());
    }
    printf("\n");
    printTreeInfo(curNode->child, height + 1);
    printTreeInfo(curNode->next, height);
}
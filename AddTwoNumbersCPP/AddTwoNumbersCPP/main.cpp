//
//  main.cpp
//  AddTwoNumbersCPP
//
//  Created by benlaijw on 16/8/5.
//  Copyright © 2016年 com.jing. All rights reserved.
//

#include <iostream>

/*
 
 You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 
 */

typedef struct LinkedNode
{
    int data;
    LinkedNode *next;
    
}LinkedNode;

LinkedNode* LinkedNodeMake(int n, ...) {
    
    va_list args;
    va_start(args, n);
    
    LinkedNode *prev = new LinkedNode;
    prev->data = va_arg(args, int);
    LinkedNode *head = prev;
    
    for (int i = 1; i < n; i++) {
        LinkedNode *node = new LinkedNode;
        node->data = va_arg(args, int);
        prev->next = node;
        
        prev = node;
    }
    va_end(args);
    
    return head;
}

LinkedNode* AddTwoNumbers(LinkedNode* a, LinkedNode* b) {
    int cur = 0;
    LinkedNode preHead = {};
    LinkedNode *node = &preHead;
    
    while (a || b || cur) {
        int sum = (a ? a->data : 0) + (b ? b->data : 0) + cur;
        LinkedNode *tmp = new LinkedNode;
        tmp->data = sum%10;
        
        node->next = tmp;
        node = tmp;
        
        cur = sum/10;
        a = a ? a->next : NULL;
        b = b ? b->next : NULL;
    }
    return preHead.next;
}

int main(int argc, const char * argv[]) {
    // insert code here...
    
    
    LinkedNode *a = LinkedNodeMake(3, 2,4,3);
    LinkedNode *b = LinkedNodeMake(3, 5,6,4);
    LinkedNode *sum = AddTwoNumbers(a, b);
    
    while (sum) {
        std::cout << sum->data;
        std::cout << ",";
        sum = sum->next;
    }
    
    std::cout << "\n";
    return 0;
}

//
//  main.cpp
//  AddBinaryCPP
//
//  Created by benlaijw on 16/8/5.
//  Copyright © 2016年 com.jing. All rights reserved.
//

#include <iostream>
#include <string>

/*
 Given two binary strings, return their sum (also a binary string).
 
 For example,
 a = "11"
 b = "1"
 Return "100".
 
 */

using std::string;

string addBinary(string a, string b) {
    int i = (int)a.length();
    int j = (int)b.length();
    int cur = 0;
    string res;
    
    while (i || j || cur) {
        cur += (i ? a[(i--)-1] - '0' : 0) + (j ? b[(j--)-1] - '0' : 0);
        res = char(cur%2 + '0') + res;
        cur /= 2;
    }
    
    return res;
}

int main(int argc, const char * argv[]) {
    // insert code here...
    string a = "110100111";
    string b = "1110010101";
    string res = addBinary(a, b);
    std::cout << res;
    std::cout << "\n";
    return 0;
}


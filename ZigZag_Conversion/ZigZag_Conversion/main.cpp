//
//  main.cpp
//  ZigZag_Conversion
//
//  Created by benlaijw on 16/9/19.
//  Copyright © 2016年 com.jing. All rights reserved.
//


/*

The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

P   A   H   N
A P L S I I G
Y   I   R
 
And then read line by line: "PAHNAPLSIIGYIR"
Write the code that will take a string and make this conversion given a number of rows:

string convert(string text, int nRows);
convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".

*/



#include <iostream>
#include <string>


using namespace std;


string convert(string text, int nRows) {
    if (nRows <= 1) {
        return text;
    }
    
    string res;
    unsigned long length = text.length();
    int round = nRows + nRows - 2;
    
    for (int i = 0; i < nRows; i++) {
        int j = i;
        int det = round - j * 2;
        while (j < length) {
            res.append(text, j, 1);
            if (det != round && det != 0 && j + det < length) {
                res.append(text, j + det, 1);
            } else if (j + det >= length) {
                break;
            }
            j += round;
        }
    }
    
    return res;
}

int main(int argc, const char * argv[]) {
    // insert code here...
    string original = "PAYPALISHIRING";
    string converted = convert(original, 5);
    
    std::cout << converted << "\n";
    return 0;
}

/*
 P     I     N
 A   L S   I G
 Y A   H R
 P     I
 
 
 P       H
 A     S I
 Y   I   R
 P L     I G
 A       N
 
 */


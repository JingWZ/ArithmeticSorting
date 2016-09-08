//
//  main.cpp
//  LongestSubstringWithoutRepeatingCharacters
//
//  Created by benlaijw on 16/9/5.
//  Copyright © 2016年 com.jing. All rights reserved.
//


/*

Given a string, find the length of the longest substring without repeating characters.

Examples:

Given "abcabcbb", the answer is "abc", which the length is 3.

Given "bbbbb", the answer is "b", with the length of 1.

Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

*/


#include <iostream>
#include <string>
#include <map>


using namespace std;

string longestSubstringWithoutRepeatingCharacters(string str) {
    string result;
    
    
    unsigned long length = str.length();
    for (int i = 0; i < length; i++) {
        int j = i;
        
        string tmp;
        map<char, bool> hit;
        
        while (j < length) {
            char cur = str[j];
            if (hit.find(cur) != hit.end()) {
                break;
            } else {
                tmp += cur;
                hit.insert(pair<char, bool>(cur, true));
            }
            j++;
        }
        
        result = tmp.length() > result.length() ? tmp : result;
    }
    
    return result;
}

string longestSubstringWithoutRepeatingCharacters2(string original) {
    string result;
    
    unsigned long length = original.length();
    int i = 0, j = 0;
    map<char, int> hit; //key is element, value is index
    string tmp;
    
    while (i < length && j < length) {
        char cur = original[j];
        if (hit.find(cur) != hit.end()) { //hit
            result = tmp.length() > result.length() ? tmp : result;
            i = hit[cur] + 1;
            tmp = original.substr(i, j-i+1);
            hit[cur] = j;
            j++;
            
        } else { //miss
            hit[cur] = j;
            tmp += cur;
            j++;
        }
    }
    
//    if not hit at all
    if (result == "") {
        result = tmp;
        
    }
    
    return result;
}


int main(int argc, const char * argv[]) {
    // insert code here...
    string original = "pwwkew";
//    string original = "pwarev";
    string result = longestSubstringWithoutRepeatingCharacters2(original);
    
    std::cout << result << "\n";
    return 0;
}

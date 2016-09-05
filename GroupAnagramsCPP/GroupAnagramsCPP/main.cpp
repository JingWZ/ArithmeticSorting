//
//  main.cpp
//  GroupAnagramsCPP
//
//  Created by benlaijw on 16/8/8.
//  Copyright © 2016年 com.jing. All rights reserved.
//

#include <iostream>
#include <string>
#include <algorithm>
#include <map>
#include <vector>

/*
 
Given an array of strings, group anagrams together.

For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"],
Return:

[
 ["ate", "eat","tea"],
 ["nat","tan"],
 ["bat"]
 ]
Note: All inputs will be in lower-case.
 
*/

using namespace std;


void GroupAnagrams() {
    vector<string> a = {"eat", "tea", "tan", "ate", "nat", "bat"};
    map<string, vector<string>> dict;
    map<string, vector<string>>::iterator iter;
    
    for (int i = 0; i < 6; i++) {
        string str = a[i];
        string original = str;
        sort(str.begin(), str.end());
        
        iter = dict.find(str);
        vector<string> col;
        if (iter != dict.end()) {
            col = dict[str];
        }
        
        col.push_back(original);
        dict[str] = col;

    }
    
    vector<vector<string>> res;
    for (map<string, vector<string>>::iterator iter = dict.begin(); iter != dict.end(); ++iter) {
        vector<string> col = iter->second;
        res.push_back(col);
        
//        for (vector<string>::iterator it = col.begin(); it != col.end(); ++it) {
//            cout << *it << ",";
//        }
//        cout << "\n";
    }
}

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    GroupAnagrams();
    return 0;
}

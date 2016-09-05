//: Playground - noun: a place where people can play

import UIKit

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


func GroupAnagrams(list: Array<String>) {
    var dic = Dictionary<String, Array<String>>()
    
    for str in list {
        let sorted = str.utf8.sort()
        
        
    }
    
}



let list = ["eat", "tea", "tan", "ate", "nat", "bat"]
GroupAnagrams(list)


let t = "eat"
print(t.utf8.sort())
print(t.utf8)

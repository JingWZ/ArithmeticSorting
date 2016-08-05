//: Playground - noun: a place where people can play

import UIKit
import Foundation

/*
Given two binary strings, return their sum (also a binary string).

For example,
a = "11"
b = "1"
Return "100".

*/

extension String {
    subscript (i: Int) -> String {
        return String(self[self.endIndex.advancedBy(-1-i)])
    }
}

func addBinary(a: String, _ b: String) -> String {
    let n_a = Int(a)!
    let n_b = Int(b)!
    
    var sum = n_a + n_b
    let target = 2
    
    var i = 0
    var next = 0
    var res = String()
    
    while sum / 10 > 0 || sum > 0 {
        let digit = sum % 10
        let cur: String = String(digit % target)
        res.insert(cur[cur.startIndex], atIndex: res.startIndex)
        next = digit / target
        
        sum = sum / 10 + next
        i = i + 1
    }
    
    return String(res)
}

let a = "110100111"
let b = "1110010101"

addBinary(a, b)
























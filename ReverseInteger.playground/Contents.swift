//: Playground - noun: a place where people can play


/*
 
Reverse digits of an integer.

Example1: x = 123, return 321
Example2: x = -123, return -321

 */

import UIKit

func reverseInteger(original:Int) -> Int {
    var result = 0
    
    var numbs = original
    while numbs != 0 {
        result = result * 10 + numbs % 10
        numbs = numbs / 10
    }
    
    return result
}


let n = 123
let result = reverseInteger(original: n)

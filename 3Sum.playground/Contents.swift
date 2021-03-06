//: Playground - noun: a place where people can play

import UIKit

/*
 Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 
 Note: The solution set must not contain duplicate triplets.
 
 For example, given array S = [-1, 0, 1, 2, -1, -4],
 
 A solution set is:
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 
 */

var str = "Hello, playground"

func compute3Sum(list: Array<Int>) -> Array<Array<Int>>{
    
    var sorted = list.sort()
    var res = Array<Array<Int>>()
    
    for i in 0..<sorted.count-2 {
        if sorted[i] > 0 { break }
        if i > 0 && sorted[i] == sorted[i - 1] { continue }
        
        var j = i + 1
        var k = sorted.count - 1
        while j < k {
            
            let t = sorted[i] + sorted[j] + sorted[k]
            if t < 0 {
                while (j < k && sorted[j + 1] == sorted[j]) { j = j + 1 }
                j = j + 1
                
            } else if t > 0 {
                while (j < k && sorted[k - 1] == sorted[k]) { k = k - 1 }
                k = k - 1
                
            } else {
                let c = [sorted[i], sorted[j], sorted[k]]
                res.append(c)
                
                while (j < k && sorted[j + 1] == sorted[j]) { j = j + 1 }
                while (j < k && sorted[k - 1] == sorted[k]) { k = k - 1 }
                j = j + 1
                k = k - 1
            }
            

            
        }
        
        if sorted[i] == sorted[i + 1] {
            continue
        }
    }
    
    return res
}


var list = [-1, 0, 1, 2, -1, -4]
compute3Sum(list)

//: Playground - noun: a place where people can play

import UIKit

/*
 3Sum Closest
 
 Given an array S of n integers, find three integers in S such that the sum is closest to a given number, target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
 
 For example, given array S = {-1 2 1 -4}, and target = 1.
 The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 */

func compute3SumClosest(list:[Int], _ target:Int) -> Int {
    if list.count <= 3 {
        return list.reduce(0, combine: {$0+$1})
    }
    
    var sorted = list.sort()
    var res = sorted[0] + sorted[1] + sorted[2]
    
    for i in 0..<sorted.count - 2 {
        var j = i + 1
        var k = sorted.count - 1
        while j < k {
            let sum = sorted[i] + sorted[j] + sorted[k]
            if abs(sum - target) < abs(res - target) {
                res = sum
                if res == target {
                    return res
                }
            }
            
            sum > target ? k-- : j++
        }
    }
    
    return res
}



var list = [-1,2,1,-4]
var target = 1

compute3SumClosest(list, target)

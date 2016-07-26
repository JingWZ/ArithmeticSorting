//: Playground - noun: a place where people can play

import UIKit

/*
Given an array S of n integers, are there elements a, b, c, and d in S such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.

Note: The solution set must not contain duplicate quadruplets.

For example, given array S = [1, 0, -1, 0, -2, 2], and target = 0.

A solution set is:
[
[-1,  0, 0, 1],
[-2, -1, 1, 2],
[-2,  0, 0, 2]
]
 
 */

func compute4Sum(list: [Int]) -> Array<Array<Int>> {
    let sorted = list.sort()
    let count = sorted.count
    var res = Array<Array<Int>>()
    let target = 0
    
    for i in 0..<count - 3 {
        if i > 0 && sorted[i] == sorted[i - 1] {continue}
        if sorted[i] + sorted[i + 1] + sorted[i + 2] + sorted[i + 3] > target {break}
        if sorted[i] + sorted[count - 1] + sorted[count - 2] + sorted[count - 3] < target {continue}
        
        for j in (i+1)..<count - 2 {
            if j > i + 1 && sorted[j] == sorted[j - 1] {continue}
            if sorted[i] + sorted[j] + sorted[j + 1] + sorted[j + 2] > target {break}
            if sorted[i] + sorted[j] + sorted[count - 1] + sorted[count - 2] < target {continue}
            
            var m = j + 1
            var n = count - 1
            while m < n {
                let t = sorted[i] + sorted[j] + sorted[m] + sorted[n]
                if t > 0 {
                    while (m < n && sorted[n] == sorted[n-1]) { n = n - 1 }
                    n = n - 1
                } else if t < 0 {
                    while (m < n && sorted[m] == sorted[m+1]) { m = m + 1 }
                    m = m + 1
                } else {
                    let r = [sorted[i], sorted[j], sorted[m], sorted[n]]
                    res.append(r)
                    while (m < n && sorted[n] == sorted[n-1]) { n = n - 1 }
                    while (m < n && sorted[m] == sorted[m+1]) { m = m + 1 }
                    n = n - 1
                    m = m + 1
                }
            }
        }
    }
    
    return res
}

var list = [1, 0, -1, 0, -2, 2]
compute4Sum(list)


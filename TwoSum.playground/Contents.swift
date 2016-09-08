//: Playground - noun: a place where people can play


/*
Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution.

Example:
Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].

*/

import UIKit


func twoSum(list:[Int], _ target: Int) -> [Int] {
    var res = [Int]()
    
    if list.count != 0 {
        let sortedList = list.sort()
        let count = sortedList.count
        
        var i = 0
        var j = count - 1
        while i < j {
            if sortedList[i] > target {
                break
            }
            
            let cur = sortedList[i] + sortedList[j]
            if cur > target {
                j -= 1
            } else if cur < target {
                i += 1
            } else {
                res.append(i)
                res.append(j)
                break
            }
        }
    }
    
    return res;
}



let list = [2, 7, 11, 15]
let target = 9
let res = twoSum(list, target)

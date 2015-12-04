//
//  main.swift
//  ArithmeticSorting
//
//  Created by benlaijw on 15/11/30.
//  Copyright © 2015年 com.jing. All rights reserved.
//

import Foundation

print("Hello, World!")

func randomList(count: Int) -> [Int] {
    
    let max = 100
    if count > max {
        assertionFailure()
    }
    
    var randomList = [Int]()
    for _ in 1...count {
        let random = Int(arc4random()) % max
        randomList.append(random)
    }
    
    print("randomList:\(randomList)")
    
    return randomList
}

let originalList = randomList(10)

func bubbleSorting() {
    
    var sortedList = originalList
    var lastSortedIndex = sortedList.count - 1 // for skipping sorted elements
    var swapped = false // for not sorting while no swapping in previous turn
    
    repeat {
        swapped = false
        let count = lastSortedIndex
        for var index = 0; index < count; index++ {
            var a = sortedList[index]
            var b = sortedList[index + 1]
            
            if a > b {
                swap(&a, &b)
                sortedList[index] = a
                sortedList[index + 1] = b
                swapped = true
                lastSortedIndex = index
            }
        }
    } while swapped
    
    print("sortedList:\(sortedList)")
}

//bubbleSorting()

func selectSorting() {
    
    var sortedList = originalList
    var lastSortedIndex = 0
    
    while lastSortedIndex < sortedList.count {
        var minimumIndex:Int = lastSortedIndex
        for var index = lastSortedIndex; index < sortedList.count; index++ {
            let a = sortedList[index]
            if a < sortedList[minimumIndex] {
                minimumIndex = index
            }
        }
        let min = sortedList[minimumIndex]
        sortedList[minimumIndex] = sortedList[lastSortedIndex]
        sortedList[lastSortedIndex] = min
        
        lastSortedIndex++
    }
    print("selectSorting:\(sortedList)")
}

//selectSorting()

func insertSorting() {
    
    var sortedList = originalList
    
    var lastSortedIndex = 1
    while lastSortedIndex < sortedList.count {

        var tmp = lastSortedIndex
        for var i = lastSortedIndex - 1; i >= 0; i-- {
            let v = sortedList[tmp]
            if sortedList[i] > v {
                sortedList.removeAtIndex(tmp)
                sortedList.insert(v, atIndex: i)
                tmp = i
            }
        }
        lastSortedIndex++
    }
    print("insertSorting:\(sortedList)")
}

//insertSorting()

func mergeSorting(list: [Int]) -> [Int] {
    if list.count <= 1 {
        return list
    }
    
    let sep = list.count / 2
    let l = Array(list[0..<sep])
    let r = Array(list[sep..<list.count])
    
    //print("left:\(l)")
    //print("right:\(r)")
    
    let left = mergeSorting(l)
    let right = mergeSorting(r)
    let mergea = merge(left: left, right: right)
    
    print("merge:\(mergea)")
    
    return mergea
}

func merge(left left: [Int], right: [Int]) -> [Int] {
    
    var l = 0
    var r = 0
    var result = [Int]()
    
    while l < left.count && r < right.count {
        if left[l] < right[r] {
            result.append(left[l])
            l++
        } else {
            result.append(right[r])
            r++
        }
    }
    result += Array(left[l..<left.count])
    result += Array(right[r..<right.count])
    
    return result
}

//mergeSorting(originalList)








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
    var count = sortedList.count // for skipping sorted elements
    var swapped = false // for not sorting while no swapping in previous turn
    
    repeat {
        swapped = false
        for var index = 0; index < count - 1; index++ {
            var a = sortedList[index]
            var b = sortedList[index + 1]
            
            if a > b {
                swap(&a, &b)
                sortedList[index] = a
                sortedList[index + 1] = b
                swapped = true
            }
        }
        count--
    } while swapped
    
    print("sortedList:\(sortedList)")
}

bubbleSorting()


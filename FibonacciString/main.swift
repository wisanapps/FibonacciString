//
//  main.swift
//  FibonacciString
//
//  Created by Wisan Janchot on 19/8/2560 BE.
//  Copyright © 2560 CoalaApps. All rights reserved.
//

import Foundation

// f(0) = 0
// f(1) = 1
// f(n) = f(n-1) + f(n-2)
// n    = 0, 1, 2, 3, 4, 5, 6,  7,  8,  9, 10,...
// f(n) = 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55,...

func addNumberInString(s1: String, s2: String) -> String {
    var totalString = ""
    var carry = 0
    
    var numString1 = s1
    var numString2 = s2
    
    // As manual calculation, longer number should on the top.
    // 1111111110  carry
    //          +
    //  999999999
    //          +
    //  000000001
    // ----------
    // 1000000001
    //
    if numString1.count < numString2.count {
        let temp = numString1
        numString1 = numString2
        numString2 = temp
    }
    
    let lenght = numString1.count
    
    while lenght != numString2.count {
        numString2 = "0" + numString2
    }
    
    for _ in 0..<lenght {
        if let n1 = Int(String(numString1.removeLast())), let n2 = Int(String(numString2.removeLast())) {
            let sum = n1 + n2 + carry
            if sum > 9 {
                carry = 1
                totalString = String(sum - 10) + totalString
            } else {
                carry = 0
                totalString = String(sum) + totalString
            }
        }
    }
    
    if carry == 1 {
        totalString = "1" + totalString
    }
    
    return totalString
}

func fibonacciString(sN: String) -> String {
    guard let n = UInt(sN) else { return ""}
    var first = "0"
    var second = "1"
    var next = ""
    
    for j in 0...n {
        if j <= 1 {
            next = String(j)
        } else {
            next = addNumberInString(s1: first, s2: second)
            first = second
            second = next
        }
    }
    
    return next
}

let result = fibonacciString(sN: CommandLine.arguments[1])
print(result)

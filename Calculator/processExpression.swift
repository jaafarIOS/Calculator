//
//  processExpression.swift
//  Calculator
//
//  Created by Consultant on 1/17/23.
//

import Foundation
struct process {
    func processExpression(exp:[String]) -> String {
        
        if exp.count < 3 {
            // Less than 3 means that expression doesnt contain the 2nd no.
            return "0.0"
        }
        
        var a = Double(exp[0])  // Get the first no
        var c = Double("0.0")   // Init the second no
        let expSize = exp.count
        
        for i in (1...expSize-2) {
            
            c = Double(exp[i+1])
            
            switch exp[i] {
            case "+":
                a! += c!
            case "−":
                a! -= c!
            case "×":
                a! *= c!
            case "÷":
                a! /= c!
            default:
                print("skipping the rest")
            }
        }
        
        return String(format: "%.1f", a!)
    }
}

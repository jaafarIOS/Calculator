//
//  ContentView.swift
//  Calculator
//
//  Created by Consultant on 1/17/23.
//

import SwiftUI

struct ContentView: View {
    
    // Array with button titles for each
    let rows = [
        ["A/C", "+/-", "%", "/"],
        ["7", "8", "9", "X"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]
    
    // ... @Stack variales are defined here
 
    @State var finalValue:String = "Welcom In Here"
      
      // This holds the expression which has been entered by the user.
      @State var calExpression: [String] = []
    @State var calExpression1: [String] = []
    @State var noBeingEntered: String = "" //This will save the number which our user is entering.
    func processExpression(exp:[String]) -> String {
        
        if exp.count < 3 {
            // Less than 3 means that expression doesnt contain the 2nd no.
            return "0.0"
        }
        
        var a = Double(exp[0])  // Get the first no
        var c = Double("0.0")   // Init the second no
        let expSize = exp.count
        
        for i in (1...expSize-2) {
            
            guard let c = Double(exp[i+1]) else { return "" }
            
            //guard let c = c else { return }
            
            
            
            switch exp[i] {
            case "+":
                a! += c
            case "-":
                a! -= c
            case "X":
                a! *= c
            case "/":
                a! /= c
            case "A/C":
                a! = 0.0
            case "%":
                a! = (c * 100) / 100
            case "+/-":
                a! = c * -1
            default:
                print("skipping the rest")
            }
        }
        
        return String(format: "%.1f", a!)
    }
    
    var body: some View {
        VStack {
            VStack {
                
                Text(self.finalValue)
                    .font(Font.custom("HelveticaNeue-Thin", size: 50))
                    .bold()

                    //.font(Font.custom("HelveticaNeue-Thin", size: 40))
                         .frame(idealWidth: 200, maxWidth: .infinity, idealHeight: 200, maxHeight: .infinity, alignment: .bottomTrailing)
                         .foregroundColor(Color.white)
                Text(flattenTheExpression(exps: calExpression))
                    .font(Font.custom("HelveticaNeue-Thin", size: 50))
                    .frame(alignment: Alignment.bottomTrailing)
                    .foregroundColor(Color.white)
                
                // This will give a bottom padding to our Text above.
                Spacer()
            
            }
            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity, alignment: .topLeading)
            .background(ThemeColor.DarkGray.color)
            
            VStack {
                Spacer(minLength: 4)
                VStack {
                    ForEach(rows, id: \.self) { row in
                        HStack(alignment: .top, spacing: 5) {
                            ForEach(row, id: \.self) { column in
                                Button(action: {
                                    
                                    if column == "=" {
                                        self.calExpression = []
                                        self.noBeingEntered = ""
                                        return
                                    } else if checkIfOperator(str: column)  {
                                        self.calExpression.append(column)
                                        self.noBeingEntered = ""
                                    } else if checkIfOperator1(str1: column)  {
                                        self.calExpression.append(column)
                                        self.noBeingEntered = ""
                                    } else {
                                        self.noBeingEntered.append(column)
                                        if self.calExpression.count == 0 {
                                            self.calExpression.append(self.noBeingEntered)
                                        } else {
                                            if !checkIfOperator(str: self.calExpression[self.calExpression.count-1]) {
                                                self.calExpression.remove(at: self.calExpression.count-1)
                                            }
                                            
                                            self.calExpression.append(self.noBeingEntered)
                                        }
                                    }
                                    
                                    self.finalValue = processExpression(exp: self.calExpression)
                                    // This code ensures that future operations are done on evaluated result rather than evaluating the expression from scratch.
                                    if self.calExpression.count > 3 {
                                        self.calExpression = [self.finalValue, self.calExpression[self.calExpression.count - 1]]
                                    }
                                    
                                }, label: {
//                                    if Text(column) == "0" {
//                                        .foregroundColor(Color.red)
//                                    }
                                    
                                    Text(column)
                                        .font(.system(size: getFontSize(btnTxt: column)))
                                        .frame(idealWidth: 100, maxWidth: .infinity, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                                }
                                )
                                .foregroundColor(Color.white)
                                .background(getBackground(str: column))
                              
                            }
                            }
                        }
                    }
                }
            }
            .background(Color.black)
            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            .padding(SwiftUI.EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
        }
    }

enum ThemeColor {
    case DarkGray
}
extension ThemeColor {
    var color: Color {
        switch self{
        case .DarkGray:
            return Color("DarkGray")
        }
    }
}

func flattenTheExpression(exps: [String]) -> String {
    
    var calExp = ""
    for exp in exps {
        calExp.append(exp)
    }
    
    return calExp
    
}
func getBackground(str:String) -> Color {
    
    if checkIfOperator(str: str) {
        return .yellow
    } else if  checkIfOperator1(str1: str) {
        return (ThemeColor.DarkGray.color)
    }
    return Color.gray
}
//func getBackground1(str1:String) -> Color {
//
//    if checkIfOperator1(str1: str1) {
//        return .yellow
//    }
//    return .white
//}

// Return differnt font sizes for operators and numbers.
func getFontSize(btnTxt: String) -> CGFloat {
    
    if checkIfOperator(str: btnTxt) {
        return 55
    }
    return 40
    
}

// This function returns if the passed argument is a operator or not.
func checkIfOperator(str: String) -> Bool {
    
    if str == "/" || str == "X" || str == "-" || str == "+" || str == "=" {
        return true
    }
    
    return false
    
}
func checkIfOperator1(str1: String) -> Bool {

    if str1 == "A/C" || str1 == "+/-" || str1 == "%" {
        return true
    }

    return false

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

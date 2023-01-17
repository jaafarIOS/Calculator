//
//  ContentView.swift
//  Calculator
//
//  Created by Consultant on 1/17/23.
//

import SwiftUI

struct ContentView: View {
// the Result
    @State var finalValue:String = "DigitalCurry Recipe"
// User insert
    @State var calExpression: [String] = []

    var body: some View {
        VStack {
            VStack {
                Text(self.finalValue)
                    .font(Font.custom("HelveticaNeue", size: 50))
                    .frame(idealWidth: 100, maxWidth: .infinity, idealHeight: 100,maxHeight: .infinity, alignment: .center)
                    .foregroundColor(Color.white)
                Text(flattenTheExpression(exps: calExpression))
                                    .font(Font.custom("HelveticaNeue-Thin", size: 24))
                                    .frame(alignment: Alignment.bottomTrailing)
                                    .foregroundColor(Color.white)
                
                Spacer()
                
                
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity, alignment: .leading)
                .background(.blue)
            VStack {
            }
            .background(Color.black)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 414, maxHeight: .infinity, alignment: .leading)
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

func flattenTheExpression(exps: [String]) -> String{
    var calExp = ""
    for exp in exps {
        calExp.append(exp)
    }
    return calExp
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

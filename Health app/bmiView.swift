//
//  bmiView.swift
//  Health app
//
//  Created by sniper1239408 on 23/06/24.
//

import SwiftUI

struct bmiView: View {
    @State private var height = ""
    @State private var inch = ""
    @State private var const1 = 1
    @State private var output1 = ""
    @State private var weight  = ""
    @State private var const2 = 1
    @State private var output2 = ""
    @State private var alert1 = false
    @State private var alert2 = false
    var body: some View {
        Text("Convert height and weight units")
            .font(.largeTitle)
            .multilineTextAlignment(.center)
        Spacer()
        VStack {
            HStack {
                if const1 == 1 {
                    TextField("Enter height in m", text: $height)
                        .padding(.all, 10.0)
                        .background(.gray)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                        .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                
                }
                else {
                    TextField("ft", text: $height)
                        .padding(.all, 10.0)
                        .background(.gray)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                        .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                    TextField("in", text: $inch)
                        .padding(.all, 10.0)
                        .background(.gray)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                        .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                    
                }
                Picker(selection: $const1, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                                        Text("m").tag(1)
                                        Text("ft & in").tag(2)
                }
            }
            .padding(.horizontal)
            Text(output1)
                .alert("Error: Incorrect values inserted in text box (or 0), please enter numbers only!", isPresented: $alert1){
                    Button("OK", role: .cancel) { }
                }
            if const1 == 1 {
                Button("Convert to ft & in") {
                    let test = Float(height) ?? 0
                    if test == 0 {
                       alert1 = true
                    }
                    else {
                        let ftin = metersToFeetAndInches(meters: Float(height) ?? 0)
                        output1 = "\(ftin.0)ft, \(round(ftin.1 * 10) / 10)in"
                    }
                }
                .padding(.all, 10.0)
                .background(.teal)
                .foregroundColor(.black)
                .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
            }
            else {
                Button("Convert to m") {
                    let test1 = Float(height) ?? 0
                    let test2 = Float(inch) ?? -616
                    if test1 == 0 {
                        alert1 = true
                    }
                    else if test2 == -616 {
                        if inch == "-616" {
                            alert2 = true
                        }
                        else {
                            alert1 = true
                        }
                    }
                    else{
                        let m = feetAndInchesToMeters(feet: Float(height) ?? 0, inches: Float(inch) ?? 0)
                        output1 = "\(round(m * 100) / 100)m"
                    }
                }
                .padding(.all, 10.0)
                .background(.teal)
                .foregroundColor(.black)
                .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
            }
            
        }
        Spacer()
        VStack {
            HStack {
                if const2 == 1 {
                    TextField("Enter weight in kg", text: $weight)
                        .padding(.all, 10.0)
                        .background(.gray)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                        .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                }
                else {
                    TextField("Enter weight in lbs", text: $weight)
                    .padding(.all, 10.0)
                    .background(.gray)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                }
                Picker(selection: $const2, label: Text("Picker")) {
                    Text("kg").tag(1)
                    Text("lbs").tag(2)
                }
            }
            .padding(.horizontal)
            Text(output2)
                .alert("You found the secret number! :D", isPresented: $alert2){
                    Button("Nice!", role: .cancel) { }
                }
            if const2 == 1 {
                Button("Convert to lbs") {
                    let test = Float(weight) ?? 0
                    if test == 0 {
                        alert1 = true
                    }
                    else {
                        let lbs = (Float(weight) ?? 0) * 2.20462262
                        output2 = "\(round(lbs * 10) / 10)lbs"
                    }
                }
                .padding(.all, 10.0)
                .background(.teal)
                .foregroundColor(.black)
                .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
            }
            else {
                Button("Convert to kg") {
                    let test = Float(weight) ?? 0
                    if test == 0 {
                        alert1 = true
                    }
                    else {
                        let kg = (Float(weight) ?? 0) * 0.4535924
                        output2 = "\(round(kg * 10) / 10)kg"
                    }
                }
                .padding(.all, 10.0)
                .background(.teal)
                .foregroundColor(.black)
                .cornerRadius(12.0)
            }
        }
        Spacer()
    }
    func feetAndInchesToMeters(feet: Float, inches: Float) -> Float {
        let feetToMeters = feet * 0.3048
        let inchesToMeters = inches * 0.0254
        let totalMeters = feetToMeters + inchesToMeters
        return totalMeters
    }
    func metersToFeetAndInches(meters: Float) -> (feet: Int, inches: Float) {
        let totalInches = meters / 0.0254
        let feet = Int(totalInches / 12)
        let inches = totalInches.truncatingRemainder(dividingBy: 12)
        return (feet, inches)
    }
}
#Preview {
    bmiView()
}

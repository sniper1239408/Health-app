//
//  converterView.swift
//  Health app
//
//  Created by sniper1239408 on 23/06/24.
//

import SwiftUI

struct converterView: View {
    @State private var kg = ""
    @State private var mtr = ""
    @State private var bmiNoText = ""
    @State private var category = ""
    @State private var presentAlert = false
    @State private var presentAlert2 = false
    @State private var presentAlert3 = false
    var body: some View {
        VStack {
            Spacer()
            Text("Enter weight in KG and height in meters")
                .font(.title)
                .multilineTextAlignment(.center)
            Spacer()
            VStack {
                TextField("Enter weight in KG", text: $kg)
                    .padding(.all, 10.0)
                    .background(.gray)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                TextField("Enter height in m", text: $mtr)
                    .padding(.all, 10.0)
                    .background(.gray)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
            }
            .padding()
            Spacer()
            Image("bmi")
                .resizable(resizingMode: .stretch)
                .frame(width: 250, height: 250)
            Spacer()
            Button("Calculate BMI") {
                let sqrmtr = (Float(mtr) ?? 0) * (Float(mtr) ?? 0)
                let bmi = (Float(kg) ?? 0) / Float(sqrmtr)
                if bmi == 0.0 {
                    bmiNoText = "Your BMI: \(bmi)"
                    category = "Category: Unknown"
                    presentAlert2 = true
                }
                else if String(bmi) == "nan" {
                    presentAlert = true
                }
                else if String(bmi) == "inf" {
                    presentAlert = true
                }
                else {
                    bmiNoText = "Your BMI: \(bmi)"
                    switch bmi {
                        case 1...18.5:
                            category = "Category: Underweight"
                        case 18.5...24.9:
                            category = "Category: Healthy"
                        case 25.0...29.9:
                            category = "Category: Overweight"
                        case 30.0...70:
                            category = "Category: Obese"
                        default:
                            category = "Category: Unknown"
                    }
                    if category == "Category: Unknown" {
                        presentAlert3 = true
                    }
                }
            }
            .padding(.all, 10.0)
            .background(.teal)
            .foregroundColor(.black)
            .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
            .alert("Error: Incorrect values inserted in text box, please enter numbers only!", isPresented: $presentAlert){
                Button("OK", role: .cancel) { }
            }
            Spacer()
            Text("\(bmiNoText)")
                .alert("BMI is 0! This most likely means incorrect vaules entered. Please enter numbers only!", isPresented: $presentAlert2){
                    Button("OK", role: .cancel) { }
                }
            Text("\(category)")
                .alert("BMI is either too high or too low! Please make sure you have entered the correct values!", isPresented: $presentAlert3){
                                    Button("OK", role: .cancel) { }
                                }
        }
    }
}

#Preview {
    converterView()
}

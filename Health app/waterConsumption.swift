//
//  waterConsumption.swift
//  Health app
//
//  Created by sniper1239408 on 23/06/24.
//

import SwiftUI

struct waterConsumption: View {
    @State private var calculateR = ""
    @State private var glasses = 0
    @State private var presentAlert = false
    @State private var calculateR2 = ""
    var body: some View {
        VStack {
            Spacer()
            Text("Enter the amount of glasses you consume in a day")
                .font(.title)
                .multilineTextAlignment(.center)
            Text("1 glass = 250ml")
                .font(.footnote)
            Spacer()
            Stepper(value: $glasses, in: 0...999999999999) {
                Text(String(glasses))
            }
            Spacer()
            Text("\(calculateR2)")
            Button("Calculate") {
                let glassinfloat: Float = Float(glasses)
                let litre = glasses * 250
                if litre == 0 {
                    calculateR = "You do not consume any water every day."
                }
                else if litre >= 1000 {
                    let litre = glassinfloat * 0.25
                    calculateR = "You consume \(litre)L of water every day."
                }
                else {
                    calculateR = "You consume \(litre)ml of water every day."
                }
                presentAlert = true
            }
            .padding(.all, 10.0)
            .background(.teal)
            .foregroundColor(.black)
            .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
            .alert("\(calculateR)", isPresented: $presentAlert){
                Button("OK", role: .cancel) { 
                    calculateR2 = calculateR
                }
                }
            Spacer()
            
                
        }
        .padding(.horizontal, 20)
        
        
        
    }
}

#Preview {
    waterConsumption()
}

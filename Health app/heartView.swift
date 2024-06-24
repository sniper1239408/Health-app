//
//  heartView.swift
//  Health app
//
//  Created by sniper1239408 on 23/06/24.
//

import SwiftUI
import Foundation

struct heartView: View {
    @State private var buttontext = "Start"
    @State private var timer: Timer?
    @State private var number = 0
    @State private var elapsedTime = 0
    @State private var isRunning = false
    @State private var sscolor = Color(.green)
    @State private var pulse = 0
    @State private var bpmtext = ""
    var body: some View {
        VStack {
            Spacer()
            Text("Click start and count the pulse for 10 seconds")
                .font(.title)
                .multilineTextAlignment(.center)
            Spacer()
            HStack {
                Spacer()
                Button(buttontext) {
                if isRunning {
                    resetTimer()
                    }
                    else {
                    buttontext = "Reset"
                    sscolor = Color(.red)
                    startTimer()
                    }
                }
                .padding(.all, 8.0)
                .background(sscolor)
                .foregroundColor(.black)
                .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
                
                Spacer()
                Text(String(number))
                Spacer()
            }
            
            Spacer()
            Text("Input pulse below")
                .font(.title3)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Spacer()
            Stepper(value: $pulse, in: 0...100) {
                Text("\(pulse)")
            }
            Spacer()
            Text(bpmtext)
            Button("Calculate BPM") {
                let bpm = pulse * 6
                bpmtext = "\(bpm) BPM"
            }
            .padding(.all, 8.0)
            .background(.teal)
            .foregroundColor(.black)
            .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
        }
        .padding()
    }
    
    func startTimer() {
            isRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                if self.elapsedTime < 10 {
                    self.elapsedTime += 1
                    number = elapsedTime
                } else {
                    self.resetTimer()
                }
            }
        }
        func resetTimer() {
            isRunning = false
            timer?.invalidate()
            timer = nil
            buttontext = "Start"
            sscolor = Color(.green)
            elapsedTime = 0
            number = 0
        }
}



#Preview {
    heartView()
}

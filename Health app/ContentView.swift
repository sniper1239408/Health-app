//
//  ContentView.swift
//  Health app
//
//  Created by sniper1239408 on 23/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showItems: Bool = false
    var body: some View {
        
        if showItems == false {
            ZStack(alignment: .top) {
                Text("Welcome to the health app!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
            }
            .frame(minWidth: 0, maxHeight: 400, alignment: .topLeading)
            
            Button("Go!") {
                showItems = true
            }
            .padding(.all, 10.0)
            .background(.teal)
            .foregroundColor(.black)
            .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
            
        }
        else {
            itemsView()
        }
        
        }
    
}



#Preview {
    ContentView()
}

//
//  itemsView.swift
//  Health app
//
//  Created by sniper1239408 on 23/06/24.
//

import SwiftUI

struct itemsView: View {
    var body: some View {
        NavigationStack {
        List {
        NavigationLink("Water consumption") {
            waterConsumption()
        }
        NavigationLink("BMI") {
            converterView()
        }
        NavigationLink("Heart Rate") {
            heartView()
        }
        NavigationLink("Height weight converter") {
            bmiView()
        }
        }
        .navigationTitle("Health app")
        }
                
        }
}


#Preview {
    itemsView()
}

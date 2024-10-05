//
//  ContentView.swift
//  BetterRest
//
//  Created by Alexander Ostrovsky on 5/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    
    var body: some View {
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
            .labelsHidden()
    }
    
    func exampleDates() {
        let tomorrow = Date.now.addingTimeInterval(60 * 60 * 24)
        let range = Date.now...tomorrow
    }
}

#Preview {
    ContentView()
}

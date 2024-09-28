//
//  ContentView.swift
//  WeSplit
//
//  Created by Alexander Ostrovsky on 28/9/2024.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}

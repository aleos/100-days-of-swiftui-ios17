//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Alexander Ostrovsky on 3/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .titleStyle()
        Color.blue
            .frame(width: 200, height: 200)
            .watermarked(with: "Hacking with SwiftUI")
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Alexander Ostrovsky on 3/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}

#Preview {
    ContentView()
}

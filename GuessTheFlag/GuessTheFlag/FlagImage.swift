//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Alexander Ostrovsky on 4/10/2024.
//

import SwiftUI

struct FlagImage: View {
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    var body: some View {
        Image(name)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

#Preview {
    FlagImage("UK")
}

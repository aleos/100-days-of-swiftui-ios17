//
//  TitleModifier.swift
//  ViewsAndModifiers
//
//  Created by Alexander Ostrovsky on 4/10/2024.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundStyle(.blue)
    }
}

extension View {
    public func title() -> some View {
        modifier(TitleModifier())
    }
}

#Preview {
    Text("Hello, World!")
        .title()
}

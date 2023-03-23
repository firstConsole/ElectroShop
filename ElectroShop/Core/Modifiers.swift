//
//  Modifiers.swift
//  ElectroShop
//
//  Created by Алексей Артамонов on 21.03.2023.
//

import SwiftUI

struct Specifications: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.leading, 40)
            .font(Font.system(size: 24))
            .bold()
    }
}

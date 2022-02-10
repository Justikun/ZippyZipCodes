//
//  TextFieldStyles.swift
//  ZippyZipCodes
//
//  Created by Justin Lowry on 2/10/22.
//

import SwiftUI

// Oval text fields
struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(Color.textFieldColor)
            .cornerRadius(20)
            .shadow(color: .unbleachedSilkShadow,
                    radius: 2,
                    x: 0,
                    y: 2)
    }
}

//
//  ViewExtension.swift
//  ZippyZipCodes
//
//  Created by Justin Lowry on 2/10/22.
//

import SwiftUI

// Hide/unhide
extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}

// Text limiter
extension View {
    func limitInputLength(value: Binding<String>, length: Int) -> some View {
        self.modifier(TextLimiter(value: value, length: length))
    }
}

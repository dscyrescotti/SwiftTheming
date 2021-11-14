//
//  Color++.swift
//  Example
//
//  Created by Dscyre Scotti on 08/11/2021.
//

import SwiftUI

#if os(macOS)
typealias _Color = NSColor
#else
typealias _Color = UIColor
#endif

extension Color {
    public init(hex: Int) {
        self.init(_Color(hex: hex))
   }
}

extension _Color {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}

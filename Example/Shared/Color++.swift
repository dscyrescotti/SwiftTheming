//
//  Color++.swift
//  Example
//
//  Created by Dscyre Scotti on 08/11/2021.
//

import SwiftUI

extension Color {
    public init(hex: Int) {
        self.init(UIColor(hex: hex))
   }
}

extension UIColor {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}

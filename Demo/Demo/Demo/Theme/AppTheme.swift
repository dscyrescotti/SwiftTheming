//
//  AppTheme.swift
//  Demo
//
//  Created by Dscyre Scotti on 6/10/23.
//

import SwiftUI
import SwiftTheming

@Themeable
public enum AppTheme: String {
    case minimalistic

    public var id: String {
        self.rawValue
    }

    public func theme() -> AnyTheme {
        switch self {
        case .minimalistic:
            return MinimalisticTheme().eraseToAnyTheme()
        }
    }
}

@AddTheme(AppTheme.self)
extension Font { }
@AddTheme(AppTheme.self)
extension Color { }
@AddTheme(AppTheme.self)
extension Image { }
@AddTheme(AppTheme.self)
extension Gradient { }

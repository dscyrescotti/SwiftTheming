//
//  MainApp.swift
//  Shared
//
//  Created by Dscyre Scotti on 02/11/2021.
//

import SwiftUI
import SwiftTheming

@main
struct MainApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .themeProviding()
                #if os(macOS)
                .frame(width: 400, height: 300)
                #endif
        }
    }
}

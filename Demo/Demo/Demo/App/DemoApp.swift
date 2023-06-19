//
//  DemoApp.swift
//  Demo
//
//  Created by Dscyre Scotti on 6/9/23.
//

import SwiftUI

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .themeEnvironment(AppTheme.dynamic("aura_theme"))
//                .onAppear {
//                    print("DEBUG:", AppTheme.Asset().identifier)
//                    print(#file)
//                }
        }
    }
}

//
//  ContentView.swift
//  Demo
//
//  Created by Dscyre Scotti on 6/9/23.
//

import SwiftUI
import SwiftTheming

struct ContentView: View {
    @ThemeEnvironment var theme
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .font(Font(asset: .empty))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


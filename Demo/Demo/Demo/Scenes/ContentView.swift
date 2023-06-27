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
            Text("Hello, world!")
                .font(Font(asset: .heading))
        }
        .padding()
        .foregroundStyle(Color(asset: .primaryBody))
        .background(Color(asset: .primaryBackground))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image(asset: .mainBackground))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//
//  ContentView.swift
//  Shared
//
//  Created by Dscyre Scotti on 02/11/2021.
//

import SwiftUI
import SwiftTheming

struct ContentView: View {
    @EnvironmentObject var themeProvider: ThemeProvider<Theme>
    @State private var isShowing: Bool = false
    @State private var theme: Theme? = nil
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                NavigationView {
                    Text("Welcome to SwiftTheming")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(content: {
                            
                        })
                        .background(themeProvider.color(for: .backgroundColor))
                        .navigationTitle("")
                }
                .onReceive(themeProvider.objectWillChange, perform: { _ in
                    self.theme = themeProvider.theme
                })
                .overlay(alignment: .bottom, content: {
                    Button(action: {
                        withAnimation(.spring()) {
                            isShowing.toggle()
                        }
                    }) {
                        Color.white
                            .frame(width: 30, height: 30)
                            .mask(
                                Image("palette")
                                    .resizable()
                            )
                            .padding()
                            .background(themeProvider.color(for: .accentColor))
                            .clipShape(Circle())
                    }
                    .padding()
                })
//                Color.clear
//                    .background(Material.ultraThinMaterial)
//                    .transition(.opacity)
//                    .onTapGesture {
//                        withAnimation(.spring()) {
//
//                        }
//                    }
            }
        }
    }
}

//struct ContentView: View {
//    @State private var isShowing: Bool = false
//    @State private var isChanging: Bool = false
//    @State private var isOverlaying: Bool = false
//    @ScaledMetric(relativeTo: .title3) var imageSize: CGFloat = 20
//    @EnvironmentObject var themeProvider: ThemeProvider<Theme>
//    var body: some View {
//        GeometryReader { proxy in
//            ZStack {
//                NavigationView {
//                    Color.clear
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        .background {
//                            ZStack(alignment: .bottomTrailing) {
//                                if isOverlaying {
//                                    let size = max(proxy.size.height, proxy.size.width) * 2.5
//                                    themeProvider.color(for: .backgroundColor)
//                                        .frame(width: isChanging ? size : 30, height: isChanging ? size : 30)
//                                        .padding()
//                                        .background(.blue)
//                                        .clipShape(Circle())
//                                        .transition(.opacity)
//                                }
//                            }
//                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
//                            .padding()
//                        }
//                        .navigationTitle("SwiftTheming")
//                }
//                .overlay(alignment: .bottomTrailing, content: {
//                    Button(action: {
//                        withAnimation(.spring()) {
//                            isShowing.toggle()
//                        }
//                        isOverlaying.toggle()
//                    }) {
//                        Color.white
//                            .frame(width: 30, height: 30)
//                            .mask(
//                                Image("palette")
//                                    .resizable()
//                            )
//                            .padding()
//                            .background(Color.blue)
//                            .clipShape(Circle())
//                    }
//                    .padding()
//                })
//                if isShowing {
//                    Color.clear
//                        .background(Material.ultraThinMaterial)
//                        .transition(.opacity)
//                        .onTapGesture {
//                            withAnimation(.spring()) {
//                                isShowing.toggle()
//                            }
//                            isOverlaying.toggle()
//                        }
//                        .zIndex(1)
//                }
//                if isShowing {
//                    VStack {
//                        HStack {
//                            Label(title: {
//                                Text("Color Themes")
//                                    .font(.title3.bold())
//                            }, icon: {
//                                Image("palette")
//                                    .resizable()
//                                    .frame(width: imageSize, height: imageSize)
//                            })
//                            Spacer()
//                            Button(action: {
//                                withAnimation(.spring()) {
//                                    isShowing.toggle()
//                                }
//                                isOverlaying.toggle()
//                            }) {
//                                Image(systemName: "xmark")
//                                    .font(.headline.bold())
//                            }
//                            .foregroundColor(.primary)
//                        }
//                        ScrollView(.vertical, showsIndicators: false) {
//                            VStack {
//                                ForEach(0..<10) { index in
//                                    Text("hello \(index)")
//                                }
//                            }
//                        }
//                        Button(action: {
//                            withAnimation(.spring()) {
//                                isShowing.toggle()
//                            }
//                            withAnimation(.spring().delay(0.4)) {
//                                isChanging.toggle()
//                            }
//                            withAnimation(.spring().delay(1)) {
//                                isOverlaying.toggle()
//                                isChanging.toggle()
//                            }
//
//                        }) {
//                            Text("Done")
//                                .foregroundColor(.primary)
//                                .colorInvert()
//                                .frame(maxWidth: .infinity)
//                                .padding(.vertical, 10)
//                                .background(.green)
//                                .clipShape(Capsule())
//                        }
//                    }
//                    .padding()
//                    .frame(maxWidth: 400, maxHeight: 500)
//                    .background(.background)
//                    .cornerRadius(20)
//                    .padding(.all, 30)
//                    .compositingGroup()
//                    .transition(.opacity.combined(with: .move(edge: .bottom)))
//                    .zIndex(2)
//                }
//            }
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


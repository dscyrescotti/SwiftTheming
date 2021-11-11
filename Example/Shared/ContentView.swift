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
    @State private var selectedTheme: Theme? = nil
    @ScaledMetric(relativeTo: .title3) var imageSize: CGFloat = 20
    
    @State private var size: CGFloat = 50
    @State private var offset: CGFloat = 60
    
    let themes: [Theme] = .themes
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                NavigationView {
                    Text("Welcome to SwiftTheming")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(content: {
                            let y = proxy.size.height - proxy.safeAreaInsets.top - proxy.safeAreaInsets.bottom - offset
                            Color.clear
                                .frame(width: size, height: size)
                                .padding(10)
                                .background(themeProvider.color(for: .backgroundColor, on: theme))
                                .clipShape(Circle())
                                .ignoresSafeArea()
                                .position(x: proxy.frame(in: .local).midX, y: y)
                        })
                        .background {
                            themeProvider.color(for: .backgroundColor)
                                .ignoresSafeArea()
                        }
                        .navigationTitle("")
                }
                .onReceive(themeProvider.$theme, perform: { theme in
                    self.theme = theme
                })
                .overlay(alignment: .bottom, content: {
                    Button(action: {
                        withAnimation(.spring()) {
                            isShowing.toggle()
                        }
                    }) {
                        themeProvider.color(for: .contentColor)
                            .frame(width: 50, height: 50)
                            .mask(
                                Image("palette")
                                    .resizable()
                                    .padding(5)
                            )
                            .padding(10)
                            .background(themeProvider.color(for: .accentColor, on: theme))
                            .clipShape(Circle())
                    }
                    .padding(10)
                })
                if isShowing {
                    GeometryReader { geometry in
                        VStack(spacing: 20) {
                            HStack {
                                Spacer()
                                Button(action: {
                                    withAnimation(.spring()) {
                                        isShowing.toggle()
                                    }
                                }) {
                                    Image(systemName: "xmark")
                                        .font(.title2.bold())
                                }
                                .foregroundColor(.primary)
                            }
                            ScrollView(.vertical, showsIndicators: false) {
                                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)) {
                                    ForEach(themes, id: \.self) { theme in
                                        ThemeView(theme: theme, selectedTheme: $selectedTheme)
                                    }
                                }
                            }
                            Button(action: {
                                doneTrigger(height: max(proxy.size.height, proxy.size.width))
                            }) {
                                Text("Done")
                                    .font(.headline.bold())
                                    .foregroundColor(themeProvider.color(for: .contentColor))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 10)
                                    .background(themeProvider.color(for: .accentColor))
                                    .clipShape(Capsule())
                            }
                        }
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .compositingGroup()
                    .transition(.opacity)
                    .zIndex(1)
                    .edgesIgnoringSafeArea([])
                }
            }
            .onAppear {
                selectedTheme = themeProvider.theme
            }
        }
    }
    
    func doneTrigger(height: CGFloat) {
        withAnimation(.spring()) {
            isShowing.toggle()
        }
        if let theme = selectedTheme, theme != self.theme {
            withAnimation(.linear.delay(0.3)) {
                self.theme = theme
            }
            withAnimation(.linear(duration: 1).delay(0.3)) {
                size = height * 1.5
            }
            withAnimation(.easeOut(duration: 0.4).delay(0.9)) {
                offset = 360
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                size = 50
                offset = 60
                themeProvider.setTheme(with: theme)
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


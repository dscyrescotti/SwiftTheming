//
//  ContentView.swift
//  Shared
//
//  Created by Dscyre Scotti on 02/11/2021.
//

import SwiftUI
import SwiftTheming

struct ContentView: View {
    @ThemeProviding var themeProvider
    @State private var isShowing: Bool = false
    @State private var theme: Theme? = nil
    @State private var selectedTheme: Theme? = nil
    @State private var appearance: PreferredAppearance? = nil
    @State private var textAppearance: PreferredAppearance? = nil
    @ScaledMetric(relativeTo: .title3) var imageSize: CGFloat = 20
    
    @State private var size: CGFloat = 0
    @State private var offset: CGFloat = 60
    @State private var angle: CGFloat = -90
    @State private var xPosition: CGFloat = 0
    
    let themes: [Theme] = .themes
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                NavigationView {
                    mainView(proxy: proxy)
                        .background(content: {
                            let y = proxy.size.height - proxy.safeAreaInsets.bottom - offset
                            Color.clear
                                .frame(width: size, height: size)
                                .padding(10)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(
                                            GradeintAsset.backgroundGradient,
                                            appearance: appearance,
                                            theme: theme
                                        ),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .clipShape(Circle())
                                .ignoresSafeArea()
                                .position(x: proxy.frame(in: .local).midX, y: y)
                        })
                        .background {
                            LinearGradient(
                                gradient: Gradient(
                                    GradeintAsset.backgroundGradient
                                ),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .ignoresSafeArea()
                        }
                        .onAppear {
                            DispatchQueue.main.async {
                                withAnimation(.easeOut(duration: 0.6).delay(0.3)) {
                                    angle = 30
                                    xPosition = proxy.frame(in: .local).midX + 80
                                }
                            }
                        }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            appearanceButton(proxy: proxy)
                        }
                    }
                }
                .onReceive(themeProvider.$theme, perform: { theme in
                    self.theme = theme
                })
                .overlay(alignment: .bottom, content: { paletteButton })
                if isShowing { themeListView(proxy: proxy) }
            }
            .onAppear {
                selectedTheme = themeProvider.theme
                appearance = themeProvider.preferredAppearance
                textAppearance = appearance
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
                size = 0
                offset = 60
                themeProvider.setTheme(with: theme)
            }
        }
    }
    
    var paletteButton: some View {
        Button(action: {
            withAnimation(.spring()) {
                isShowing.toggle()
            }
        }) {
            Color(ColorAsset.contentColor)
                .frame(width: 50, height: 50)
                .mask(
                    Image(systemName: "paintpalette.fill")
                        .resizable()
                        .padding(5)
                )
                .padding(10)
                .background(ColorAsset.accentColor, theme: theme)
                .clipShape(Circle())
        }
        .padding(10)
    }
    
    func themeListView(proxy: GeometryProxy) -> some View {
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
                        .foregroundColor(ColorAsset.contentColor)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(ColorAsset.accentColor)
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
    
    func mainView(proxy: GeometryProxy) -> some View {
        ZStack {
            Image(ImageAsset.planetImage)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(-angle))
                    .offset(y: -proxy.frame(in: .local).midX + (1 - abs(angle / 90)) * 200 - 50 + CGFloat((angle < 0) ? 0 : -(angle / 90) * 50))
                    .rotationEffect(.degrees(angle))
                    .zIndex(0)
            Image(ImageAsset.cloudImage)
                    .resizable()
                    .frame(width: 140, height: 70)
                    .offset(x: -proxy.frame(in: .local).midX - 70 + xPosition, y: (-proxy.frame(in: .local).midX) + (1 - CGFloat(1 / 3)) * 200 - 70)
                    .zIndex(1)
            Text(textAppearance == .light ? "The Rising Sun" : "A Moonlight Stroll")
                .font(
                    FontAsset.titleFont,
                    appearance: textAppearance,
                    theme: theme
                )
                .multilineTextAlignment(.center)
                .foregroundColor(
                    ColorAsset.fontColor,
                    appearance: textAppearance,
                    theme: theme
                )
                .offset(y: 50)
                .zIndex(2)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func appearanceButton(proxy: GeometryProxy) -> some View {
        Button(action: {
            if let appearance = self.appearance {
                self.appearance = appearance == .light ? .dark : .light
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    textAppearance = self.appearance
                }
                let height = max(proxy.size.height, proxy.size.width)
                withAnimation(.linear(duration: 1).delay(0.3)) {
                    size = height * 1.5
                }
                withAnimation(.easeOut(duration: 0.4).delay(0.9)) {
                    offset = 360
                }
                withAnimation(.easeOut(duration: 0.6).delay(0.9)) {
                    angle = 90
                    xPosition = (proxy.frame(in: .local).midX + 70) * 2
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    size = 0
                    offset = 60
                    themeProvider.setPreferredAppearance(with: appearance == .light ? .dark : .light)
                    angle = -90
                    xPosition = 0
                    withAnimation(.easeOut(duration: 0.6).delay(0.1)) {
                        angle = 30
                        xPosition = proxy.frame(in: .local).midX + 80
                    }
                }
                
            }
        }) {
            Image(
                ImageAsset.planetIcon,
                appearance: appearance,
                theme: theme
            )
            .foregroundColor(ColorAsset.contentColor)
            .padding(5)
            .background(ColorAsset.accentColor)
            .clipShape(Circle())
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

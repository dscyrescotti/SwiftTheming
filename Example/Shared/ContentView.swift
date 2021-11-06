//
//  ContentView.swift
//  Shared
//
//  Created by Dscyre Scotti on 02/11/2021.
//

import SwiftUI
import SwiftTheming

struct ContentView: View {
    @State private var isShowing: Bool = false
    @ScaledMetric(relativeTo: .title3) var imageSize: CGFloat = 20
    var body: some View {
        ZStack {
            NavigationView {
                Color.clear
                    .overlay(alignment: .bottomTrailing, content: {
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
                                .background(Color.blue)
                                .clipShape(Circle())
                        }
                        .padding()
                    })
                    .navigationTitle("SwiftTheming")
            }
            if isShowing {
                Color.clear
                    .background(Material.ultraThinMaterial)
                    .transition(.opacity)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isShowing.toggle()
                        }
                    }
                    .zIndex(1)
            }
            if isShowing {
                VStack {
                    HStack {
                        Label(title: {
                            Text("Color Themes")
                                .font(.title3.bold())
                        }, icon: {
                            Image("palette")
                                .resizable()
                                .frame(width: imageSize, height: imageSize)
                        })
                        Spacer()
                        Button(action: {
                            withAnimation(.spring()) {
                                isShowing.toggle()
                            }
                        }) {
                            Image(systemName: "xmark")
                                .font(.headline.bold())
                        }
                        .foregroundColor(.primary)
                    }
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            ForEach(0..<10) { index in
                                Text("hello \(index)")
                            }
                        }
                    }
                    Button(action: {
                        
                    }) {
                        Text("Done")
                            .foregroundColor(.primary)
                            .colorInvert()
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(.green)
                            .clipShape(Capsule())
                    }
                }
                .padding()
                .frame(maxWidth: 400, maxHeight: 500)
                .background(.background)
                .cornerRadius(20)
                .padding(.all, 30)
                .compositingGroup()
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .zIndex(2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


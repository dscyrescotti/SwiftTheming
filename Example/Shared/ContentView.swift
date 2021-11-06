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
        NavigationView {
            Color.clear
                .overlay(alignment: .bottomTrailing, content: {
                    Button(action: {
                        isShowing.toggle()
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
        .overlay {
            if isShowing {
                Color.clear
                    .background(.ultraThinMaterial)
                    .transition(.opacity.animation(.spring()))
                    .onTapGesture {
                        isShowing.toggle()
                    }
            }
        }
        .overlay {
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
                            isShowing.toggle()
                        }) {
                            Image(systemName: "xmark")
                                .font(.headline.bold())
                        }
                        .foregroundColor(.primary)
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: 400, maxHeight: 500)
                .background(.background)
                .cornerRadius(20)
                .padding(.all, 30)
                .transition(AnyTransition.move(edge: .bottom).animation(.default))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


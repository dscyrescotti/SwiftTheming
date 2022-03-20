//
//  ThemeView.swift
//  Example
//
//  Created by Dscyre Scotti on 11/11/2021.
//

import SwiftUI
import SwiftTheming

struct ThemeView: View {
    @ThemeProviding<Theme> var themeProvider
    let theme: Theme
    @Binding var selectedTheme: Theme?
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 0) {
                Color(on: themeProvider, for: .backgroundColor, preferredAppearance: .light, theme: theme)
                Color(on: themeProvider, for: .backgroundColor, preferredAppearance: .dark, theme: theme)
            }
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(Color(on: themeProvider, for: .borderColor, theme: theme), lineWidth: 5)
            }
            .padding()
            Text(theme.named())
                .font(.title3.bold())
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 30)
        .overlay {
            if selectedTheme == theme {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.background, lineWidth: 4)
                    .colorInvert()
                    .opacity(0.8)
                    .padding(2)
            }
        }
        .onTapGesture {
            selectedTheme = theme
        }
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: .bluoTheme, selectedTheme: .constant(.bluoTheme))
    }
}

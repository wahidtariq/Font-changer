//
//  ContentView.swift
//  Font changer
//
//  Created by wahid tariq on 28/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var textFieldText: String = ""
    
    private var systemFonts: [Font] = [
        .title,
        .body,
        .callout,
        .footnote,
        .caption,
        .caption2,
        .headline,
        .largeTitle,
        .subheadline,
        .title2
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter your text", text: $textFieldText)
                    .textFieldStyle(.roundedBorder)
                List(systemFonts, id: \.self) { font in
                    Text(textFieldText)
                        .font(font)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                }
                .listStyle(.plain)
                
                Divider()
                
                List(RobotoFont.allCases, id: \.self) { robotoFont in
                    Text(textFieldText)
                        .font(.custom(robotoFont.rawValue, size: 19))
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                }
                .listStyle(.plain)
            }
            .padding()
            
            .navigationTitle("Font changer")
        }
    }
}

#Preview {
    ContentView()
}

enum RobotoFont: String, CaseIterable {
    case regular = "Roboto-Regular"
    case thin = "Roboto-Thin"
    case thinItalic = "Roboto-ThinItalic"
    case light = "Roboto-Light"
    case lightItalic = "Roboto-LightItalic"
    case medium = "Roboto-Medium"
    case mediumItalic = "Roboto-MediumItalic"
    case bold = "Roboto-Bold"
    case boldItalic = "Roboto-BoldItalic"
    case black = "Roboto-Black"
    case blackItalic = "Roboto-BlackItalic"
    case italic = "Roboto-Italic"
}

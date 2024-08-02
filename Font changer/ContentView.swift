//
//  ContentView.swift
//  Font changer
//
//  Created by wahid tariq on 28/07/24.
//

import SwiftUI
import SwiftUI

struct ContentView: View {
    
    @State private var textFieldText: String = ""
    
    private var fontFamilies: [FontFamily] = [
        FontFamily(name: "System", fonts: [
            .largeTitle,
            .title,
            .body,
            .callout,
            .footnote,
            .caption,
            .caption2,
            .headline,
            .subheadline,
            .title2
        ]),
        FontFamily(name: "Roboto", fonts: RobotoFont.allCases.map {
            Font.custom($0.rawValue, size: 19)
        })
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(fontFamilies, id: \.name) { fontFamily in
                    Section(header: header(for: fontFamily.name)) {
                        ForEach(fontFamily.fonts, id: \.self) { font in
                            Text(textFieldText.isEmpty ? "Example Text" : textFieldText)
                                .font(font)
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets())
                        }
                    }
                }
            }
            .listStyle(.plain)
            .padding()
            .navigationTitle("Font Changer")
        }
        .searchable(text: $textFieldText)
    }
    
    private func header(for familyName: String) -> some View {
        Text(familyName)
            .font(.custom(RobotoFont.medium.rawValue, size: 20))
            .foregroundStyle(.green.gradient)
            .padding(.leading, -20)
    }
}

struct FontFamily {
    let name: String
    let fonts: [Font]
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

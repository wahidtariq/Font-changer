//
//  ContentView.swift
//  Font changer
//
//  Created by wahid tariq on 28/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var textFieldText: String = ""
    @State private var fonts: [Font] = [
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
                List(fonts, id: \.self) { font in
                    Text(textFieldText)
                        .font(font)
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

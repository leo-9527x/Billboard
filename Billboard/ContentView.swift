//
//  ContentView.swift
//  Billboard
//
//  Created by Robert Liu on 8/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var textToDisplay: String = "Hello, Billboard!"
    @State private var fontSize: CGFloat = 24
    @State private var selectedFont: String = "Helvetica-Bold"
    @State private var fontColor: Color = Color(red: 1.0, green: 182/255, blue: 193/255)
    @State private var offsetAmount: CGFloat = 0
    @State private var geometryWidth: CGFloat = 0

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                ControlView(textToDisplay: $textToDisplay,
                            fontSize: $fontSize,
                            selectedFont: $selectedFont,
                            fontColor: $fontColor)
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        Text(textToDisplay)
                            .font(.custom(selectedFont, size: fontSize))
                            .foregroundColor(fontColor)
                            .offset(x: offsetAmount)
                            .onAppear {
                                geometryWidth = geometry.size.width
                                startAnimation(geometry.size.width)
                            }
                            .onChange(of: geometry.size.width) { newValue in
                                geometryWidth = newValue
                                startAnimation(newValue)
                            }
                    }
                }
            }
        }
    }

    private func startAnimation(_ newGeometryWidth: CGFloat) {
        let duration: Double = 5 // Adjust speed as needed

        // Set initial offset to ensure the text starts from the right side
        offsetAmount = newGeometryWidth

        withAnimation(Animation.linear(duration: duration).repeatForever(autoreverses: false)) {
            // Calculate offset amount to ensure the text moves off the left side
            offsetAmount = -newGeometryWidth - textToDisplay.width(usingFont: UIFont(name: selectedFont, size: fontSize)!)
        }
    }
}

extension String {
    func width(usingFont font: UIFont!) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}

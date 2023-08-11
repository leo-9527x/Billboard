//
//  ControlView.swift
//  Billboard
//
//  Created by Robert Liu on 8/9/23.
//

//import Foundation
import SwiftUI

struct ControlView: View {
    @Binding var textToDisplay: String
    @Binding var fontSize: CGFloat
    @Binding var selectedFont: String
    @Binding var fontColor: Color

    private let fonts = ["Helvetica-Bold", "Arial-BoldMT", "TimesNewRomanPS-BoldMT"]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Say Something:")
                .foregroundColor(fontColor)
            TextField("Enter Text", text: $textToDisplay)
                .foregroundColor(fontColor)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(fontColor, lineWidth: 1)
                        .background(Color.black)
                )
                .padding([.leading, .trailing])

            Text("Font Size:")
                .foregroundColor(fontColor)
            Slider(value: $fontSize, in: 10...100, step: 1) {
                Text("\(Int(fontSize))")
            }
            .padding([.leading, .trailing])

            HStack {
                VStack(alignment: .leading) {
                    Text("Font Style:")
                        .foregroundColor(fontColor)
                    Picker("", selection: $selectedFont) {
                        ForEach(fonts, id: \.self) { font in
                            Text(font).tag(font)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                VStack(alignment: .leading) {
                    Text("Font Color:")
                        .foregroundColor(fontColor)
                        .padding(.bottom, -8) // Adjusts the distance to the picker
                    ColorPicker("", selection: $fontColor)
                }

                Spacer() // Pushes the controls to the left
            }
            .padding([.leading, .trailing])
        }
    }
}

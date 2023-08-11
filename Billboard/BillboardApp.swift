//
//  BillboardApp.swift
//  Billboard
//
//  Created by Robert Liu on 8/9/23.
//

//import SwiftUI
//
//@main
//struct BillboardApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
import SwiftUI

@main
struct BillboardApp: App {
    init() {
        // Customize UISlider appearance
        UISlider.appearance().tintColor = UIColor.darkGray // Replace with the color you want
        UISlider.appearance().thumbTintColor = UIColor.darkGray // Replace with the color you want

        // Customize UIPickerView appearance
        UIPickerView.appearance().tintColor = UIColor.white // Replace with the color you want
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


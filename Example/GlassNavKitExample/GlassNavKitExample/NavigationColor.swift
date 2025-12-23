//
//  NavigationColor.swift
//  GlassNavKitExample
//
//  Created by massimiliano allegretti on 23/12/25.
//

import SwiftUI

enum NavigationColor: String, CaseIterable {
    case blue = "Blue"
    case green = "Green"
    case red = "Red"
    case yellow = "Yellow"
    case black = "Black"
    case purple = "Purple"

    var color: Color {
        switch self {
        case .blue: return .blue
        case .green: return .green
        case .red: return .red
        case .yellow: return .yellow
        case .black: return .black
        case .purple: return .purple
        }
    }
}

//
//  ExampleList.swift
//  GlassNavKitExample
//
//  Created by massimiliano allegretti on 23/12/25.
//

import SwiftUI

struct ExampleList: View {
    var body: some View {
        List {
            Section("General") {
                Label("Profile", systemImage: "person.circle")
                Label("Notifications", systemImage: "bell")
                Label("Privacy", systemImage: "lock")
            }

            Section("Appearance") {
                Label("Theme", systemImage: "paintbrush")
                Label("Navigation Bar", systemImage: "rectangle.topthird.inset.filled")
                Label("Liquid Glass", systemImage: "drop")
            }

            Section("About") {
                Label("Version", systemImage: "number")
                Label("Licenses", systemImage: "doc.text")
                Label("Credits", systemImage: "star")
            }
        }
    }
}

#Preview {
    ExampleList()
}
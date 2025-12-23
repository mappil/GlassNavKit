//
//  ClassicDetailView.swift
//  GlassNavKitExample
//
//  Created by massimiliano allegretti on 23/12/25.
//

import SwiftUI

struct ClassicDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    let toolbarBackground: Color
    
    var body: some View {
        VStack {
            Spacer()
            Text("Hello, World!")
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.visible)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(toolbarBackground, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("Sono il titolo")
                        .foregroundStyle(.white)
                    
                    Spacer()
                }
            }
            
        }
        
    }
}

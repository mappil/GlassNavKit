//  GlassEffectContainerView.swift
//
//  Created by massimiliano allegretti on 22/12/25.

import SwiftUI

public struct GlassEffectContainerView<Content: View>: View {
    let spacing: CGFloat?
    let content: Content

    public init(spacing: CGFloat? = nil,
         @ViewBuilder content: () -> Content) {
        self.spacing = spacing
        self.content = content()
    }

    public var body: some View {
      
        if #available(iOS 26.0, *) {
            GlassEffectContainer(spacing: spacing) {
                content
            }

        }else {
            content
        }
    }
}

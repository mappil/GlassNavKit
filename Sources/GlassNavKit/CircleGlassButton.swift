//  CircleGlassButton.swift
//
//  Created by massimiliano allegretti on 22/12/25.

import SwiftUI

public struct CircleGlassButton<Label: View>: View {

    /// The action to perform when the user taps the button.
    let action: () -> Void

    /// The visual content of the button.
    let label: () -> Label

    let glass: GlassButton<Label>.GlassType

    private init(
        glass: GlassButton<Label>.GlassType = .clear,
        action: @escaping () -> Void,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.glass = glass
        self.action = action
        self.label = label
    }

    // MARK: - Convenience initializers

    /// Creates a circular glass button with an SF Symbol.
    ///
    /// This initializer is intended for icon-only actions such as toolbar buttons
    /// or floating controls.
    ///
    /// - Parameters:
    ///   - systemImage: The name of the SF Symbol to display.
    ///   - size: The diameter of the circular button.
    ///   - foregroundStyle: The foreground style applied to the symbol.
    ///   - action: The action to perform when the button is tapped.
    public init(
        glass: GlassButton<Label>.GlassType = .clear,
        systemImage: String,
        size: CGFloat = 34,
        foregroundStyle: some ShapeStyle = .white,
        action: @escaping () -> Void
    ) where Label == AnyView {
        self.glass = glass
        self.action = action
        self.label = {
            AnyView(
                Image(systemName: systemImage)
                    .foregroundStyle(foregroundStyle)
                    .frame(width: size - 10, height: size)

            )
        }
    }

    /// Creates a circular glass button with a custom image.
    ///
    /// Useful when working with asset catalog images instead of SF Symbols.
    public init(
        glass: GlassButton<Label>.GlassType = .clear,
        image: Image,
        size: CGFloat = 34,
        foregroundStyle: some ShapeStyle = .white,
        action: @escaping () -> Void
    ) where Label == AnyView {
        self.glass = glass
        self.action = action
        self.label = {
            AnyView(
                image
                    .foregroundStyle(foregroundStyle)
                    .frame(width: size - 10, height: size)
                    .contentShape(Circle())
            )
        }
    }

    public var body: some View {
        GlassButton(glass: glass) {
            action()
        } label: {
            label()
        }
    }

    /// Creates a toolbar-ready circular glass button.
    ///
    /// This helper is optimized for usage inside navigation bars and toolbars.
    public static func toolbar(
        systemImage: String,
        glass: GlassButton<AnyView>.GlassType = .clear,
        action: @escaping () -> Void
    ) -> CircleGlassButton<AnyView> {
        CircleGlassButton<AnyView>(
            glass: glass,
            systemImage: systemImage,
            action: action
        )
    }
}



#Preview {
    VStack {
        Spacer()

        CircleGlassButton(
            systemImage: "pencil.and.scribble"
        ) {
            print(("pencil.and.scribble action"))
        }
        

        Spacer()
    }
    .frame(maxWidth: .infinity)
    .background(Color.blue)
}

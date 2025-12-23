//  GlassButton.swift
//  Created by massimiliano allegretti on 22/12/25.

import SwiftUI

/// GlassButton
///
/// A lightweight, content-driven SwiftUI button that adopts the Liquid Glass design language on supported systems.
///
/// - On iOS 26 and later, the button automatically applies the native `.glass` button style to achieve a glass-like appearance.
/// - On earlier iOS versions, it gracefully falls back to a standard `Button` with your provided content.
///
/// Usage focuses on injecting your own label content so you retain full control over layout, colors, sizing, and accessibility. The `glass` parameter lets you choose between `.regular` and `.clear` appearances when available.
///
/// Example:
/// ```swift
/// GlassButton(glass: .clear) {
///     // Action
/// } label: {
///     Text("Edit")
///         .font(.headline)
///         .padding(.horizontal)
/// }
/// ```
public struct GlassButton<Label: View>: View {
    
    /// Defines the visual glass appearance to apply on supported platforms.
    ///
    /// - Note: Only takes effect on iOS 26 and later. Earlier systems render a standard button.
    public enum GlassType {
        case regular
        case clear
    }

    /// The action to perform when the user activates the button.
    let action: () -> Void

    /// The visual content of the button, supplied by the caller.
    let label: () -> Label
    
    /// The desired glass appearance (regular or clear). Defaults to `.clear`.
    let glass: GlassType

    /// Creates a glass-styled button.
    ///
    /// - Parameters:
    ///   - glass: The glass appearance to use on iOS 26 and later. Defaults to `.clear`.
    ///   - action: A closure executed when the user activates the button.
    ///   - label: A view builder that constructs the button's content.
    ///
    /// - Discussion: On earlier iOS versions, the button renders as a standard `Button` while preserving your content and layout.
    public init(glass: GlassType = .clear,
        action: @escaping () -> Void,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.action = action
        self.label = label
        self.glass = glass
    }
    

    /// Renders the button, conditionally applying the glass style when available.
    public var body: some View {
        if #available(iOS 26.0, *) {
            Button(action: action) {
                label()
            }
            .buttonStyle(.glass(buttonStyle()))
        } else {
            Button(action: action) {
                label()
            }
        }
    }
    
    /// Maps the `GlassType` to the native `Glass` style.
    ///
    /// - Returns: The corresponding `Glass` value for the current `glass` setting.
    /// - Availability: iOS 26 and later.
    @available(iOS 26.0, *)
    func buttonStyle() -> Glass {
        switch glass {
        case .regular:
            return Glass.regular
        case .clear:
            return Glass.clear
        }
    }
}

#Preview("Clear glass – simple text") {
    VStack(spacing: 20) {
        Spacer()
        GlassButton(glass: .clear) {
            print("Tapped clear")
        } label: {
            Text("Clear Glass")
                .font(.headline)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .foregroundStyle(.white)
        }
        
        GlassButton(glass: .regular) {
            print("Tapped clear")
        } label: {
            Text("Clear Glass")
                .font(.headline)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .foregroundStyle(.white)
        }
        
        Spacer()
    }
    .frame(maxWidth: .infinity)
    .padding()
    .background(Color.blue)
}

#Preview("Regular glass – icon + text") {
    VStack(spacing: 20) {
        Spacer()
        
        GlassButton(glass: .regular) {
            print("Tapped regular")
        } label: {
            HStack(spacing: 8) {
                Image(systemName: "pencil.and.scribble")
                    .imageScale(.large)
                Text("Edit Note")
                    .font(.headline)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 14)
            .foregroundStyle(.white)
        }
        
        GlassButton(glass: .clear) {
            print("Tapped regular")
        } label: {
            HStack(spacing: 8) {
                Image(systemName: "pencil.and.scribble")
                    .imageScale(.large)
                Text("Edit Note")
                    .font(.headline)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 14)
            .foregroundStyle(.white)
        }
        
        Spacer()
    }
    .frame(maxWidth: .infinity)
    .padding()
    .background(LinearGradient(colors: [.indigo, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
}

#Preview("Adaptive layout – large content") {
    VStack(spacing: 20) {
        Spacer()
        GlassButton(glass: .clear) {
            print("Primary action")
        } label: {
            Text("Primary Action")
                .font(.title2.bold())
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .foregroundStyle(.white)
        }
        
        GlassButton(glass: .regular) {
            print("Primary action")
        } label: {
            Text("Primary Action")
                .font(.title2.bold())
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .foregroundStyle(.white)
        }

        GlassButton(glass: .clear) {
            print("Secondary action")
        } label: {
            HStack(spacing: 12) {
                Image(systemName: "star.fill")
                    .imageScale(.large)
                VStack(alignment: .leading, spacing: 2) {
                    Text("Get Started")
                        .font(.headline)
                    Text("Takes just a moment")
                        .font(.subheadline)
                        .opacity(0.8)
                }
            }
            .padding(.horizontal, 18)
            .padding(.vertical, 12)
            .foregroundStyle(.white)
        }
        

        GlassButton(glass: .regular) {
            print("Secondary action")
        } label: {
            HStack(spacing: 12) {
                Image(systemName: "star.fill")
                    .imageScale(.large)
                VStack(alignment: .leading, spacing: 2) {
                    Text("Get Started")
                        .font(.headline)
                    Text("Takes just a moment")
                        .font(.subheadline)
                        .opacity(0.8)
                }
            }
            .padding(.horizontal, 18)
            .padding(.vertical, 12)
            .foregroundStyle(.white)
        }
        Spacer()
    }
    .frame(maxWidth: .infinity)
    .padding()
    .background(Color.black)
}

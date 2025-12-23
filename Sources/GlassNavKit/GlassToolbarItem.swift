//  GlassToolbarItem.swift
//
//  Created by massimiliano allegretti on 22/12/25.

import SwiftUI

/// A toolbar item that adopts the Liquid Glass design language by rendering
/// its content without any visible background chrome.
///
/// `GlassToolbarItem` abstracts away platform-specific APIs required to hide
/// the toolbar background, providing a single, future-proof entry point for
/// glass-style toolbar actions.
///
/// ## Behavior
/// - On **iOS 26 and later**, the toolbar item automatically hides its shared
///   background using `sharedBackgroundVisibility(.hidden)`, allowing the
///   underlying Liquid Glass material to show through.
/// - On **earlier iOS versions**, it gracefully falls back to a standard
///   `ToolbarItem` without altering background behavior.
///
/// ## Design intent
/// This component is intentionally named after its *visual outcome* rather
/// than its internal implementation details, making it suitable for use in
/// design systems and reusable UI layers.
///
/// ## Example
/// ```swift
/// .toolbar {
///     GlassToolbarItem(placement: .primaryAction) {
///         Image(systemName: "magnifyingglass")
///     }
/// }
/// ```
///
/// - Note: The content is expected to be visually compatible with a transparent
///   or glass background (e.g. SF Symbols with appropriate foreground styles).
public struct GlassToolbarItem<Content: View>: ToolbarContent {
    let placement: ToolbarItemPlacement
    let content: Content

    public init(placement: ToolbarItemPlacement,
         @ViewBuilder content: () -> Content) {
        self.placement = placement
        self.content = content()
    }

    public var body: some ToolbarContent {
      
        if #available(iOS 26.0, *) {
            ToolbarItem(placement: placement) {
                content
            }
            .sharedBackgroundVisibility(.hidden)

        }else {
            ToolbarItem(placement: placement) {
                content
            }
        }
    }
}

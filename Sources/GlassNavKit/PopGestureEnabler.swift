//  PopGestureEnabler.swift
//
//  Created by massimiliano allegretti on 22/12/25.

import SwiftUI

public struct PopGestureEnabler: UIViewControllerRepresentable {
    public init() {}

    public func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIViewController()
        DispatchQueue.main.async {
            vc.navigationController?
                .interactivePopGestureRecognizer?
                .delegate = nil
            vc.navigationController?
                .interactivePopGestureRecognizer?
                .isEnabled = true
        }
        return vc
    }

    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

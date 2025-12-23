//
//  ContentView.swift
//  GlassNavKitExample
//
//  Created by massimiliano allegretti on 23/12/25.
//

import SwiftUI
import GlassNavKit

struct ContentView: View {
    
    enum NavigationStyle {
        case classic
        case glassNavKit
    }

    @State private var selectedColor: NavigationColor = .blue
    @State private var selectionNavigationStyle: NavigationStyle = .glassNavKit
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                ExampleList()
                    .onTapGesture {
                        path.append("detail")
                    }
                VStack {
                    Spacer()
                    Button("Change in **\(selectionNavigationStyle != .classic ? "Classic" : "GlassNavKit")**") {
                        switch selectionNavigationStyle {
                        case .classic:
                            selectionNavigationStyle = .glassNavKit
                        case .glassNavKit:
                            selectionNavigationStyle = .classic
                        }
                    }
                    .font(.title)
                    .foregroundStyle(.blue)
                    .buttonStyle(.bordered)
                }
                .frame(maxWidth: .infinity)
            }
                .navigationTitle("GlassNavKit")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(selectedColor.color, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbar {
                    
                    switch selectionNavigationStyle {
                    case .classic:
                        navigationToolbarItems()
                    case .glassNavKit:
                        glassNavigationKitToolbarItems()
                    }
                    
                    ToolbarItem(placement: .bottomBar) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(NavigationColor.allCases, id: \.self) { navColor in
                                    Button {
                                        selectedColor = navColor
                                    } label: {
                                        Text(navColor.rawValue)
                                            .font(.caption)
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 8)
                                            .background(
                                                Capsule()
                                                    .fill(selectedColor == navColor ? navColor.color.opacity(0.8) : Color.secondary.opacity(0.2))
                                            )
                                            .foregroundColor(selectedColor == navColor ? .white : .primary)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .navigationDestination(for: String.self) { route in
                    switch selectionNavigationStyle {
                    case .classic:
                        ClassicDetailView(toolbarBackground: selectedColor.color)
                    case .glassNavKit:
                        GlassNavDetailView(toolbarBackground: selectedColor.color)
                    }
                }
        }
    }
    
    @ToolbarContentBuilder
    private func navigationToolbarItems() -> some ToolbarContent {
        ToolbarItemGroup(placement: .topBarTrailing) {
            Button {
                // Share action
            } label: {
                Image(systemName: "square.and.arrow.up")
                    .foregroundStyle(.white)
            }

            Button {
                // Edit action
            } label: {
                Image(systemName: "pencil")
                    .foregroundStyle(.white)
            }

            Button {
                // Info action
            } label: {
                Image(systemName: "info.circle")
                    .foregroundStyle(.white)
            }
        }

        ToolbarItem(placement: .topBarLeading) {
            Button {
                // Menu / Hamburger action
            } label: {
                Image(systemName: "line.3.horizontal")
                    .foregroundStyle(.white)
            }
        }
    }
    
    @ToolbarContentBuilder
    private func glassNavigationKitToolbarItems() -> some ToolbarContent {
        
        GlassToolbarItem(placement: .primaryAction) {
            
            GlassEffectContainerView(spacing: 10) {
                HStack {
                    CircleGlassButton(
                        systemImage: "magnifyingglass") {
                            print("magnifyingglass action")
                        }
                    
                    CircleGlassButton(
                        systemImage: "square.and.arrow.up") {
                            print("square.and.arrow.up action")
                        }
                    
                    CircleGlassButton(
                        systemImage: "square.and.pencil") {
                            print("square.and.pencil action")
                        }
                }
            }
            
        }


        GlassToolbarItem(placement: .topBarLeading) {
            CircleGlassButton(
                image: Image(systemName: "line.3.horizontal")
            ) {
                print("menu")
            }
            
            
        }
    }

}

#Preview {
    ContentView()
}

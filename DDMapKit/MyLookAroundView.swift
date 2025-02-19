//
//  MyLookAroundView.swift
//  DDMapKit
//
//  Created by joe on 2/19/25.
//

import SwiftUI
import MapKit

struct MyLookAroundView: View {
    let location: CLLocationCoordinate2D
    let text: String
    
    @State private var isLoading = true
    @State private var lookAroundScene: MKLookAroundScene?
    
    var body: some View {
        ZStack {
            if let scene = lookAroundScene {
                LookAroundPreview(initialScene: scene)
                    .overlay(alignment: .bottomTrailing) {
                        Text(text)
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .padding(8)
                            .background(.black.opacity(0.8).gradient)
                            .clipShape(.rect(cornerRadius: 8))
                            .padding()
                            .padding(.bottom)
                            .shadow(radius: 3)
                    }
            } else {
                Text("Loading look around view...")
                    .foregroundStyle(.secondary)
                    .font(.headline)
            }
        }
        .ignoresSafeArea(edges: [.bottom])
        .task {
            isLoading = true
            await getLookAroundScene()
            isLoading = false
        }
    }
    
    func getLookAroundScene() async {
        // reset the scene
        lookAroundScene = nil
        
        let request = MKLookAroundSceneRequest(coordinate: location)
        
        if let scene = try? await request.scene {
            lookAroundScene = scene
        } else {
            print("Failed to load look around scene")
        }
    }
}

#Preview {
    MyLookAroundView(
        location: .paris,
        text: "Exploring Paris"
    )
}

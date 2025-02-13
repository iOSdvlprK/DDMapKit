//
//  ParisView.swift
//  DDMapKit
//
//  Created by joe on 2/13/25.
//

import SwiftUI
import MapKit

struct ParisView: View {
    @State private var cameraPosition: MapCameraPosition = .automatic
    @State private var delta: Double = 0.15
    @State private var offset: CGSize = .zero
    @State private var isPinned: Bool = false
    
    var span: MKCoordinateSpan {
        MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
    }
    var parisRegion: MKCoordinateRegion {
        MKCoordinateRegion(center: .paris, span: span)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(position: $cameraPosition) {
                
            }
            
            ZoomSliderView(delta: $delta)
        }
        .onAppear {
            cameraPosition = .region(parisRegion)
        }
        .onChange(of: delta) { _, _ in
            cameraPosition = .region(parisRegion)
        }
    }
}

struct ZoomSliderView: View {
    @Binding var delta: Double
    
    var body: some View {
        Slider(value: $delta, in: 0.05...0.3)
            .padding()
    }
}

#Preview {
    ParisView()
}

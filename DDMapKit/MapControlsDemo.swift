//
//  MapControlsDemo.swift
//  DDMapKit
//
//  Created by joe on 2/17/25.
//

import SwiftUI
import MapKit

struct MapControlsDemo: View {
    let columbia: CLLocationCoordinate2D = .columbiaUniversity
    
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    private let initialPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    
    var body: some View {
        VStack {
            Map(position: $position) {
                Marker("Columbia University", coordinate: .columbiaUniversity)
            }
            .mapControls {
                MapScaleView()
                
                MapCompass()
                
                MapPitchToggle()
            }
            
            Button("Reset Map Position") {
                withAnimation {
                    position = initialPosition
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    MapControlsDemo()
}

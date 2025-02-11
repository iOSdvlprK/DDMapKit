//
//  MarkerDemoView.swift
//  DDMapKit
//
//  Created by joe on 2/10/25.
//

import SwiftUI
import MapKit

struct MarkerDemoView: View {
    var body: some View {
        Map {
            ForEach(Locations.locationsInSpain) { location in
                Marker(location.name, coordinate: location.coordinate)
                    .tint(.blue)
            }
        }
    }
}

#Preview {
    MarkerDemoView()
}

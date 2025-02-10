//
//  ContentView.swift
//  DDMapKit
//
//  Created by joe on 2/10/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        Map {
            ForEach(locationsInSpain) { location in
                Marker(location.name, coordinate: location.coordinate)
                    .tint(.blue)
            }
        }
    }
}

#Preview {
    ContentView()
}

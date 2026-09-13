//
//  MapView.swift
//  FirstOcDemo
//
//  Created by zj015 on 2026/9/13.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) ->  MKMapView {
         MKMapView();
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 39, longitude: 116
            ), span: MKCoordinateSpan(
                latitudeDelta: 1, longitudeDelta: 1
            )
        ), animated: true)
    }
}

//#Preview {
//    MapView()
//}

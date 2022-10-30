//
//  LocationService.swift
//  Example (iOS)
//
//  Created by Dscyre Scotti on 10/30/22.
//

import SwiftUI
import CoreLocation

class LocationService: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    @Published var authorisationStatus: CLAuthorizationStatus

    override init() {
        self.authorisationStatus = locationManager.authorizationStatus
        super.init()
        self.locationManager.delegate = self
    }

    public func requestAuthorisation() {
        locationManager.requestWhenInUseAuthorization()
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.authorisationStatus = status
    }
}

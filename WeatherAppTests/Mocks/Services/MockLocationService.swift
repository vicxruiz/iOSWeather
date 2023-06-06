//
//  MockLocationService.swift
//  WeatherAppTests
//
//  Created by Victor Ruiz on 6/6/23.
//

import Foundation
import CoreLocation
@testable import WeatherApp

// With more time I would make this more testable by setting an error and injecting data
class MockLocationService: LocationRepository {
    private var locationUpdateHandler: ((CLLocation) -> Void)?
    let location = CLLocation(latitude: .zero, longitude: .zero)
    
    func start(completion: @escaping (CLLocation) -> Void) {
        locationUpdateHandler = completion
        updateLocation()
    }
    
    private func updateLocation() {
        locationUpdateHandler?(location)
    }
}

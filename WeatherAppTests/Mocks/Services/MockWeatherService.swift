//
//  MockWeatherService.swift
//  WeatherAppTests
//
//  Created by Victor Ruiz on 6/6/23.
//

import Foundation
import CoreLocation
@testable import WeatherApp

// With more time I would make this more testable by setting an error and injecting data
class MockWeatherService: WeatherRepository {
    let weather = WeatherResponse(
        weather: [Weather(id: 1, main: "test", description: "test", icon: "test")],
        main: Main(temp: 10, feelsLike: 10, tempMin: 10, tempMax: 10, pressure: 10, humidity: 10),
        wind: Wind(speed: 2, deg: 10),
        id: 1,
        name: "test"
    )
    
    func fetchWeather(for city: String, completion: @escaping (Result<WeatherApp.WeatherResponse, Error>) -> Void) {
        completion(.success(weather))
    }
    
    func fetchCityName(from location: CLLocation, completion: @escaping (String?) -> Void) {
        completion("testCity")
    }
}

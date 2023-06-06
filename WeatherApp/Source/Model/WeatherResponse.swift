//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Victor Ruiz on 5/26/23.
//

import Foundation

struct WeatherResponse: Codable, Equatable, Hashable {
    static func == (lhs: WeatherResponse, rhs: WeatherResponse) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let id: Int
    let name: String
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
}

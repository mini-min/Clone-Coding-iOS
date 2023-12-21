//
//  LocationWeather.swift
//  Clone-Weather
//
//  Created by 민 on 12/21/23.
//

import Foundation

// MARK: - LocationWeather
struct LocationWeather: Codable, Hashable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable, Hashable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable, Hashable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable, Hashable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable, Hashable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable, Hashable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
struct Wind: Codable, Hashable {
    let speed: Double
    let deg: Int
}

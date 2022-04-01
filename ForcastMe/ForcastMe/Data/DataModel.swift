//
//  DataModel.swift
//  ForcastMe
//
//  Created by Luthfor Khan on 3/30/22.
//

import Foundation


//func getWeather(lat: Double, lon: Double) async -> Response? {
//    guard let url = URL(string: getLink(lat: lat, lon: lon)) else {
//        print("Invalid URL")
//        return nil
//    }
//    
//    do {
//        let (data, _) = try await URLSession.shared.data(from: url)
//        
//        if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
//            return decodedResponse
//        }
//        
//    } catch {
//        print("Invalid Data")
//    }
//    
//    return nil
//}

let testLat = 42.3928
let testLon = -83.0458

func getLink(lat: Double, lon: Double) -> String {
    return "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely,alerts&appid=\(apiKey)"
}

struct Response: Codable {
    var lat: Double = 0
    var lon: Double = 0
    var timezone: String = ""
    var timezone_offset: Int = 0
    var current: CurrentData = CurrentData()
    var hourly: [HourlyData] = [HourlyData()]
    var daily: [DailyData] = [DailyData()]
}

struct CurrentData: Codable {
    var dt: Int = 0
    var sunrise: Int = 0
    var sunset: Int = 0
    var temp: Double = 0
    var feels_like: Double = 0
    var pressure: Double = 0
    var humidity: Double = 0
    var dew_point: Double = 0
    var uvi: Double = 0
    var clouds: Double = 0
    var visibility: Double = 0
    var wind_speed: Double = 0
    var wind_deg: Double = 0
    var wind_gust: Double?
    var weather: [Weather] = [Weather()]
    var rain: Double?
    var snow: Double?
}

struct Weather: Codable {
    var id: Int = 0
    var main: String = ""
    var description: String = ""
    var icon: String = ""
}

struct HourlyData: Codable {
    var dt: Int = 0
    var temp: Double = 0
    var feels_like: Double = 0
    var pressure: Double = 0
    var humidity: Double = 0
    var dew_point: Double = 0
    var uvi: Double = 0
    var clouds: Double = 0
    var visibility: Double = 0
    var wind_speed: Double = 0
    var wind_deg: Double = 0
    var wind_gust: Double = 0
    var weather: [Weather] = [Weather()]
    var pop: Double = 0
}

struct DailyData: Codable {
    var dt: Int = 0
    var sunrise: Int = 0
    var sunset: Int = 0
    var moonrise: Int = 0
    var moonset: Int = 0
    var moon_phase: Double = 0
    var temp: TempreatureData = TempreatureData()
    var feels_like: FeelsLikeData = FeelsLikeData()
    var pressure: Double = 0
    var humidity: Double = 0
    var dew_point: Double = 0
    var wind_speed: Double = 0
    var wind_deg: Double = 0
    var wind_gust: Double?
    var weather: [Weather] = [Weather()]
    var clouds: Double = 0
    var pop: Double = 0
    var rain: Double?
    var snow: Double?
    var uvi: Double = 0
}

struct TempreatureData: Codable {
    var day: Double = 0
    var min: Double = 0
    var max: Double = 0
    var night: Double = 0
    var eve: Double = 0
    var morn: Double = 0
    
}

struct FeelsLikeData: Codable {
    var day: Double = 0
    var night: Double = 0
    var eve: Double = 0
    var morn: Double = 0
}

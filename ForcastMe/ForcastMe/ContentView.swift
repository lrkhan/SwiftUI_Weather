//
//  ContentView.swift
//  ForcastMe
//
//  Created by Luthfor Khan on 3/29/22.
//

import SwiftUI

struct ContentView: View {
    @State var data = Response()
    @State var isMetric: Bool = false
    
    var weather: Weather {
        data.current.weather[0]
    }
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                if data.timezone_offset == Response().timezone_offset {
                    Text("")
                } else {
                    CurrentWatherView(isMetric: $isMetric, hourlyData: $data.hourly, currentData: $data.current)
                    //getIcon(icon: weather.icon)
                    DailyView(isMetric: $isMetric, dailyData: $data.daily)
                    
                    Toggle("Use Metric Units", isOn: $isMetric)
                        .padding(.horizontal)
                        .frame(width: 350)
                }
            }
            .refreshable {
                print("refreshing Data")
                await loadWeather()
            }
            
            .navigationTitle("Weather")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action:{
                        Task {
                            await loadWeather()
                        }
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                    }
                }
            }
        }
        .task {
            await loadWeather()
        }
    }
    
    func loadWeather() async {
        if let dat = await getWeather(lat: testLat, lon: testLon) {
            data = dat
        } else {
            print("Error")
        }
    }
}

func getWeather(lat: Double, lon: Double) async -> Response? {
    guard let url = URL(string: getLink(lat: lat, lon: lon)) else {
        print("Invalid URL")
        return nil
    }
    
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        
        if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
            return decodedResponse
        }
        
    } catch {
        print("Invalid Data")
    }
    
    return nil
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

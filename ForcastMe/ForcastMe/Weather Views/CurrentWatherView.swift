//
//  CurrentWatherView.swift
//  ForcastMe
//
//  Created by Luthfor Khan on 3/30/22.
//

import SwiftUI

struct CurrentWatherView: View {
    @Binding var isMetric: Bool
    @Binding var hourlyData: [HourlyData]
    @Binding var currentData: CurrentData
    
    var weather: Weather {
        currentData.weather[0]
    }
    
    var tempSymbol: String {
        if isMetric { return "°C"} else { return "°F"}
    }
    
    var speedUnits: String {
        if isMetric { return "m/s" } else { return "mph"}
    }
    
    var sunrise: String {
        let date = Date(timeIntervalSince1970: Double(currentData.sunrise))
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        return formatter.string(from: date)
    }
    
    var sunset: String {
        let date = Date(timeIntervalSince1970: Double(currentData.sunset))
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        return formatter.string(from: date)
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.gray)
                .opacity(0.3)
            
            Group {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.gray)
                    .opacity(0.3)
                    .frame(height: 200)
                
                VStack {
                    Spacer()
                    
                    HStack {
                        iconNDescription
                        
                        VStack(alignment: .leading) {
                            tempNHumidity
                            
                            uvNWindSpeed
                            
                            Divider()
                                .padding(.trailing)
                                //.padding(.vertical)
                            
                            sunRiseNSet
                        }
                        //.padding()
                    }
                    
                    Spacer()
                }
            }
            .offset(y: -12.5)
            
            HStack {
                Image(systemName: "location.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width:15)
                
                Text("Detroit, MI")
                    .font(.callout)
                
                Spacer()
                
                NavigationLink(destination: HourlyView(isMetric: $isMetric, hourlyData: $hourlyData)) {
                    Text("Hourly >")
                        .font(.callout)
                        .padding(.horizontal)
                }
            }
            .offset(y: 100)
            .frame(width: 300)
            
        }
        .frame(width: 350, height: 225)
    }
    
    var iconNDescription: some View {
        VStack {
            getIcon(icon: weather.icon)
                .scaledToFill()
                .frame(width: 100, height: 100)
            Text(weather.main)
        }
        .padding()
    }
    
    var tempNHumidity: some View {
        HStack {
            Text("\(currentData.temp.convert(isMetric), specifier: "%.0f")\(tempSymbol)")
                .font(.title)
                .bold()
            //.border(Color.red, width: 2)
            
            VStack(alignment: .leading) {
                Text("\(currentData.feels_like.convert(isMetric), specifier: "%.1f")\(tempSymbol)")
                    .font(.callout)
                
                Text("\(currentData.humidity, specifier: "%.1f")% humidity")
                    .font(.callout)
            }
        }
    }
    
    var uvNWindSpeed: some View {
        VStack(alignment: .leading) {
            Text("UV Index: \(currentData.uvi, specifier: "%.2f")")
                .font(.caption)
            Text("Wind Speed: \(currentData.wind_speed.convertSpeed(isMetric), specifier: "%.1f") \(speedUnits)")
                .font(.caption)
        }
        
    }
    
    var sunRiseNSet :some View {
        HStack {
            Image("sunRise")
                .resizable()
                .scaledToFit()
                .frame(width: 40)
            Text("\(sunrise)")
            
            Image("sunSet")
                .resizable()
                .scaledToFit()
                .frame(width: 40)
            Text("\(sunset)")
        }
    }
}


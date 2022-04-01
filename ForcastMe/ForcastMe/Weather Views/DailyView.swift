//
//  DailyView.swift
//  ForcastMe
//
//  Created by Luthfor Khan on 3/31/22.
//

import SwiftUI

struct DailyView: View {
    @Binding var isMetric: Bool
    @Binding var dailyData: [DailyData]
    
    var tempSymbol: String {
        if isMetric { return "°C"} else { return "°F"}
    }
    
    var speedUnits: String {
        if isMetric { return "m/s" } else { return "mph"}
    }
    
    func day(data: DailyData) -> String {
        let date = Date(timeIntervalSince1970: Double(data.dt))
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        
        return formatter.string(from: date)
    }
    
    
    var body: some View {
        Group {
            HStack {
                Text("Weekly Forcast")
                    .font(.headline)
                    .padding(.top)
                    .padding(.leading)
                Spacer()
            }
            
            ForEach(dailyData, id:\.dt) { daily in
                VStack {
                    HStack{
                        Text(day(data:daily))
                            .frame(width: 50)
                        
                        getIcon(icon: daily.weather[0].icon)
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        
                        Spacer()
                        
                        Text("\(daily.temp.day.convert(isMetric), specifier: "%.0f")\(tempSymbol)")
                        
                        Spacer()
                        
                        Text("H:\(daily.temp.max.convert(isMetric), specifier: "%.0f")\(tempSymbol)")
                        
                        Spacer()
                        
                        Text("L:\(daily.temp.min.convert(isMetric), specifier: "%.0f")\(tempSymbol)")
                        
                        Spacer()
                        
                    }
                    Divider()
                        .padding(.horizontal)
                }
            }
            
        }
        .frame(width: 330)
    }
}



//
//  HourlyView.swift
//  ForcastMe
//
//  Created by Luthfor Khan on 3/31/22.
//

import SwiftUI

struct HourlyView: View {
    @Binding var isMetric: Bool
    @Binding var hourlyData: [HourlyData]
    
    var tempSymbol: String {
        if isMetric { return "°C"} else { return "°F"}
    }
    
    var speedUnits: String {
        if isMetric { return "m/s" } else { return "mph"}
    }
    
    func time(data: HourlyData) -> String {
        let date = Date(timeIntervalSince1970: Double(data.dt))
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        return formatter.string(from: date)
    }
    
    var body: some View {
        List {
            ForEach(hourlyData, id: \.dt){ hd in
                HStack{
                    Text(time(data:hd))
                        .frame(width: 50)
                        //.border(Color.red, width: 2)
                    
                    getIcon(icon: hd.weather[0].icon)
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    
                    Text("\(hd.temp.convert(isMetric), specifier: "%.0f")\(tempSymbol)")
                    
                    Text("\(hd.weather[0].description)")
                    //Spacer()
                }
            }
        }
        .navigationTitle("Hourly Weather")
    }
}

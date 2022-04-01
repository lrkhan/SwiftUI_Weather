//
//  Temperature.swift
//  ForcastMe
//
//  Created by Luthfor Khan on 3/31/22.
//

import Foundation

extension Double {
    func convert(_ isMetric: Bool) -> Double {
        let celsius = self - 273.15
        
        if isMetric {
            return celsius
        } else {
            return ((celsius * (9/5)) + 32)
        }
    }
    
    func convertSpeed(_ isMetric: Bool) -> Double {
        if isMetric { return self } else {
            return self * 2.23694
        }
    }
}
//
//func day(data: DailyData) -> String {
//    let date = Date(timeIntervalSince1970: Double(data.dt))
//    let formatter = DateFormatter()
//    formatter.dateFormat = "EEE"
//    
//    return formatter.string(from: date)
//}

//
//  WeatherConditions.swift
//  ForcastMe
//
//  Created by Luthfor Khan on 3/30/22.
//

import Foundation
import SwiftUI

func getIcon(icon: String) -> Image {
    var imgName = "default"
    
    if !icon.isEmpty {
        imgName = icon
    }
    
    //print(icon)
    
    return Image(imgName).resizable()
}

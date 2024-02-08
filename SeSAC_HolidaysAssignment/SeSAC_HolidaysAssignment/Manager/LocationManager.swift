//
//  LocationManager.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/8/24.
//

import Foundation

final class LocationManager {
    
    static let shared = LocationManager()
    
    private init() { }
    
    var lat: Double = 37.654165
    var lon: Double = 127.049696
}

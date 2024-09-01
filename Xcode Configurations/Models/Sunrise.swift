//
//  Sunrise.swift
//  Xcode Configurations
//
//  Created by egesucu on 1.09.2024.
//

import Foundation

struct Sunrise: Codable, Identifiable {
    let id = UUID()
    var results: Results
    var tzid: String
    
    enum CodingKeys: CodingKey {
           case results, tzid
    }
}

struct Results: Codable, Identifiable {
    let id = UUID()
    var sunrise: String
    var sunset: String
    
    enum CodingKeys: CodingKey {
           case sunrise, sunset
    }
}

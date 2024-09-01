//
//  Pokemon.swift
//  Xcode Configurations
//
//  Created by egesucu on 1.09.2024.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    var id: Int
    var name: String
    var weight: Int
}

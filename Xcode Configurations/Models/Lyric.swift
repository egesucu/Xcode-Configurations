//
//  Lyric.swift
//  Xcode Configurations
//
//  Created by egesucu on 1.09.2024.
//

import Foundation

struct Lyric: Identifiable, Codable {
    let id = UUID()
    var lyrics: String
    
    enum CodingKeys: CodingKey {
           case lyrics
    }
    
}

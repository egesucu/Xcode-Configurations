//
//  APIManager.swift
//  Xcode Configurations
//
//  Created by egesucu on 1.09.2024.
//

import Foundation
import OSLog

final class APIManager: Sendable {
    static var baseURL: URL {
        guard let urlString = Bundle.main.object(forInfoDictionaryKey: "APIURL") as? String else {
            fatalError("APIURL not set")
        }
        print(urlString)
        return URL(string: urlString)!
    }
    
    func fetchPokemon() async -> Pokemon? {
        do {
            let result: (data: Data, response: URLResponse) = try await URLSession.shared.data(from: APIManager.baseURL)
            return try JSONDecoder().decode(Pokemon.self, from: result.data)
        } catch {
            Logger().error("Error: \(error.localizedDescription)")
            return nil
        }
    }
    
    func fetchLyrics() async -> Lyric? {
        do {
            let result: (data: Data, response: URLResponse) = try await URLSession.shared.data(from: APIManager.baseURL)
            return try JSONDecoder().decode(Lyric.self, from: result.data)
        } catch {
            Logger().error("Error: \(error.localizedDescription)")
            return nil
        }
    }
    
    func fetchSunrise() async -> Sunrise? {
        do {
            let result: (data: Data, response: URLResponse) = try await URLSession.shared.data(from: APIManager.baseURL)
            return try JSONDecoder().decode(Sunrise.self, from: result.data)
        } catch {
            Logger().error("Error: \(error.localizedDescription)")
            return nil
        }
    }
}

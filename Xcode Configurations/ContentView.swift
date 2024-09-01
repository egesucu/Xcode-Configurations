//
//  ContentView.swift
//  Xcode Configurations
//
//  Created by egesucu on 1.09.2024.
//

import SwiftUI
import OSLog

struct ContentView: View {
    
    let manager = APIManager()
    
    @State private var sunrise: Sunrise? = nil
    @State private var pokemon: Pokemon? = nil
    @State private var lyric: Lyric? = nil
    
    var body: some View {
        VStack {
            
#if INT
            Button {
                Task {
                    await fetchData { await manager.fetchLyrics() }
                    Logger().info("\(lyric?.lyrics ?? "")")
                }
            } label: {
                Text("Show Lyrics")
            }
#elseif UAT
            Button {
                Task {
                    await fetchData { await manager.fetchSunrise() }
                    Logger().info("\(sunrise ?? "")")
                }
            } label: {
                Text("Show Times")
            }
#elseif PROD
            Button {
                Task {
                    await fetchData { await manager.fetchPokemon() }
                    Logger().info("\(pokemon ?? "")")
                }
            } label: {
                Text("Show Pokemon")
            }
#endif
            
        }
        .padding()
        .sheet(item: $lyric, content: lyricView)
        .sheet(item: $sunrise, content: sunriseView)
        .sheet(item: $pokemon, content: pokemonView)
    }
    
    @ViewBuilder
    func lyricView(_ lyric: Lyric) -> some View {
        Text(lyric.lyrics)
            .padding()
    }
    
    @ViewBuilder
    func sunriseView(_ sunrise: Sunrise) -> some View {
        VStack {
            Text("Sunrise time: \(sunrise.results.sunrise)")
            Text("Sunset time: \(sunrise.results.sunset)")
        }
        .padding()
    }
    
    @ViewBuilder
    func pokemonView(_ pokemon: Pokemon) -> some View {
        VStack {
            Text("Pokemon: \(pokemon.name)")
            Text("Weight: \(pokemon.weight)")
            Text("ID: \(pokemon.id)")
        }
        .padding()
    }
    
    @MainActor
    func fetchData<T>(_ operation: () async -> T?) async {
        let result = await operation()
        switch result {
        case let lyric as Lyric:
            self.lyric = lyric
        case let sunrise as Sunrise:
            self.sunrise = sunrise
        case let pokemon as Pokemon:
            self.pokemon = pokemon
        default:
            break
        }
    }
}

#Preview {
    ContentView()
}

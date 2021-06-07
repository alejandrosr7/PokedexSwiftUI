//
//  ContentView.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 31/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PokemonListView()
                .tabItem {
                    Label("Pokedex", systemImage: "list.dash")
                }
            PokemonVoteView()
                .tabItem {
                    Label("Vote", systemImage: "flame.fill")
                }
            PokemonVotedView()
                .tabItem {
                    Label("Voted Pokemon", systemImage: "star")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 31/05/21.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var pokemonListViewModel = PokemonListViewModel()
    var body: some View {
        List {
            ForEach(pokemonListViewModel.pokemonResults, id: \.self) { pokemon in
                Text(pokemon.name)
            }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}

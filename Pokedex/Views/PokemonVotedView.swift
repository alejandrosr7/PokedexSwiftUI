//
//  PokemonVotedView.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 6/06/21.
//

import SwiftUI

struct PokemonVotedView: View {
    @StateObject var pokemonVotedViewModel = PokemonVotedCoreDataViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(pokemonVotedViewModel.savedPokemonVotedEntities) { pokemon in
                    HStack {
                        Text(pokemon.pokedexNumber ?? "No Number")
                        Text(pokemon.name ?? "No name")
                        Text(pokemon.votes ?? "No name")
                    }
                }
            }
            .onAppear {
                pokemonVotedViewModel.fetchPokemonVotedList()
            }
        }
        .environmentObject(pokemonVotedViewModel)
    }
}

struct PokemonVotedView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonVotedView()
    }
}

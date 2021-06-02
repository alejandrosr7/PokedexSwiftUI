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
        NavigationView {
            List {
                ForEach(pokemonListViewModel.pokemonResults, id: \.self) { pokemon in
                    NavigationLink(destination: PokemonDetailView()) {
                        Text(pokemon.name)
                        
                    }
                }
            }
            .navigationTitle("Pokedex")
            .navigationBarItems(leading: Button("Previous"){
                pokemonListViewModel.fetchPokemonList(urlString: pokemonListViewModel.previousSearch)
            }, trailing: Button("Next"){
                pokemonListViewModel.fetchPokemonList(urlString: pokemonListViewModel.nextSearch)
            })
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}

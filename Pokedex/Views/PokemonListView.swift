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
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            if pokemonListViewModel.pokemonResults.count > 10 {
                NavigationView {
                    List {
                        ForEach(pokemonListViewModel.pokemonResults, id: \.self) { pokemon in
                            NavigationLink(destination: PokemonDetailView(name: pokemon.name)) {
                                PokemonViewCell(name: pokemon.name)
                            }
                        }

                        if pokemonListViewModel.pokemonResults.count < pokemonListViewModel.count {
                            MasterBallLoaderView()
                                .onAppear {
                                    pokemonListViewModel.fetchPokemonList(urlString: pokemonListViewModel.nextSearch)
                                }
                        }
                        
                    }.listRowBackground(Color.black)
                    .navigationTitle("Pokedex")
                }
            } else {
                MasterBallLoaderView()
            }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}

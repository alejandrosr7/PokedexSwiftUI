//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 31/05/21.
//

import SwiftUI

struct PokemonListView: View {
    
    @StateObject var pokemonListViewModel = PokemonListViewModel()
    @State var isPreviousViewHidden = false
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            if pokemonListViewModel.pokemonResults.count > 10 {
                NavigationView {
                    ScrollView {
                        ForEach(pokemonListViewModel.pokemonResults, id: \.self) { pokemon in
                            NavigationLink(destination: PokemonDetailView(name: pokemon.name)) {
                                PokemonViewCell(name: pokemon.name)
                            }
                        }
                    }.listRowBackground(Color.black)
                    .navigationTitle("Pokedex")
                    .navigationBarItems(leading:
                        Button(action: {
                            pokemonListViewModel.fetchPokemonList(urlString: pokemonListViewModel.previous)
                            
                        }, label: {
                            Image(systemName: "arrowshape.turn.up.backward")
                        })
                    , trailing:
                        Button(action: {
                            pokemonListViewModel.fetchPokemonList(urlString: pokemonListViewModel.nextSearch)
                        }, label: {
                            Image(systemName: "arrowshape.turn.up.forward")
                        })
                    )
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

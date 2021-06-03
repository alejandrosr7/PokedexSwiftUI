//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 1/06/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonDetailView: View {
    var name = ""
    @ObservedObject var pokemonDetailViewModel = PokemonDetailViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text(String(pokemonDetailViewModel.pokedexNumber))
            }
            VStack {
                WebImage(url: URL(string: pokemonDetailViewModel.officialArtwork))
                    .resizable()
                    .clipShape(Circle())
                    .background(Circle()
                                    .foregroundColor(Color(Constants.backgroundColor(forType: pokemonDetailViewModel.types.first?.type.name ?? "none"))))
                    .frame(width: 200, height: 200, alignment: .center)
                    .padding()
                HStack {
                    Text("Heigth: " + pokemonDetailViewModel.height)
                    Text("Weigth: " + pokemonDetailViewModel.weight)
                }
            }
            HStack {
                ForEach(pokemonDetailViewModel.types, id: \.self) { pokemon in
                    Text(pokemon.type.name)
                }
            }
            Divider()
            HStack(alignment: .center) {
                VStack {
                    Text("Movements")
                    ForEach(pokemonDetailViewModel.moves.prefix(5), id: \.self) { pokemon in
                        Text(pokemon.move.name)
                    }
                }
                Divider()
                VStack {
                    Text("Abilities")
                    ForEach(pokemonDetailViewModel.abilities, id: \.self) { pokemon in
                        Text(pokemon.ability.name)
                    }
                }
            }
            .onAppear {
                pokemonDetailViewModel.fetchPokemonDetail(with: name)
            }
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(name: "Bulbasaur")
    }
}

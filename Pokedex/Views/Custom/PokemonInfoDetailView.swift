//
//  PokemonInfoDetailView.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 3/06/21.
//

import SwiftUI

struct PokemonInfoDetailView: View {
    @ObservedObject var pokemonDetailViewModel: PokemonDetailViewModel
    var body: some View {
        HStack(spacing: 10) {
            VStack {
                Text(pokemonDetailViewModel.weight)
                Text("WEIGHT")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Divider()
                .frame(height: 50)
            VStack {
                Text(pokemonDetailViewModel.name.capitalized)
                    .font(.title)
                HStack {
                    ForEach(pokemonDetailViewModel.types, id: \.self) { pokemon in
                        Text(pokemon.type.name.uppercased())
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(Constants.backgroundColor(forType: pokemon.type.name))
                                            .opacity(0.25)))
                    }
                }
            }
            Divider()
                .frame(height: 50)
            VStack {
                Text(pokemonDetailViewModel.height)
                Text("HEIGHT")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct PokemonInfoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoDetailView(pokemonDetailViewModel: PokemonDetailViewModel())
    }
}

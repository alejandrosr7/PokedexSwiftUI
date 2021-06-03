//
//  PokemonViewCell.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 31/05/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonViewCell: View {

    var name = ""
    var pokedexNumber = ""
    @StateObject var pokemonViewModel = PokemonViewModel()
    var body: some View {
        HStack {
            WebImage(url: URL(string: pokemonViewModel.sprites)).resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .padding()
            Text(pokemonViewModel.name.capitalized)
                .foregroundColor(.black)
                .padding()
        }
        .progressViewStyle(CircularProgressViewStyle())
        .onAppear {
            pokemonViewModel.fetchPokemon(with: name)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

struct PokemonViewCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonViewCell(name: "Bulbasaur", pokedexNumber: "1")
    }
}

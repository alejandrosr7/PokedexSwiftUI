//
//  PokemonViewCell.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 31/05/21.
//

import SwiftUI

struct PokemonViewCell: View {

    @StateObject var pokemonViewModel = PokemonViewModel()
    var name = ""
    var pokedexNumber = ""
    

    var body: some View {
        HStack {
            Image("")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .padding()
            Text(pokemonViewModel.name)
                .foregroundColor(.black)
            Text("\(pokemonViewModel.pokedexNumber)")
                .foregroundColor(.black)
        }
        .frame(width: 300, height: 100, alignment: .center)
    }
}

struct PokemonViewCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonViewCell(name: "Bulbasaur", pokedexNumber: "1")
    }
}

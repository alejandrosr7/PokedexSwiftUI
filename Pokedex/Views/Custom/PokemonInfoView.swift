//
//  PokemonInfoView.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 3/06/21.
//

import SwiftUI

struct PokemonInfoView: View {

    @Binding var provider: Bool
    @ObservedObject var pokemonInfo: PokemonDetailViewModel
    var body: some View {
        VStack {
            if self.provider {
                VStack {
                    ForEach(pokemonInfo.moves.prefix(5), id: \.self) { pokemon in
                        Text(pokemon.move.name
                             .capitalized
                                .replacingOccurrences(of: "-", with: " "))
                    }
                }
                
            } else {
                ForEach(pokemonInfo.abilities, id: \.self) { pokemon in
                    Text(pokemon.ability.name
                            .capitalized
                            .replacingOccurrences(of: "-", with: " "))
                }
            }
        }
    }
}

struct PokemonInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoView(provider: .constant(true), pokemonInfo: PokemonDetailViewModel()).previewLayout(.sizeThatFits)
    }
}

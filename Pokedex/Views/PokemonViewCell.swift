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
    @StateObject var pokemonViewModel = PokemonViewModel()
    var body: some View {
        HStack {
            WebImage(url: URL(string: pokemonViewModel.sprites))
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
            Text(pokemonViewModel.name.capitalized)
                .font(.headline)
                .foregroundColor(.black)
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.25))
                )
            Spacer()
            VStack {
                ForEach(pokemonViewModel.types, id: \.self) { pokemonType in
                    Circle()
                        .fill(Color(Constants.backgroundColor(forType: pokemonType.type.name)))
                        .frame(width: 30, height: 30)
                        .shadow(color: .gray, radius: 6, x: 0.0, y: 0.0)
                }
            }
            .padding(.trailing, 10)
        }
        .progressViewStyle(CircularProgressViewStyle())
        .onAppear {
            pokemonViewModel.fetchPokemon(with: name)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray, radius: 6, x: 0.0, y: 0.0)
        .padding(.horizontal)
    }
}

struct PokemonViewCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonViewCell(name: "Bulbasaur")
    }
}

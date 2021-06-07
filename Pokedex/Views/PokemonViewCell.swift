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
            Spacer()
            WebImage(url: URL(string: pokemonViewModel.sprites))
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
            Text(pokemonViewModel.name.capitalized)
                .font(.headline)
                .foregroundColor(.black)
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.25))
                )
            Spacer()
        }
        .progressViewStyle(CircularProgressViewStyle())
        .onAppear {
            pokemonViewModel.fetchPokemon(with: name)
        }
        .background(LinearGradient(gradient: Gradient(colors: colorCell(types: pokemonViewModel.types)), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
        .cornerRadius(12)
        .shadow(color: .gray, radius: 6, x: 0.0, y: 0.0)
        .padding(.horizontal)
    }
    
    private func colorCell(types: [Types]) -> [Color] {
        var colors = [Color]()
        for type in types {
            colors.append(Color(Constants.backgroundColor(forType: type.type.name)))
        }
        return colors
    }
}

struct PokemonViewCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonViewCell(name: "Bulbasaur").previewLayout(.sizeThatFits)
    }
}

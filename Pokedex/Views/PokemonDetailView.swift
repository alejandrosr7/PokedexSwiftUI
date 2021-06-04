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
    @State var isShowingMovements = true
    @ObservedObject var pokemonDetailViewModel = PokemonDetailViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("#" + pokemonDetailViewModel.pokedexNumber)
            }
            VStack {
                WebImage(url: URL(string: pokemonDetailViewModel.officialArtwork))
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .clipShape(Circle())
                    .background(Circle()
                                    .foregroundColor(Color(Constants.backgroundColor(forType: pokemonDetailViewModel.types.first?.type.name ?? "none"))))
                    
                    .padding()
            }
            PokemonInfoDetailView(pokemonDetailViewModel: pokemonDetailViewModel)
            Divider()
            Group {
                StateButton(provider: self.$isShowingMovements, buttonOne: "Movements", buttonTwo: "Abilities")
                    .padding(.bottom)
                PokemonInfoView(provider: self.$isShowingMovements, pokemonInfo: pokemonDetailViewModel)
                    .padding(.bottom)
                Spacer()
            }
        }
            .onAppear {
                pokemonDetailViewModel.fetchPokemonDetail(with: name)
            }
        }
    }


struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(name: "Bulbasaur")
    }
}

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
            PokemonImageView(pokemonDetailViewModel: pokemonDetailViewModel)
            PokemonInfoDetailView(pokemonDetailViewModel: pokemonDetailViewModel)
            HStack {
                ForEach(pokemonDetailViewModel.versionImages.removingDuplicates().suffix(3), id: \.self) { image in
                    if image != "" {
                        WebImage(url: URL(string: image))
                            .resizable()
                            .frame(width: 70, height: 70)
                    }

                }
            }
            Divider()
            Group {
                StateButton(provider: self.$isShowingMovements, buttonOne: "Movements", buttonTwo: "Abilities")
                    .padding(.bottom)
                PokemonInfoView(provider: self.$isShowingMovements, pokemonInfo: pokemonDetailViewModel)
                    .padding(.bottom)
                Spacer()
            }
            .navigationBarTitle(pokemonDetailViewModel.name.capitalized + " #" + pokemonDetailViewModel.pokedexNumber, displayMode: .inline)
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

struct PokemonImageView: View {
    @ObservedObject var pokemonDetailViewModel: PokemonDetailViewModel
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(Constants.backgroundColor(forType: pokemonDetailViewModel.types.first?.type.name ?? "none")))
                .cornerRadius(6)
                .shadow(color: .gray, radius: 6, x: 0.0, y: 0.0)
                .padding()
            HStack {
                VStack {
                    Spacer()
                    Image("openPokeball")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding([.leading, .bottom], 30)
                }
                WebImage(url: URL(string: pokemonDetailViewModel.officialArtwork))
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .padding()
            }
        }
    }
}

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}

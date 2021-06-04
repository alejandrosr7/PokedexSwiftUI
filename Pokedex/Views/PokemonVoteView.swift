//
//  PokemonVoteView.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 3/06/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonVoteView: View {

    @ObservedObject var pokemonVoteViewModel = PokemonVoteViewModel()
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    ForEach(pokemonVoteViewModel.pokemonCards) { item in
                        pokemonCard(pokemon: item)
                            .padding(8)
                    }
                }
                HStack(spacing: 10) {
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Image("dislike")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                                .padding([.leading, .bottom], 40)
                        }
                    })
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image("like")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .leading)
                            .padding([.trailing, .bottom], 40)
                    })
                    
                }
            }
        }
    }
}

struct VotePokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonVoteView()
    }
}

struct pokemonCard: View {
    var pokemon: PokemonVoteModel
    @State var x: CGFloat = 0.0
    @State var y: CGFloat = 0.0
    @State var degrees: Double = 0.0

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle().foregroundColor(Color(Constants.backgroundColor(forType: pokemon.types.first?.type.name ?? "none")))
            VStack {
                WebImage(url: URL(string: pokemon.sprites.other.officialArtwork.front_default))
                    .resizable()
                VStack(alignment: .center) {
                    HStack {
                        Text(pokemon.name.capitalized)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("#" + String(pokemon.id))
                            .font(.title)
                    }
                    HStack(alignment: .center) {
                        ForEach(pokemon.types, id: \.self) { type in
                            Spacer()
                            Text(type.type.name.capitalized)
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                }
                .padding()
                .foregroundColor(.white)
            }
            
        }
        .cornerRadius(8)
        .offset(x: x, y: y)
        .rotationEffect(.init(degrees: degrees))
        .gesture(
            DragGesture()
                .onChanged { (value) in
                    withAnimation(.default) {
                        x = value.translation.width
                        y = value.translation.height
                        degrees = 7 * (value.translation.width > 0 ? 1 : -1)
                    }
                }
                .onEnded { value in
                    withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
                        switch value.translation.width {
                        case 0...100:
                            x = 0; y = 0; degrees = 0
                        case let x where x > 100:
                            self.x = 500; degrees = 12
                        case (-100)...(-1):
                            x = 0; y = 0; degrees = 0
                        case let x where x < -100:
                            self.x = -500; degrees = -12
                        default:
                            x = 0; y = 0
                        }
                    }
                }
        )
    }
}

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
    @StateObject var pokemonVotedCoreDataViewModel = PokemonVotedCoreDataViewModel()
    @State private var tutorialWasShown = !UserDefaults.standard.bool(forKey: "TutorialWasShown")
    
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    Text("You don't have more votes for today")
                        .font(.title)
                        .foregroundColor(.white)
                    ForEach(pokemonVoteViewModel.pokemonCards) { pokemon in
                        pokemonCard(pokemon: pokemon, pokemonVotedCoreDataViewModel: pokemonVotedCoreDataViewModel)
                            .padding(8)
                    }
                }
                HStack(spacing: 10) {
                    Image("dislike")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .padding([.leading, .bottom], 40)
                    Spacer()
                    Image("like")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .leading)
                        .padding([.trailing, .bottom], 40)
                }
            }
            .sheet(isPresented: $tutorialWasShown, content: {
                VStack(alignment: .center) {
                    Text("Tutorial")
                        .font(.title)
                    HStack {
                        Image("dislike")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                        Text("Drag the image to the left if you want to release (Dislike) the Pokemon.")
                            .font(.caption)
                    }

                    HStack {
                        Text("Drag the image to the right if you want to catch (Like) the Pokemon.")
                            .font(.caption)
                        Image("like")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                    }
                    
                }
                .padding()
                .onDisappear {
                    UserDefaults.standard.setValue(true, forKey: "TutorialWasShown")
                }
            }).foregroundColor(.black)
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
    @StateObject var pokemonVotedCoreDataViewModel: PokemonVotedCoreDataViewModel
    @State var vote = ""
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
                            vote = "Like"
                        case (-100)...(-1):
                            x = 0; y = 0; degrees = 0
                        case let x where x < -100:
                            self.x = -500; degrees = -12
                            vote = "Dislike"
                        default:
                            x = 0; y = 0
                        }
                        let pokemonVote = PokemonVotedModel(id: pokemon.id, name: pokemon.name.capitalized, votes: vote)
                        pokemonVotedCoreDataViewModel.addPokemonVote(pokemon: pokemonVote)
                    }
                })
        .environmentObject(pokemonVotedCoreDataViewModel)
    }
}

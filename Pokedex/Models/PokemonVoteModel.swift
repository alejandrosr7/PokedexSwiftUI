//
//  PokemonVoteModel.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 3/06/21.
//

import Foundation

struct PokemonVoteModel: Codable, Identifiable {
    var id: Int
    var name: String
    var types: [Types]
    var sprites: Sprites
    

    init(id: Int, name: String, types: [Types], sprites: Sprites) {
        self.id = id
        self.name = name
        self.types = types
        self.sprites = sprites
    }
}

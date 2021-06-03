//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 1/06/21.
//

import Foundation

struct PokemonModel: Codable {
    var name: String
    var sprites: Sprites
}

struct Type: Codable, Hashable {
    var name: String
}

struct Types: Codable, Hashable {
    var type: Type
}

struct Move: Codable, Hashable {
    var name: String
}

struct Moves: Codable, Hashable {
    var move: Move
}

struct Ability: Codable, Hashable {
    var name: String
}

struct Abilities: Codable, Hashable {
    var ability: Ability
}

struct Sprites: Codable {
    var front_default: String
    var other: Other
}

struct Other: Codable {
    var officialArtwork: OfficialArtwork
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct OfficialArtwork: Codable {
    var front_default: String
}

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
    var types: [Types]
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
    var versions: Versions?
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

struct Versions: Codable {
    var generationI: GenerationI
    var generationII: GenerationII
    var generationIII: GenerationIII
    var generationIV: GenerationIV
    var generationV: GenerationV
    var generationVI: GenerationVI
    var generationVII: GenerationVII
    var generationVIII: GenerationVIII

    enum CodingKeys: String, CodingKey {
        case generationI = "generation-i"
        case generationII = "generation-ii"
        case generationIII = "generation-iii"
        case generationIV = "generation-iv"
        case generationV = "generation-v"
        case generationVI = "generation-vi"
        case generationVII = "generation-vii"
        case generationVIII = "generation-viii"
        
    }
}

struct GenGames: Codable {
    var frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

// MARK: - Generations

struct GenerationI: Codable {
    let redBlue, yellow: GenGames
    
    enum CodingKeys: String, CodingKey {
        case redBlue = "red-blue"
        case yellow
    }
}

struct GenerationII: Codable {
    let crystal, gold, silver: GenGames
}

struct GenerationIII: Codable {
    var emerald, fireredLeafgreen, rubySapphire: GenGames

    enum CodingKeys: String, CodingKey {
        case emerald
        case fireredLeafgreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
    }
}

struct GenerationIV: Codable {
    var diamondPearl, heartgoldSoulsilver, platinum: GenGames

    enum CodingKeys: String, CodingKey {
        case diamondPearl = "diamond-pearl"
        case heartgoldSoulsilver = "heartgold-soulsilver"
        case platinum
    }
}

struct GenerationV: Codable {
    var blackWhite: GenGames

    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }
}

struct GenerationVI: Codable {
    var omegarubyAlphasapphire, xy: GenGames

    enum CodingKeys: String, CodingKey {
        case omegarubyAlphasapphire = "omegaruby-alphasapphire"
        case xy = "x-y"
    }
}

struct GenerationVII: Codable {
    var icons, ultrasunUltramoon: GenGames

    enum CodingKeys: String, CodingKey {
        case icons
        case ultrasunUltramoon = "ultra-sun-ultra-moon"
    }
}

struct GenerationVIII: Codable {
    var icons: GenGames

    enum CodingKeys: String, CodingKey {
        case icons
    }
}

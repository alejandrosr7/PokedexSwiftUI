//
//  Constants.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 31/05/21.
//

import Foundation
import SwiftUI

struct Constants {
    static var pokemonListbaseURL: String = "https://pokeapi.co/api/v2/pokemon?limit=50&offset=0"
    static var pokemonURL: String = "https://pokeapi.co/api/v2/pokemon/"

    static func backgroundColor(forType type: String) -> UIColor {
        switch type {
        case "grass":
            return .systemGreen
        case "fire":
            return .init(red: 248/255, green: 144/255, blue: 61/255, alpha: 1)
        case "water":
            return .init(red: 75/255, green: 149/255, blue: 218/255, alpha: 1)
        case "bug":
            return .init(red: 147/255, green: 186/255, blue: 37/255, alpha: 1)
        case "normal":
            return .systemGray
        case "poison":
            return .systemPurple
        case "electric":
            return .yellow
        case "ground":
            return .brown
        case "fairy":
            return .init(red: 234/255, green: 128/255, blue: 224/255, alpha: 1)
        case "fighting":
            return .init(red: 207/255, green: 43/255, blue: 68/255, alpha: 1)
        case "ice":
            return .init(red: 105/255, green: 202/255, blue: 184/255, alpha: 1)
        case "ghost":
            return .systemIndigo
        case "psychic":
            return .init(red: 246/255, green: 110/255, blue: 111/255, alpha: 1)
        case "dark":
            return .init(red: 71/255, green: 68/255, blue: 78/255, alpha: 1)
        case "rock":
            return .init(red: 195/255, green: 180/255, blue: 123/255, alpha: 1)
        case "flying":
            return .init(red: 132/255, green: 156/255, blue: 215/255, alpha: 1)
        case "dragon":
            return .init(red: 14/255, green: 92/255, blue: 188/255, alpha: 1)
        case "steel":
            return .init(red: 69/255, green: 127/255, blue: 144/255, alpha: 1)
        default:
            return .clear
        }
    }
}

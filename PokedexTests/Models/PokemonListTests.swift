//
//  PokemonListTests.swift
//  PokedexTests
//
//  Created by Alejandro Serna Rodriguez on 7/06/21.
//

import XCTest
@testable import Pokedex

class PokemonListTests: XCTestCase {

    func testSuccessPokemonListParser() {
        //GIVEN
        let json = Constants.pokemonListJSON.data(using: .utf8)!

        //WHEN
        let pokemons = try! JSONDecoder().decode(PokemonListModel.self, from: json)

        //THEN
        XCTAssertNotNil(pokemons)
        XCTAssertEqual(pokemons.count, PokemonListModel.with().count)
    }

}

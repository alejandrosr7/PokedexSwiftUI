//
//  PokemonDetailModelTests.swift
//  PokedexTests
//
//  Created by Alejandro Serna Rodriguez on 7/06/21.
//

import XCTest
@testable import Pokedex

class PokemonDetailModelTests: XCTestCase {

    func testSuccessPokemonDetailModelParser() {
        //GIVEN
        let json = Constants.pokemonDetailJSON.data(using: .utf8)!

        //WHEN
        let pokemon = try! JSONDecoder().decode(PokemonDetailModel.self, from: json)

        //THEN
        XCTAssertNotNil(pokemon)
    }

}

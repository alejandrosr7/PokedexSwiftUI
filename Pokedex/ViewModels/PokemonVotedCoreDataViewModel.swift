//
//  PokemonVotedCoreDataViewModel.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 6/06/21.
//

import Foundation
import CoreData

class PokemonVotedCoreDataViewModel: ObservableObject {

    private static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PokemonVotedContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
            return Self.persistentContainer.viewContext
        }
    @Published var savedPokemonVotedEntities: [PokemonVotedEntity] = []
    
    init() {
        
        fetchPokemonVotedList()
    }

    func fetchPokemonVotedList() {
        let request = NSFetchRequest<PokemonVotedEntity>(entityName: "PokemonVotedEntity")

        do {
            savedPokemonVotedEntities = try context.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }

    func addPokemonVote(pokemon: PokemonVotedModel) {
        let newPokemonVoted = PokemonVotedEntity(context: context)
        newPokemonVoted.pokedexNumber = String(pokemon.id)
        newPokemonVoted.name = pokemon.name
        newPokemonVoted.votes = String(pokemon.votes)
        savePokemonVote()
    }

    func savePokemonVote() {
        do {
            try context.save()
            fetchPokemonVotedList()
        } catch let error {
            print("Error saving. \(error)")
        }
        
    }
}

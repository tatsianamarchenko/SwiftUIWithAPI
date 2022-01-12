//
//  RecivedDataModel.swift
//  moveCharactersListSwiftUI
//
//  Created by Tatsiana Marchanka on 12.01.22.
//

import Foundation
struct RecivedDataModelElement: Codable {
    let name: String
    let alternateNames: [String]
    let species: Species
    let gender: Gender
    let house: House
    let dateOfBirth: String
    let yearOfBirth: YearOfBirth
    let wizard: Bool
    let ancestry: Ancestry
    let eyeColour, hairColour: String
    let wand: Wand
    let patronus: String
    let hogwartsStudent, hogwartsStaff: Bool
    let actor: String
    let alternateActors: [String]
    let alive: Bool
    let image: String

    enum CodingKeys: String, CodingKey {
        case name
        case alternateNames = "alternate_names"
        case species, gender, house, dateOfBirth, yearOfBirth, wizard, ancestry, eyeColour, hairColour, wand, patronus, hogwartsStudent, hogwartsStaff, actor
        case alternateActors = "alternate_actors"
        case alive, image
    }
}

enum Ancestry: String, Codable {
    case empty = ""
    case halfBlood = "half-blood"
    case muggleborn = "muggleborn"
    case pureBlood = "pure-blood"
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

enum House: String, Codable {
    case gryffindor = "Gryffindor"
}

enum Species: String, Codable {
    case ghost = "ghost"
    case halfGiant = "half-giant"
    case human = "human"
    case werewolf = "werewolf"
}

// MARK: - Wand
struct Wand: Codable {
    let wood: String
    let core: Core
    let length: Length
}

enum Core: String, Codable {
    case dragonHeartstring = "dragon heartstring"
    case empty = ""
    case phoenixFeather = "phoenix feather"
    case unicornTailHair = "unicorn tail-hair"
}

enum Length: Codable {
    case double(Double)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Length.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Length"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

enum YearOfBirth: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(YearOfBirth.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for YearOfBirth"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

typealias RecivedDataModel = [RecivedDataModelElement]

//
//  Heroes.swift
//  DragonBallUI
//
//  Created by Francisco Javier Alarza Sanchez on 10/10/22.
//

import Foundation

struct Heroes: Codable, Identifiable {
    var id: UUID
    var name: String
    var description: String
    var photo: String
    var favorite: Bool?
}

struct HeroesFilter: Codable {
    var name: String
}

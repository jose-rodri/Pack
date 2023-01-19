//
//  PersistentData.swift
//  joserodriguez
//
//  Created by WHIZ on 23/12/22.
//


import Foundation

enum Keys: String {
    case name
    case surname
    case lastName
    case gender
    case birth
}


   
final class PersistentData {
    static let shared = PersistentData()

    var name = Persistent<String>(Keys.name.rawValue)
    var surname = Persistent<String>(Keys.surname.rawValue)
    var lastName = Persistent<String>(Keys.lastName.rawValue)
    var gender = Persistent<String>(Keys.gender.rawValue)
    var birth = Persistent<String>(Keys.birth.rawValue)

    init() {
        self.name.value = ""
        self.surname.value = ""
        self.lastName.value = ""
        self.gender.value = ""
        self.birth.value = ""
    }
}

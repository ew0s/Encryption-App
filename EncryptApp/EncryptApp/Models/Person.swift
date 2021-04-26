//
//  Person.swift
//  EncryptApp
//
//  Created by Егор Савковский on 26.04.2021.
//

struct Person {
    let firstName: String
    let lastName: String
    let description: String
    let dateOfBirth: String
    let dateOfDeath: String
    let image: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    var livingPeriod: String {
        "\(dateOfBirth) - \(dateOfDeath)"
    }
}

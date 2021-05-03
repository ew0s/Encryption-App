//
//  Algorithm.swift
//  EncryptApp
//
//  Created by Егор Савковский on 26.04.2021.
//

struct Algorithm {
    let name: String
    let creator: Person
    let description: String
}

// MARK: - Extensions
extension Algorithm {
    // MARK: - Public methods
    static func getAlgorithms() -> [Algorithm] {
        AlgorithmsInfoDataManager.shared.algorithmsData
    }
}

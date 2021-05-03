//
//  StringExtensions.swift
//  EncryptApp
//
//  Created by Егор Савковский on 03.05.2021.
//


// MARK: - Substring extension protocol
extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

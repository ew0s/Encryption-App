//
//  CaesarAlgorithm.swift
//  EncryptApp
//
//  Created by Егор Савковский on 03.05.2021.
//

class CaesarAlgorithm {
    // MARK: - Private constants
    private let alphabet: String
    private let alphabetSize: Int
    
    // MARK: - Public methods
    init(alphabet: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ") {
        self.alphabet = alphabet
        self.alphabetSize = alphabet.count
    }
    
    func encrypt(shift: Int, text: String) -> String {
        var encryptedText = ""
        
        for character in text.uppercased() {
            
            if !alphabet.contains(character) {
                encryptedText.append(character)
                continue
            }
            
            let textIndex = indexOfAlphabet(forCharacter: character)
            let newLetterIndex = (textIndex + shift) % alphabetSize
            
            encryptedText.append(alphabet[newLetterIndex])
        }
        
        return encryptedText
    }
    
    func decrypt(shift: Int, text: String) -> String {
        var decryptedText = ""
        
        for character in text.uppercased() {
            
            if !alphabet.contains(character) {
                decryptedText.append(character)
                continue
            }
            
            let textIndex = indexOfAlphabet(forCharacter: character)
            let newLetterIndex = abs((textIndex - shift + alphabetSize) % alphabetSize)
            
            decryptedText.append(alphabet[newLetterIndex])
        }
        
        return decryptedText
    }
}

// MARK: - Private methods
extension CaesarAlgorithm {
    private func indexOfAlphabet(forCharacter character: Character) -> Int {
        var index = 0
        
        for char in alphabet {
            if char == character {
                return index
            }
            
            index += 1
        }
        
        return -1
    }
}

//
//  VigenereAlgorithm.swift
//  EncryptApp
//
//  Created by Егор Савковский on 28.04.2021.
//

class VigenereAlgorithm {
    // MARK: - Private constants
    private let alphabet: String
    private let alphabetSize: Int
    
    // MARK: -  Public methods
    init(alphabet: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ") {
        self.alphabet = alphabet.uppercased()
        self.alphabetSize = alphabet.count
    }
    
    func encrypt(key: String, text: String) -> String {
        let generatedKey = generateKey(key: key, text: text).uppercased()
        var encryptedText = ""
        
        for (keyCharacter, textCharacter) in zip(generatedKey, text.uppercased()) {
            
            if !alphabet.contains(textCharacter) {
                encryptedText.append(textCharacter)
                continue
            }
            
            let keyIndex = indexOfAlphabet(forCharacter: keyCharacter)
            let textIndex = indexOfAlphabet(forCharacter: textCharacter)
            let newLetterIndex = (keyIndex + textIndex + 1) % alphabetSize
            
            encryptedText.append(alphabet[newLetterIndex])
        }
        
        return encryptedText
    }
    
    func decrypt(key: String, text: String) -> String {
        let generatedKey = generateKey(key: key, text: text)
        var decryptedText = ""
        
        for (keyCharacter, textCharacter) in zip(generatedKey, text.uppercased()) {
            
            if !alphabet.contains(textCharacter) {
                decryptedText.append(textCharacter)
                continue
            }
            
            let keyIndex = indexOfAlphabet(forCharacter: keyCharacter)
            let textIndex = indexOfAlphabet(forCharacter: textCharacter)
            let newLetterIndex = (textIndex - keyIndex + alphabetSize - 1) % alphabetSize
            
            decryptedText.append(alphabet[newLetterIndex])
        }
        
        return decryptedText
    }
}

// MARK: - Private methods
extension VigenereAlgorithm {
    private func generateKey(key: String, text: String) -> String {
        
        var resultKey = ""
        var index = 0
        
        while true {
            if index == key.count {
                index = 0
            }
            if resultKey.count == text.count {
                break
            }
            
            resultKey += String(key[index])
            index += 1
        }
        
        return resultKey.uppercased()
    }
    
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

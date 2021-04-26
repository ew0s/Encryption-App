//
//  AlgorithmsInfoDataManager.swift
//  EncryptApp
//
//  Created by Егор Савковский on 26.04.2021.
//

class AlgorithmsInfoDataManager {
    
    // MARK: - Constants
    static let shared = AlgorithmsInfoDataManager()
    
    // MARK: - Public constants
    let algorithmsData =
        [
            Algorithm(
                name: "Vigenere cipher algorithm",
                creator: Person(
                    firstName: "Blaise",
                    lastName: "Vigenere",
                    description: "Blaise de Vigenère (5 April 1523 – 19 February 1596) (French pronunciation: ​[viʒnɛːʁ]) was a French diplomat, cryptographer, translator and alchemist. Vigenère was born into a respectable family in the village of Saint-Pourçain. His mother, Jean, arranged for him to have a classical education in France. He studied Greek, Hebrew and Italian under Adrianus Turnebus and Jean Dorat.",
                    dateOfBirth: "5 april 1523",
                    dateOfDeath: "19 february 1596",
                    image: "Vigenere"),
                description: "Vigenere Cipher is a method of encrypting alphabetic text. It uses a simple form of polyalphabetic substitution. A polyalphabetic cipher is any cipher based on substitution, using multiple substitution alphabets .The encryption of the original text is done using the Vigenère square or Vigenère table."
            ),
            Algorithm(
                name: "Caesar cipher algorithm",
                creator: Person(
                    firstName: "Gaius Julius",
                    lastName: "Caesar",
                    description: "Gaius Julius Caesar was a Roman general and statesman who played a critical role in the events that led to the demise of the Roman Republic and the rise of the Roman Empire.",
                    dateOfBirth: "12 july 100 BC",
                    dateOfDeath: "15 march 44 BC",
                    image: "Caesar"),
                description: "In cryptography, a Caesar cipher, also known as Caesar's cipher, the shift cipher, Caesar's code or Caesar shift, is one of the simplest and most widely known encryption techniques. It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet."
            )
        ]
    
    // MARK: - Private methods
    private init() {}
}

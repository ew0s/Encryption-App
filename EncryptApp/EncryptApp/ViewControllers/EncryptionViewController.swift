//
//  EncryptionViewController.swift
//  EncryptApp
//
//  Created by Егор Савковский on 03.05.2021.
//

import UIKit

class EncryptionViewController: UIViewController {
    
    // MARK: - Private constants
    private let algorithmsData = AlgorithmsInfoDataManager.shared.algorithmsData
    private let vigenereAlgorithm = VigenereAlgorithm()

    // MARK: - IB Outlets
    @IBOutlet var creatorImage: UIImageView!
    @IBOutlet var algorithmNameLabel: UILabel!
    @IBOutlet var algorithmSegmentControl: UISegmentedControl!
    @IBOutlet var keyTextField: UITextField!
    @IBOutlet var textToCipherTextView: UITextView!
    @IBOutlet var cipheredTextTextView: UITextView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setBackground()
        setSegmentController()
    }
    
    override func viewWillLayoutSubviews() {
        creatorImage.makeRounded()
    }
    
    // MARK: - IB Actions
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func algorithmSegmentControllerTapped(_ sender: Any) {
        let selectedAlgorithm = algorithmsData[algorithmSegmentControl.selectedSegmentIndex]
        creatorImage.image = UIImage(named: selectedAlgorithm.creator.image)
    }
    
    @IBAction func encryptButtonTapped(_ sender: Any) {
        switch algorithmSegmentControl.selectedSegmentIndex {
        case 0:
            guard let (key, textToEncrypt) = getDataFromFields() else {
                showAlert(with: "Invalid to execute algorithm",
                          and: "make sure you filled all the fields")
                return
            }
            
            let encryptedText = vigenereAlgorithm.encrypt(key: key, text: textToEncrypt)
            cipheredTextTextView.text = encryptedText
            
        default:
            showAlert(with: "Invalid algorithm selected", and: "select another algorithm")
            break
        }
    }
    
    @IBAction func decryptButtonTapped(_ sender: Any) {
        switch algorithmSegmentControl.selectedSegmentIndex {
        case 0:
            guard let (key, textToDecrypt) = getDataFromFields() else {
                showAlert(with: "Invalid to execute algorithm",
                          and: "make sure you filled all the fields")
                return
            }
            
            let decryptedText = vigenereAlgorithm.decrypt(key: key, text: textToDecrypt)
            print(decryptedText)
            cipheredTextTextView.text = decryptedText
        default:
            showAlert(with: "Invalid algorithm selected", and: "select another algorithm")
            break
        }
    }
}

// MARK: - Private methods
extension EncryptionViewController {
    private func setSegmentController() {
        algorithmSegmentControl.removeAllSegments()
        
        for (index, algorithm) in algorithmsData.enumerated() {
            algorithmSegmentControl.insertSegment(
                withTitle: "\(algorithm.creator.lastName) algorithm", at: index, animated: false)
        }
    }
    
    private func getDataFromFields() -> (String, String)? {
        guard let key = keyTextField.text, let textToEncrypt = textToCipherTextView.text else {
            return nil
        }
        guard !key.isEmpty else {
            return nil
        }
        
        return (key, textToEncrypt)
    }
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

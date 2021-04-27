//
//  AboutAlgorithmViewController.swift
//  EncryptApp
//
//  Created by Егор Савковский on 26.04.2021.
//

import UIKit

class AboutAlgorithmViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var algorithmCreatorImage: UIImageView!
    @IBOutlet var algorithmNameLabel: UILabel!
    @IBOutlet var algorithmDescriptionTextView: UITextView!
    
    // MARK: - Public variables
    var algorithm: Algorithm!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setBackground()
        
        algorithmDescriptionTextView.isEditable.toggle()
        algorithmCreatorImage.image = UIImage(named: algorithm.creator.image)
        algorithmNameLabel.text = algorithm.name
        algorithmDescriptionTextView.text = algorithm.description
    }
}

//
//  AboutAlgorithmCreatorViewController.swift
//  EncryptApp
//
//  Created by Егор Савковский on 27.04.2021.
//

import UIKit

class AboutAlgorithmCreatorViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var personImage: UIImageView!
    @IBOutlet var personNameLabel: UILabel!
    @IBOutlet var personLivingTimeLabel: UILabel!
    @IBOutlet var personDescriptionTextView: UITextView!
    @IBOutlet var aboutAlgorithmButton: UIButton!
    
    // MARK: - Public variables
    var personAlgorithm: Algorithm!
    
    
    // MARK: - Private variables
    private var person: Person {
        personAlgorithm.creator
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setBackground()
        
        personImage.image = UIImage(named: person.image)
        personImage.makeRounded()
        
        personNameLabel.text = person.fullName
        personLivingTimeLabel.text = person.livingPeriod
        
        personDescriptionTextView.isEditable.toggle()
        personDescriptionTextView.text = person.description
        
        aboutAlgorithmButton.setTitle("About \(person.lastName) algorithm", for: .normal)
        aboutAlgorithmButton.layer.cornerRadius = 15
    }
    
    override func viewWillLayoutSubviews() {
        personImage.makeRounded()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let aboutAlgorithmVC = segue.destination as? AboutAlgorithmViewController else {
            return
        }
        
        aboutAlgorithmVC.algorithm = personAlgorithm
    }
}

//
//  WelcomeViewController.swift
//  EncryptApp
//
//  Created by Егор Савковский on 26.04.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var encryptTextButton: UIButton!
    @IBOutlet var iconImageView: UIImageView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setBackground()
        
        iconImageView.image = UIImage(named: "lock")
        encryptTextButton.layer.cornerRadius = 15
    }
}

//
//  UIImageViewExtensions.swift
//  EncryptApp
//
//  Created by Егор Савковский on 27.04.2021.
//

import UIKit

extension UIImageView {
    func makeRounded() {
        
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

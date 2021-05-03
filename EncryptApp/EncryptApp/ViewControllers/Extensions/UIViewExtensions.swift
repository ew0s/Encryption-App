//
//  UIViewExtensions.swift
//  EncryptApp
//
//  Created by Егор Савковский on 26.04.2021.
//

import UIKit

extension UIView {
    // MARK: -  UIView Public methods
    func setBackground() {
        
        let imageViewBackground = UIImageView(image: UIImage(named: "background"))
        
        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
}

extension UITableView {
    // MARK: - UITableView Public methods
    func setTableViewBackground() {
        self.rowHeight = 80
        self.backgroundView = UIImageView(image: UIImage(named: "background"))
        self.backgroundView?.contentMode = .scaleAspectFill
    }
}

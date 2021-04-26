//
//  UIViewExtensions.swift
//  EncryptApp
//
//  Created by Егор Савковский on 26.04.2021.
//

import UIKit

extension UIView {
    // MARK: - Public methods
    func setBackground() {
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))

        imageViewBackground.image = UIImage(named: "background")
        imageViewBackground.contentMode = .center

        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
        self.insertSubview(addBlur(), aboveSubview: imageViewBackground)
    }
    
    // MARK: - Private methods
    private func addBlur() -> UIVisualEffectView {
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.alpha = 0.6
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        return blurEffectView
    }
}

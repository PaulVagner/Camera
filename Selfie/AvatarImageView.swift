//
//  AvatarImageView.swift
//  Selfie
//
//  Created by Paul Vagner on 10/26/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

@IBDesignable

class AvatarImageView: UIView {
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        
        didSet {
            
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            
        }
    }
    
    override func prepareForInterfaceBuilder() {
        
        layer.cornerRadius = self.frame.size.width / 2
        layer.masksToBounds = true
        
    }
    
    override func layoutSubviews() {
        
        layer.cornerRadius = self.frame.size.width / 2
        layer.masksToBounds = true
        
    }
    
}

//
//  GStevia+UIImageView.swift
//  GSteviaTest
//
//  Created by Glenn Posadas on 04/09/2016.
//  Copyright © 2016 Citus Lab, Inc. All rights reserved.
//

import UIKit

extension UIImageView {
    func makeRoundImageView() -> UIImageView {
        self.layer.cornerRadius = (self.heightConstraint?.constant)! / 2
        self.layer.borderWidth = 0
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.clearColor().CGColor
        self.clipsToBounds = true
        
        return self
    }

    func makeRoundImageViewWithBorder() -> UIImageView {
        self.layer.cornerRadius = (self.heightConstraint?.constant)! / 2
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.clipsToBounds = true
        
        return self
    }
}

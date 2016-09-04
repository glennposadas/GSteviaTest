//
//  TestViewController.swift
//  GSteviaTest
//
//  Created by Glenn Posadas on 04/09/2016.
//  Copyright © 2016 Citus Lab, Inc. All rights reserved.
//

import SteviaLayout
import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let myButton = UIButton(type: .Custom)
        myButton.frame = CGRectZero
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.titleLabel?.text = "test"
        myButton.backgroundColor = GSteviaColor.color.blueTintColor
        self.view.addSubview(myButton)
        
        let myButton2 = UIButton(type: .Custom)
        myButton2.frame = CGRectZero
        myButton2.translatesAutoresizingMaskIntoConstraints = false
        myButton2.titleLabel?.text = "test"
        myButton2.backgroundColor = GSteviaColor.color.blueTintColor
        self.view.addSubview(myButton2)
        
        let myButton3 = UIButton(type: .Custom)
        myButton3.frame = CGRectZero
        myButton3.translatesAutoresizingMaskIntoConstraints = false
        myButton3.titleLabel?.text = "test"
        myButton3.backgroundColor = GSteviaColor.color.blueTintColor
        self.view.addSubview(myButton3)

        self.view.layout([
            100,
            |-myButton-| ~ 80,
            8,
            |-myButton2-| ~ 80,
            "",
            |myButton3| ~ 80,
            0
        ])
    }

}

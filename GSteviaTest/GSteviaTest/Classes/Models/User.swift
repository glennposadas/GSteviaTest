//
//  User.swift
//  GSteviaTest
//
//  Created by Glenn Posadas on 04/09/2016.
//  Copyright © 2016 Citus Lab, Inc. All rights reserved.
//

import UIKit

struct User {
    let key: String!
    let fullName: String!
    let image: String!
    
    init?(json: AnyObject) {
        guard let json = json as? [String: AnyObject] else {
            return nil
        }
        
        guard let key = json["key"] as? String,
            fullName = json["fullname"] as? String,
            image = json["image"] as? String else {
                return nil
        }
        
        self.key = key
        self.fullName = fullName
        self.image = image
    }
}

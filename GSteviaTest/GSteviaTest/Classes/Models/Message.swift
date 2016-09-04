//
//  Message.swift
//  GSteviaTest
//
//  Created by Glenn Posadas on 04/09/2016.
//  Copyright © 2016 Citus Lab, Inc. All rights reserved.
//

import UIKit

struct Message {
    let key: String! // user key
    let messages: [String]!
    let timeStamps: [String]!
    
    init?(key: String, json: AnyObject) {
        guard let json = json as? [String: AnyObject] else {
            return nil
        }
        
        guard let messages = json["messages"] as? [String],
            timeStamps = json["time_stamps"] as? [String] else {
                return nil
        }
        
        self.key = key
        self.messages = messages
        self.timeStamps = timeStamps
    }
}

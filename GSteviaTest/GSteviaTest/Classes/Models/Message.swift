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
    let message: String!
    let timeStamp: String!
    let isUnread: Bool!
    
    init?(json: AnyObject) {
        guard let json = json as? [String: AnyObject] else {
            return nil
        }
        
        guard let key = json["key"] as? String,
            message = json["message"] as? String,
            timeStamp = json["time_stamp"] as? String,
            isUnread = json["is_unread"] as? Bool else {
                return nil
        }
        
        self.key = key
        self.message = message
        self.timeStamp = timeStamp
        self.isUnread = isUnread
    }
}

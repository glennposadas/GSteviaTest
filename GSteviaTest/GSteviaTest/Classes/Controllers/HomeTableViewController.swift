//
//  HomeViewTableController.swift
//  GSteviaTest
//
//  Created by Glenn Posadas on 04/09/2016.
//  Copyright © 2016 Citus Lab, Inc. All rights reserved.
//

import SteviaLayout
import UIKit

class HomeTableViewController: UITableViewController {

    // MARK: - Properties
    var composeBarBtnItem: UIBarButtonItem?
    var users = [User]() // ratio - user : message
    var messages = [Message]()
    
    // MARK: - Functions
    // MARK: TableView Delegates and Data Source
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let chatCell = tableView.dequeueReusableCellWithIdentifier("ChatTableViewCell") as! ChatTableViewCell
        
        let currentUser = users[indexPath.row]
        let messageOfCurrentUser = messages[indexPath.row]
        
        let imageString = currentUser.image
        
        chatCell.userImageView.image = UIImage(named: imageString)
        chatCell.userFullNameLabel.text = currentUser.fullName
        
        chatCell.messageLabel.text = messageOfCurrentUser.message
        chatCell.timeStampLabel.text = messageOfCurrentUser.timeStamp
        chatCell.isUnread = messageOfCurrentUser.isUnread
        
        return chatCell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65.0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
        setupData()
    }
    
    func compose() {
        print("compose")
    }
    
    func newImageview(image: UIImage?) -> UIImageView {
        let newImageview = UIImageView(image: image)
        newImageview.frame = CGRectZero
        newImageview.contentMode = .ScaleAspectFill
        
        return newImageview
    }
    
    func setupData() {
        // mock up some json data
        let messageJSON = [["key":"1", "message":"Sure thing", "time_stamp":"2:33 pm", "is_unread":true],
                           ["key":"2", "message":"Peter Zich sent an image", "time_stamp":"2:30 pm","is_unread":true],
                           ["key":"3", "message":"Going to Kevin's tonight?", "time_stamp":"2:29 pm","is_unread":false],
                           ["key":"4", "message":"You sent a sticker", "time_stamp":"2:28 pm","is_unread":false],
                           ["key":"5", "message":"OMG! This is a rush lol!", "time_stamp":"2:10 pm","is_unread":false]]
        
        let userJSON = [["key":"1", "fullname":"Ryan O'Rourke", "image":"person1"],
                        ["key":"2", "fullname":"Peter Zich", "image":"person2"],
                        ["key":"3", "fullname":"Mac Tyler", "image":"person3"],
                        ["key":"4", "fullname":"Ben Langholz", "image":"person4"],
                        ["key":"5", "fullname":"Rody Duterte", "image":"person5"]]
        
        // fast enum messageJSON
        for messageData in messageJSON {
            guard let newMessage = Message(json: messageData) else {
                return
            }
            
            messages.append(newMessage)
        }
        
        // fast enum userJSON
        for userData in userJSON {
            guard let newUser = User(json: userData) else {
                return
            }
            
            users.append(newUser)
        }
        
        // finally, reload
        tableView.reloadData()
    }
    
    func setupScreen() {
        
        // navigation bar setup
        self.title = "Messenger"
        self.view.backgroundColor = UIColor.whiteColor()
        
        // setup tableview
        tableView.registerClass(ChatTableViewCell.self, forCellReuseIdentifier: "ChatTableViewCell")
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 70, bottom: 0, right: 0)
        tableView.tableFooterView = UIView()
        
        // navigation bar button item
        composeBarBtnItem = UIBarButtonItem(barButtonSystemItem: .Compose,
                                                target: self,
                                                action: #selector(compose))
        self.navigationItem.setRightBarButtonItem(composeBarBtnItem,
                                                  animated: true)
        
    }
}

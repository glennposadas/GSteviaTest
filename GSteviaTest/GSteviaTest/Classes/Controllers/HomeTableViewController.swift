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
    var users = [User]()
    
    // MARK: - Functions
    // MARK: TableView Delegates and Data Source
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let chatCell = tableView.dequeueReusableCellWithIdentifier("ChatTableViewCell") as! ChatTableViewCell
        return chatCell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65.0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return users.count
        return 6
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }
    
    func compose() {
        print("compose")
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

//
//  ChatTableViewCell.swift
//  GSteviaTest
//
//  Created by Glenn Posadas on 04/09/2016.
//  Copyright © 2016 Citus Lab, Inc. All rights reserved.
//

import SteviaLayout
import UIKit

class ChatTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var userImage: UIImage?
    var userFullName: NSString?
    var message: NSString?
    var timeStamp: NSString?
    
    // MARK: - Functions
    func newImageview(image: UIImage?) -> UIImageView {
        let newImageview = UIImageView(image: image)
        newImageview.frame = CGRectZero
        newImageview.contentMode = .ScaleAspectFill
        
        return newImageview
    }
    
    func setupCellViews() {
        if userImage == nil {
            userImage = UIImage(named: "placeholder")
        }
        
        let userImageView = newImageview(userImage)
        let fbMessengerIcon = newImageview(UIImage(named: "messenger_icon"))
        
        let userFullNameLabel = UILabel()
        userFullNameLabel.text = "Ryan O'Rourke"
        
        let messageLabel = UILabel()
        messageLabel.textColor = GSteviaColor.color.blueTintColor
        messageLabel.text = "Sure thing."
        
        let stackView = UIStackView()
        stackView.addArrangedSubview(userFullNameLabel)
        stackView.addArrangedSubview(messageLabel)
        stackView.axis = .Vertical
        stackView.distribution = .FillProportionally
        stackView.spacing = 5.0
        stackView.backgroundColor = UIColor.redColor()
        
        let timeStampLabel = UILabel()
        timeStampLabel.text = "2:33pm"
        
        sv([
            userImageView,
            fbMessengerIcon,
            stackView,
            timeStampLabel
        ])
        
        alignHorizontally([
            userImageView,
            fbMessengerIcon
        ])
        
        layout([
            
            userImageView.width(50.0),
            userImageView.centerVertically().height(50.0),
            |-userImageView,
            
            stackView.centerVertically(),
            |-(userImageView.widthConstraint!.constant + 7.0)-stackView,
            
            timeStampLabel.centerVertically(),
            timeStampLabel-10.0-|,
            
            fbMessengerIcon.width(15.0),
            fbMessengerIcon.height(15.0),
            |-(userImageView.widthConstraint!.constant - 7.0)-fbMessengerIcon,
            7.0 // I believe stevia has no view-alignToBottom-view2 functionality yet???
        ])
        
        // make the imageViews round
        userImageView.makeRoundImageView()
        fbMessengerIcon.makeRoundImageViewWithBorder()
    }
    
    // MARK: Overrides
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

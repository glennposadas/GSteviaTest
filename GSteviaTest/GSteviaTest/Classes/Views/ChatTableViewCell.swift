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
    var userFullNameLabel = UILabel()
    var messageLabel = UILabel()
    var timeStampLabel = UILabel()
    var userImageView = UIImageView()
    
    // MARK: - Functions
    
    func setupCellViews() {
        let fbMessengerIcon = UIImageView(image: UIImage(named: "messenger_icon"))
        fbMessengerIcon.contentMode = .ScaleAspectFill
                
        timeStampLabel.textColor = GSteviaColor.color.blueTintColor
        
        userImageView.contentMode = .ScaleAspectFill
        
        let stackView = UIStackView()
        stackView.addArrangedSubview(messageLabel)
        stackView.addArrangedSubview(userFullNameLabel)
        stackView.axis = .Vertical
        stackView.distribution = .FillProportionally
        stackView.spacing = 5.0
        
        stackView.layout([
            userFullNameLabel.height(25.0),
            messageLabel.height(25.0)
        ])
        
        
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
            |-(userImageView.widthConstraint!.constant + 20.0)-stackView,
            
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
        super.init(coder: aDecoder)
    }
}

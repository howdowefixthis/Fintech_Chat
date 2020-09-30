//
//  ConversationViewCell.swift
//  Chat
//
//  Created by r.burdin on 30.09.2020.
//  Copyright © 2020 r.burdin. All rights reserved.
//

import UIKit

class ConversationViewCell: UITableViewCell, ConfigurableView {
    
    struct MessageCellModel {
        let text: String
    }
    
    @IBOutlet weak var textMessageLabel: UILabel!
    
    func configure(with model: MessageCellModel) {
        typealias ConfigurationModel = MessageCellModel
        
        textMessageLabel.text = model.text
        textMessageLabel.layer.cornerRadius = 5
        textMessageLabel.clipsToBounds = true
    }
    
    
}


//
//  ConversationsListTableViewCell.swift
//  Chat
//
//  Created by r.burdin on 27.09.2020.
//  Copyright © 2020 r.burdin. All rights reserved.
//

import UIKit

protocol ConfigurableView {
    
    associatedtype ConfigurationModel
    
    func configure(with model: ConfigurationModel)
}

class ConversationsListTableViewCell: UITableViewCell, ConfigurableView {
    
    struct ConversationCellModel {
        let name: String
        let message: String
        let date: Date
        let isOnline: Bool
        let hasUnreadMessages: Bool
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configure(with model: ConversationCellModel) {
        typealias ConfigurationModel = ConversationCellModel
        
        nameLabel.text = model.name
        
        if model.message == "" {
            messageLabel.font = UIFont(name: "Arial", size: 13.0)
            messageLabel.text = "No messages yet"
			
			dateLabel.text = ""
			
        } else {
            messageLabel.text = model.message
			
			let dateFormatter = DateFormatter()
			let calendar = Calendar.current

			if calendar.isDateInToday(model.date) {
				dateFormatter.dateFormat = "HH:mm"
			} else {
				dateFormatter.dateFormat = "dd MMM"
			}

			dateLabel.text = dateFormatter.string(from: model.date)
        }
        
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current

        if calendar.isDateInToday(model.date) {
            dateFormatter.dateFormat = "HH:mm"
        } else {
            dateFormatter.dateFormat = "dd MMM"
        }

        dateLabel.text = dateFormatter.string(from: model.date)
        
        //if model.isOnline == false {
        //    backgroundColor = .init(red: 242/255, green: 237/255, blue: 110/255, alpha: 1.0)
       // }
        
        if model.hasUnreadMessages {
            messageLabel.font = UIFont.boldSystemFont(ofSize: 18)
            print(messageLabel.font.fontName)
            print(messageLabel.font.fontDescriptor)
        }
    }
    
    
}

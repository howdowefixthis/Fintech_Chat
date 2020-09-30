//
//  ConversationsListViewController.swift
//  Chat
//
//  Created by r.burdin on 27.09.2020.
//  Copyright © 2020 r.burdin. All rights reserved.
//

import UIKit


class ConversationsListViewController: BaseViewController {
    
    var conversations = [Conversation(name: "Esha Gillis", message: "As for as I know", date: Date(timeIntervalSinceReferenceDate: 1600401600000.0), isOnline: true, hasUnreadMessages: false),
                        Conversation(name: "Kristal Ansar", message: "You are welcome", date: Date(timeIntervalSinceReferenceDate: 1600401600000.0), isOnline: true, hasUnreadMessages: true),
                        Conversation(name: "Shelby Jaime", message: "Where are you?", date: Date(timeIntervalSinceReferenceDate: 1600488000000.0), isOnline: false, hasUnreadMessages: true),
                        Conversation(name: "Augusta Stephany", message: "I've got to go now", date: Date(timeIntervalSinceNow: 0.0), isOnline: false, hasUnreadMessages: false),
                        Conversation(name: "Rolph Crofton", message: "Sorry for that", date: Date(timeIntervalSinceNow: 0.0), isOnline: true, hasUnreadMessages: false),
                        Conversation(name: "Ebba Janice", message: "Okay", date: Date(timeIntervalSinceReferenceDate: 1600610400000.0), isOnline: false, hasUnreadMessages: false),
                        Conversation(name: "Nikole Isla", message: "It's nice to know that", date: Date(timeIntervalSinceReferenceDate: 1600797600000.0), isOnline: false, hasUnreadMessages: true),
                        Conversation(name: "Sampson Davida", message: "I don't really know", date: Date(timeIntervalSinceReferenceDate: 1600797600000.0), isOnline: false, hasUnreadMessages: true),
                        Conversation(name: "Vonda Jenifer", message: "See you on Monday", date: Date(timeIntervalSinceReferenceDate: 1600884000000.0), isOnline: true, hasUnreadMessages: true),
                        Conversation(name: "Brittney Silvia", message: "Again?", date: Date(timeIntervalSinceReferenceDate: 1600884000000.0), isOnline: true, hasUnreadMessages: false),
                        Conversation(name: "Lawrence Ellington", message: "", date: Date(), isOnline: false, hasUnreadMessages: false),
                        Conversation(name: "Connor Dalton", message: "Thanks for the help", date: Date(timeIntervalSinceReferenceDate: 1600894800000.0), isOnline: true, hasUnreadMessages: true),
                        Conversation(name: "Sharleen Tyrone", message: "Just a second", date: Date(timeIntervalSinceReferenceDate: 1600956000000.0), isOnline: false, hasUnreadMessages: true),
                        Conversation(name: "Ella Velma", message: "Awful day", date: Date(timeIntervalSinceNow: 0.0), isOnline: false, hasUnreadMessages: true),
                        Conversation(name: "Olyvia Evelynn", message: "", date: Date(), isOnline: true, hasUnreadMessages: false),
                        Conversation(name: "Mortimer Brenden", message: "Thanks", date: Date(timeIntervalSinceNow: 0.0), isOnline: true, hasUnreadMessages: true),
                        Conversation(name: "Jeannette Kurtis", message: "What's happend?", date: Date(timeIntervalSinceReferenceDate: 1601215200000.0), isOnline: true, hasUnreadMessages: false),
                        Conversation(name: "Emmie Aubree", message: "Call me back, please", date: Date(timeIntervalSinceReferenceDate: 1601215200000.0), isOnline: false, hasUnreadMessages: true),
                        Conversation(name: "Quinten Roy", message: "It's a pity", date: Date(timeIntervalSinceReferenceDate: 1601215200000.0), isOnline: false, hasUnreadMessages: true),
                        Conversation(name: "Sullivan Artie", message: "Forget it", date: Date(timeIntervalSinceReferenceDate: 1601215200000.0), isOnline: true, hasUnreadMessages: false),]
     

    
    func getOnlineConversations(conversations: [Conversation]) -> [Conversation] {
        return conversations.filter{$0.isOnline}
    }
    
    func getOfflineConversations(conversations: [Conversation]) -> [Conversation] {
        return conversations.filter{$0.isOnline == false}
    }
    
    var onlineConversations : [Conversation] = []
    var offlineConversations : [Conversation] = []
    
    struct Conversation {
        let name: String
        let message: String
        let date: Date
        let isOnline: Bool
        let hasUnreadMessages: Bool
    }

    
    private let cellIdentifire = String(describing: ConversationsListTableViewCell.self)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.register(UINib(nibName: String(describing: ConversationsListTableViewCell.self), bundle: nil), forCellReuseIdentifier: cellIdentifire)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }
}

extension ConversationsListViewController: UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Online"
        } else {
            return "History"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        onlineConversations = self.getOnlineConversations(conversations: conversations)
        offlineConversations = self.getOfflineConversations(conversations: conversations)
        if section == 0 {
            return onlineConversations.count
        } else {
            return offlineConversations.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let conversation : Conversation
        onlineConversations = self.getOnlineConversations(conversations: conversations)
        offlineConversations = self.getOfflineConversations(conversations: conversations)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath) as? ConversationsListTableViewCell else {
            return UITableViewCell()
        }
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        if indexPath.section == 0 {
            conversation = onlineConversations[indexPath.row]
            cell.backgroundColor = UIColor.init(red: 242/255, green: 237/255, blue: 110/255, alpha: 1.0)
        } else {
            conversation = offlineConversations[indexPath.row]
			cell.backgroundColor = UIColor.white
        }
        
        cell.configure(with: .init(name: conversation.name, message: conversation.message, date: conversation.date, isOnline: conversation.isOnline, hasUnreadMessages: conversation.hasUnreadMessages))
        
        return cell
    }

}

extension ConversationsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let controller = ProfileViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

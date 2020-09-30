//
//  ConversationViewController.swift
//  Chat
//
//  Created by r.burdin on 30.09.2020.
//  Copyright © 2020 r.burdin. All rights reserved.
//

import UIKit


class ConversationViewController: BaseViewController {
    
    var messages = [Message(text: "What's for dinner?"),
                    Message(text: "I'm not sure."),
                    Message(text: "How about a pizza?"),
                    Message(text: "You had pizza for lunch."),
                    Message(text: "But I love pizza."),
                    Message(text: "Everybody loves pizza."),
                    Message(text: "So why can't I have pizza for dinner?"),
                    Message(text: "Because you need variety."),
                    Message(text: "What's variety?"),
                    Message(text: "Different things—not the same thing all the time."),
                    Message(text: "You mean, like a pepperoni pizza instead of a cheese pizza?")]
    
    struct Message {
        let text: String
    }

    
    private let cellIdentifire = String(describing: ConversationViewCell.self)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.register(UINib(nibName: String(describing: ConversationViewCell.self), bundle: nil), forCellReuseIdentifier: cellIdentifire)
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.transform = CGAffineTransform(rotationAngle: -(CGFloat)(Double.pi))
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(tableView)
    }
}

extension ConversationViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return messages.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let message = messages.reversed()[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath) as? ConversationViewCell else {
            return UITableViewCell()
        }
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.init(red: 220/255, green: 247/255, blue: 197/255, alpha: 1.0)
            //cell.textLabel?.adjustsFontSizeToFitWidth
            cell.textLabel?.bounds = CGRect(x: 8, y: 7, width: 40, height: 20)
            
        } else {
            cell.backgroundColor = UIColor.init(red: 223/255, green: 223/255, blue: 223/255, alpha: 1.0)
            cell.textLabel?.bounds = CGRect(x: 180, y: 7, width: 40, height: 20)
        }
        cell.configure(with: .init(text: message.text))
        cell.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        return cell
    }
    
}


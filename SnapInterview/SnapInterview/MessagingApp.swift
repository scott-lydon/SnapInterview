//
//  MessagingApp.swift
//  SnapInterview
//
//  Created by Scott Lydon on 6/12/20.
//  Copyright © 2020 Scott Lydon. All rights reserved.
//

import Foundation


struct Conversation: Codable {
    var messages: [Message]
    var otherUserID: [Int]
    
    init(message: [Message] = [], otherUserID: [Int] = []) {
        self.message = message
        self.otherUserID = otherUserID
    }
    
    enum Message {
        case photo(Photo), text(Text)
    }
    
    struct Photo: Codable {
        var timeStamp: Date
        var imagePath: String
        var image: UIImage?
        
    
    }
    
    struct Text {
        var content: String
        var timeStamp: Date
        var otherOrThis: OtherOrThis
        
        
        enum OtherOrThis {
            case this, other
        }
        
        enum Align {
            case right, left
            
            init(_ language: Language) {
                if language == .arabic || language == .hindi {
                    self = .right
                }
            }
        }
        
        init(content: String, timeStamp: Date = Date(), language: Language) {
            self.init(content: String, timeStamp: Date = Date(), align: Align(Language))
        }
    
        init(content: String, timeStamp: Date = Date(), align: Align) {
            self.text = content
            self.timeStamp = timeStamp
        }
    }
}

class UITableViewCell {
    
    
}

let message: Conversation.Message

class MessageFeed: SnapViewController {
    
    var conversation: Conversation = Conversation()  {
        didSet {
            tableView.reloadData()
        }
    }
    @IBoutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        URL.conversation { [weak self] conversationData in
            let conversation = Conversation(conversationData)
            
        }
    }
}

extension MessageFeed: UITableviewDelegate, UITableViewDataSource {
    
    func sections() {
        
    }
    
    func indexFOrRow() {
        
    }
    
    func cellforrowat() {
        // returns the initialized cell.
    }
}

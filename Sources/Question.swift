//
//  Question.swift
//  SwiftStack
//
//  Created by FelixSFD on 06.12.16.
//
//

import Foundation

public class Question: Post {
    
    // - MARK: Closed details
    
    /**
     This type represents details about a question closure.
     
     - author: FelixSFD
     */
    public struct ClosedDetails {
        
        // - MARK: Initializers
        
        public init?(jsonString json: String) {
            do {
                guard let dictionary = try JSONSerialization.jsonObject(with: json.data(using: String.Encoding.utf8)!, options: .allowFragments) as? [String: Any] else {
                    return nil
                }
                
                self.init(dictionary: dictionary)
            } catch {
                return nil
            }
        }
        
        public init(dictionary: [String: Any]) {
            //self.by_users = nil
            self.description = dictionary["description"] as? String
            self.on_hold = dictionary["on_hold"] as? Bool
            
            if let questionsArray = dictionary["original_questions"] as? [[String: Any]] {
                var questionsTmp = [Question]()
                
                for question in questionsArray {
                    let questionTmp = Question(dictionary: question)
                    questionsTmp.append(questionTmp)
                }
            }
            
            self.reason = dictionary["reason"] as? String
        }
        
        // - MARK: Fields
        
        //NOTE: Wait for PR #1
        public var by_users: [Any]?
        
        public var description: String?
        
        public var on_hold: Bool?
        
        public var original_questions: [Question]?
        
        public var reason: String?
    }
    
    
    // - MARK: Initializers
    
    /**
     Initializes the object from a JSON string.
     
     - parameter json: The JSON string returned by the API
     
     - author: FelixSFD
     */
    public required convenience init?(jsonString json: String) {
        do {
            guard let dictionary = try JSONSerialization.jsonObject(with: json.data(using: String.Encoding.utf8)!, options: .allowFragments) as? [String: Any] else {
                return nil
            }
            
            self.init(dictionary: dictionary)
        } catch {
            return nil
        }
    }
    
    public required init(dictionary: [String: Any]) {
        super.init(dictionary: dictionary)
        
        //only set the new properties here. The rest is managed by the superclass
        
        self.accepted_answer_id = dictionary["accepted_answer_id"] as? Int
        self.answer_count = dictionary["answer_count"] as? Int
        //self.answers = nil
        self.bounty_amount = dictionary["bounty_amount"] as? Int
        
        if let timestamp = dictionary["bounty_closes_date"] as? Double {
            self.bounty_closes_date = Date(timeIntervalSince1970: timestamp)
        }
        
        //self.bounty_user = nil
        self.can_close = dictionary["can_close"] as? Bool
        self.can_flag = dictionary["can_flag"] as? Bool
        self.close_vote_count = dictionary["close_vote_count"] as? Int
        
        if let timestamp = dictionary["closed_date"] as? Double {
            self.closed_date = Date(timeIntervalSince1970: timestamp)
        }
        
        if let closedDetailsDict = dictionary["closed_details"] as? [String: Any] {
            self.closed_details = ClosedDetails(dictionary: closedDetailsDict)
        }
        
        
        self.closed_reason = dictionary["closed_reason"] as? String
        
        if let timestamp = dictionary["community_owned_date"] as? Double {
            self.community_owned_date = Date(timeIntervalSince1970: timestamp)
        }
        
        if let timestamp = dictionary["creation_date"] as? Double {
            self.creation_date = Date(timeIntervalSince1970: timestamp)
        }
        
        self.delete_vote_count = dictionary["delete_vote_count"] as? Int
        self.favorite_count = dictionary["favorite_count"] as? Int
        self.favorited = dictionary["favorites"] as? Bool
        self.is_answered = dictionary["is_answered"] as? Bool
        
        if let timestamp = dictionary["locked_date"] as? Double {
            self.locked_date = Date(timeIntervalSince1970: timestamp)
        }
        
        //self.migrated_from = nil
        //self.migrated_to = nil
        
        if let noticeArray = dictionary["notice"] as? [String: Any] {
            self.notice = Notice(dictionary: noticeArray)
        }
        
        if let timestamp = dictionary["protected_date"] as? Double {
            self.protected_date = Date(timeIntervalSince1970: timestamp)
        }
        
        self.question_id = dictionary["question_id"] as? Int
        self.reopen_vote_count = dictionary["reopen_vote_count"] as? Int
        self.tags = dictionary["tags"] as? [String]
        
        self.view_count = dictionary["view_count"] as? Int
    }
    
    
    
    // - MARK: Properties returned from API
    
    public var accepted_answer_id: Int?
    
    public var answer_count: Int?
    
    //NOTE: [Answer]
    public var answers: [Any]?
    
    public var bounty_amount: Int?
    
    public var bounty_closes_date: Date?
    
    //NOTE: Wait for PR #1
    public var bounty_user: Any?
    
    public var can_close: Bool?
    
    public var can_flag: Bool?
    
    public var close_vote_count: Int?
    
    public var closed_date: Date?
    
    //NOTE: closed_Details
    public var closed_details: ClosedDetails?
    
    public var closed_reason: String?
    
    public var community_owned_date: Date?
    
    public var creation_date: Date?
    
    public var delete_vote_count: Int?
    
    public var favorite_count: Int?
    
    public var favorited: Bool?
    
    public var is_answered: Bool?
    
    public var locked_date: Date?
    
    //NOTE: migration info
    public var migrated_from: Any?
    
    public var migrated_to: Any?
    
    public var notice: Notice?
    
    public var protected_date: Date?
    
    public var question_id: Int?
    
    public var reopen_vote_count: Int?
    
    public var tags: [String]?
    
    public var view_count: Int?
    
    
    
    
}

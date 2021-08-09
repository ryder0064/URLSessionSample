//
//  User.swift
//  URLSessionSample
//
//  Created by 陳耀奇 on 2021/8/4.
//

import Foundation


struct UserRequestBody: Encodable {
    var name: String
    var job: String
}

struct UserPostResponse: Decodable {
    var name: String
    var job: String
    var id: String?
    var dateCreated: Date?
    
    var modifiedId: String {
        if let newId = id {
            return newId
        } else {
            return "******"
        }
    }
    
    var modifiedDateCreated: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        if let newDate = dateCreated {
            return dateFormatter.string(from: newDate)
        } else {
            return "******"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case job
        case id
        case dateCreated = "createdAt"
    }
}

struct UserGetResponse: Decodable {
    let page : Int
    let perPage : Int
    let total: Int
    let totalPages : Int
    let data : [User]
}

struct User : Decodable, Hashable {
    let id : Int
    let email : String
    let firstName : String
    let lastName : String
    let avatar : String
}

struct UserUpdateResponse: Decodable {
    var name: String
    var job: String
    var updatedAt: Date?
    
    var modifiedUpdateAt: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        if let newDate = updatedAt {
            return dateFormatter.string(from: newDate)
        } else {
            return "******"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case job
        case updatedAt
    }
}

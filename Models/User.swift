//
//  User.swift
//  ToDoList
//
//  Created by Sanjith Ponnusamy on 1/3/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}

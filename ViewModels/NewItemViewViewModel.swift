//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Sanjith Ponnusamy on 1/3/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        // get current user id
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create model for to do list item
        let newID = UUID().uuidString
        let newItem = ToDoListItem(id: newID, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        // Save the model to the data base
        let db = Firestore.firestore()
        
        db.collection("users").document(uID).collection("todos").document(newID).setData(newItem.asDictionary())
    }
    
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}

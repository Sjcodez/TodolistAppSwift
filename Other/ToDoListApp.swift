//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Sanjith Ponnusamy on 1/3/24.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

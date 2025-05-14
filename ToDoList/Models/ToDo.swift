//
//  ToDo.swift
//  ToDoList
//
//  Created by Jeremy Taylor on 5/13/25.
//

import Foundation
import SwiftData

@MainActor
@Model
class ToDo {
  var item: String = ""
  var reminderIsOn = false
  var dueDate = Date.now + 60*60*24
  var notes = ""
  var isCompleted = false
  
  init(item: String = "", reminderIsOn: Bool = false, dueDate: Date = Date.now + 60*60*24, notes: String = "", isCompleted: Bool = false) {
    self.item = item
    self.reminderIsOn = reminderIsOn
    self.dueDate = dueDate
    self.notes = notes
    self.isCompleted = isCompleted
  }
}

extension ToDo {
  static var preview: ModelContainer {
    let container = try! ModelContainer(for: ToDo.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    // Add mock data
    container.mainContext.insert(ToDo(item: "Create Swift Data Lessons", reminderIsOn: true, dueDate: Date.now + 60*60*24, notes: "Now with iOS 18 and Xcode 16", isCompleted: false))
    container.mainContext.insert(ToDo(item: "Play with Angel", reminderIsOn: true, dueDate: Date.now + 60*60*44, notes: "Kitty Time!", isCompleted: false))
    container.mainContext.insert(ToDo(item: "Eat Dinner", reminderIsOn: true, dueDate: Date.now + 60*60*72, notes: "Ribs & Sides", isCompleted: false))
    container.mainContext.insert(ToDo(item: "Go to Bed", reminderIsOn: true, dueDate: Date.now + 60*60*10, notes: "Goodnight", isCompleted: false))
    
    return container
  }
}

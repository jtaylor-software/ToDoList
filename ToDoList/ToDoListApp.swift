//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Jeremy Taylor on 5/12/25.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView()
            .modelContainer(for: ToDo.self)
        }
    }
  // Will allow us to find where our simulator data is saved:
  init() {
    print(URL.applicationSupportDirectory.path(percentEncoded: false))
  }
}

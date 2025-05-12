//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Jeremy Taylor on 5/12/25.
//

import SwiftUI

struct ToDoListView: View {
  var toDos = [
    "Learn Swift",
    "Build Apps",
    "Change the World",
    "Bring the Awesome",
    "Take a Vacation"
  ]
  
    var body: some View {
      NavigationStack {
        List {
          ForEach(toDos, id: \.self) { toDo in
            NavigationLink {
              DetailView(passedValue: toDo)
            } label: {
              Text(toDo)
            }

            
          }
        }
        .navigationTitle("To Do List")
        .listStyle(.plain)
      }
    }
}

#Preview {
    ToDoListView()
}

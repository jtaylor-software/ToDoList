//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Jeremy Taylor on 5/12/25.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
  @Query var toDos: [ToDo]
  @State private var sheetIsPresented = false
  @Environment(\.modelContext) var modelContext
  
    var body: some View {
      NavigationStack {
        List {
          ForEach(toDos) { toDo in
            NavigationLink {
              DetailView(toDo: toDo)
            } label: {
              Text(toDo.item)
                .font(.title2)
            }

            
          }
        }
        .navigationTitle("To Do List")
        .listStyle(.plain)
        .sheet(isPresented: $sheetIsPresented) {
          NavigationStack {
            DetailView(toDo: ToDo())
          }
        }
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) {
            Button {
              sheetIsPresented.toggle()
            } label: {
              Image(systemName: "plus")
            }

          }
        }
      }
    }
}

#Preview {
    ToDoListView()
    .modelContainer(for: ToDo.self, inMemory: true)
}

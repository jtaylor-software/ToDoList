//
//  DetailView.swift
//  ToDoList
//
//  Created by Jeremy Taylor on 5/12/25.
//

import SwiftUI
import SwiftData

struct DetailView: View {
  @State var toDo: ToDo
  @State private var item = ""
  @State var reminderIsOn = false
  //@State private var dueDate = Date.now + 60*60*24
  @State private var dueDate = Calendar.current.date(byAdding: .day, value: 1, to: Date.now)!
  @State private var notes = ""
  @State private var isCompleted = false
  @Environment(\.modelContext) var modelContext
  @Environment(\.dismiss) private var dismiss
  
  var body: some View {
    List {
      TextField("Enter To Do here", text: $item)
        .font(.title)
        .textFieldStyle(.roundedBorder)
        .padding(.vertical)
        .listRowSeparator(.hidden)
      
      Toggle("Set Reminder:", isOn: $reminderIsOn)
        .padding(.top)
        .listRowSeparator(.hidden)
      
      DatePicker("Date:", selection: $dueDate)
        .listRowSeparator(.hidden)
        .padding(.bottom)
        .disabled(!reminderIsOn)
      
      Text("Notes:")
        .padding(.top)
      
      TextField("Notes", text: $notes, axis: .vertical)
        .textFieldStyle(.roundedBorder)
        .listRowSeparator(.hidden)
      
      Toggle("Completed:", isOn: $isCompleted)
        .padding(.top)
        .listRowSeparator(.hidden)
        
    }
    .listStyle(.plain)
    .onAppear {
      // Move data from toDo object to local vars
      item = toDo.item
      reminderIsOn = toDo.reminderIsOn
      dueDate = toDo.dueDate
      notes = toDo.notes
      isCompleted = toDo.isCompleted
    }
    .navigationBarBackButtonHidden()
    .toolbar {
      ToolbarItem(placement: .topBarLeading) {
        Button("Cancel") {
          dismiss()
        }
      }
      ToolbarItem(placement: .topBarTrailing) {
        Button("Save") {
          // Move data from local vars to toDo object
          toDo.item = item
          toDo.reminderIsOn = reminderIsOn
          toDo.dueDate = dueDate
          toDo.notes = notes
          toDo.isCompleted = isCompleted
          modelContext.insert(toDo)
          guard let _ = try? modelContext.save() else {
            print("😡 ERROR: Save on Detail View did not work.")
            return
          }
          dismiss()
        }
      }
    }
  }
}

#Preview {
  NavigationStack {
    DetailView(toDo: ToDo())
      .modelContainer(for: ToDo.self, inMemory: true)
  }
}

//
//  ToDosViewModel.swift
//  ToDoList
//
//  Created by Jeremy Taylor on 1/10/23.
//

import Foundation

class ToDosViewModel: ObservableObject {
    @Published var toDos: [ToDo] = []
    
    init() {
        toDos.append(ToDo(id: UUID().uuidString, item: "Learn Swift"))
        toDos.append(ToDo(id: UUID().uuidString, item: "Build Apps"))
        toDos.append(ToDo(id: UUID().uuidString, item: "Change the World!"))
    }
    
    func saveToDo(toDo: ToDo) {
        // if new, append to toDosVM.todos else update the toDo that was passed in from the List
        if toDo.id == nil {
            var newTodo = toDo
            newTodo.id = UUID().uuidString
            toDos.append(newTodo)
        } else {
            if let index = toDos.firstIndex(where: {$0.id == toDo.id}) {
                toDos[index] = toDo
            }
        }
    }
    
    func deleteToDo(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
    }
    
    func moveToDo(fromOffsets: IndexSet, toOffset: Int) {
        toDos.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
}

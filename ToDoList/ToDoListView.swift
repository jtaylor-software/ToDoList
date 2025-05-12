//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Jeremy Taylor on 5/12/25.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
      NavigationStack {
        VStack {
          NavigationLink {
           DetailView()
          } label: {
            Image(systemName: "eye")
            Text("Show the New View!")
          }
          .buttonStyle(.borderedProminent)
        }
        .padding()
      }
    }
}

#Preview {
    ToDoListView()
}

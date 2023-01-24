//
//  ContentView.swift
//  Test
//
//  Created by John Liu on 1/23/23.
//

import SwiftUI


struct ContentView: View {
    struct Todo: Hashable {
        var id = UUID()
        var text: String
        var isCompleted: Bool
    }

    @State var todos: [Todo] = []
    @State var newTodo: String = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New Todo", text: $newTodo)
                    Button(action: {
                        self.todos.append(Todo(text: self.newTodo, isCompleted: false))
                        self.newTodo = ""
                    }) {
                        Image(systemName: "plus")
                    }
                }
                .padding()
                List {
                    ForEach(todos, id: \.self) { todo in
                        HStack {
                            Image(systemName: todo.isCompleted ? "checkmark.circle" : "circle")
                                .onTapGesture {
                                    let index = self.todos.firstIndex { $0.id == todo.id }!
                                    self.todos[index].isCompleted.toggle()
                                }
                            Text(todo.text)
                        }
                    }
                    .onDelete { indexSet in
                        self.todos.remove(atOffsets: indexSet)
                    }
                }
            }
            .navigationBarTitle("Todo List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

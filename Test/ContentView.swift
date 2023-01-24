//
//  ContentView.swift
//  Test
//
//  Created by John Liu on 1/23/23.
//

import SwiftUI

struct ContentView: View {
    @State private var items = ["Item 1", "Item 2", "Item 3"]

    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: deleteItems)
            }
            .navigationBarTitle("Items")
            .navigationBarItems(trailing:
                HStack {
                    Button(action: addItem) {
                        Image(systemName: "plus")
                    }
                }
            )
        }
    }

    func addItem() {
        items.append("New Item")
    }

    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

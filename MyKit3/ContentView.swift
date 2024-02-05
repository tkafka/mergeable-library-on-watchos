//
//  ContentView.swift
//  testFramework
//
//  Created by Tomas Kafka on 25.09.2023.
//

import SwiftUI
import SwiftData

public struct ContentView: View {
	public init(_items: Query<Array<Item>.Element, [Item]> = .init(), myEnum: MyEnum = .one) {
		self._items = _items
		self.myEnum = myEnum
	}
	
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
	
	private var myEnum: MyEnum = .one

  public var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
							
							Text("One or two? \(myEnum.str).")
            }
            .toolbar {
							#if !os(watchOS)
                ToolbarItem(placement: .navigationBarTrailing) {
									
                    EditButton()
                }
							#endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
					Text("Select \(myEnum.str) item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

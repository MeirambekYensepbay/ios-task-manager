//
//  ContentView.swift
//  TaskManager
//
//  Created by Meirambek Yensepbay on 16.10.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [Task]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(tasks) { task in
                    NavigationLink {
                        VStack(spacing: 20) {
                            Text(task.name)
                                
                            Text(task.desc)
                            
                            Text("\(task.date)")
                            
                            Text("\(task.status)")
                        }
                        .padding(.horizontal)
                    } label: {
                        Text(task.name)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    NavigationLink(destination: CreateTask(), label: {
                        Text("Создать")
                    })
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(tasks[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self, inMemory: true)
}

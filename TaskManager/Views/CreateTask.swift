//
//  CreateTask.swift
//  TaskManager
//
//  Created by Meirambek Yensepbay on 16.10.2024.
//

import SwiftUI
import SwiftData

enum TaskStatus: String, CaseIterable, Identifiable, Codable {
    case todo = "Надо сделать"
    case in_progress = "В процессе"
    case done = "Готово"
    var id: String { self.rawValue } // Для соответствия протоколу Identifiable

}


struct CreateTask: View {
    
    @State var title: String = ""
    @State var description: String = ""
    @State var dateTime: Date = Date()
    @State var status: TaskStatus = .todo
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
            VStack {
                Form {
                    Section {
                        TextField("Название", text: $title)
                    }
                    Section {
                        TextEditor(text: $description)
                    }
                    Section {
                        DatePicker("Дата и время", selection: $dateTime)
                    }
                    
                    Picker("Статус", selection: $status) {
                        ForEach(TaskStatus.allCases) { item in
                           Text(item.rawValue).tag(item)
                       }
                    }
                    .padding()
                    
                    Section {
                        Button(action: {
                            let task = Task(name: title, desc: description, status: status, date: dateTime)
                            
                            modelContext.insert(task)
                            
                            title = ""
                            description = ""
                            status = .todo
                            dateTime = Date()
                        }, label: {
                            Text("Создать")
                        })
                    }
                }
            }
            .navigationTitle("Create Task")
    }
}

#Preview {
    CreateTask()
}

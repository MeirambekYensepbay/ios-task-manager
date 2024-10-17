//
//  Task.swift
//  TaskManager
//
//  Created by Meirambek Yensepbay on 16.10.2024.
//

import Foundation
import SwiftData

@Model
final class Task {
    var id: UUID
    var name: String
    var desc: String
    var status: TaskStatus
    var date: Date

    init(name: String, desc: String, status: TaskStatus, date: Date) {
        self.id = UUID() // Генерируем уникальный идентификатор
        self.name = name
        self.desc = desc
        self.status = status
        self.date = date
    }
}

//
//  Task.swift
//  Task List
//
//  Created by Roman on 9/30/23.
//

import Foundation

struct Task: Identifiable, Hashable{
    let id: UUID
    var title: String
    var notes: String
    var isCompleted: Bool
    static var sampleTasks: [Task]{
        return [
            Task(id: UUID(), title: "task1", notes: "some notes",  isCompleted: false),
        Task(id: UUID(), title: "task2",  notes: "some notes",isCompleted: true),
        Task(id: UUID(), title: "task3",  notes: "some notes",isCompleted: false),Task(id: UUID(), title: "task4",  notes: "some notes",isCompleted: false),Task(id: UUID(), title: "task5",  notes: "some notes",isCompleted: false)
        ]
    }
}

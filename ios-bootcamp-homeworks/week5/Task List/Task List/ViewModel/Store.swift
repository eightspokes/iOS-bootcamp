//
//  Store.swift
//  Task List
//
//  Created by Roman on 9/30/23.
//

import Foundation

class TaskViewModel: ObservableObject {
 
    @Published var tasks: [Task]
    
    init(isPreview: Bool = false) {
        if isPreview{
            self.tasks = Task.sampleTasks
        } else{
            //self.tasks = [Task]()
            self.tasks = Task.sampleTasks
        }
       
    }
    
    func addTask(title: String, notes: String ) {
        let newTask = Task(id: UUID(), title: title, notes: notes, isCompleted: false)
        tasks.append(newTask)
    }
    
    func removeTask(with id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks.remove(at: index)
        }
    }
    
    func getTask(with id: UUID) -> Task?{
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            return tasks[index]
        }
        else{
            return nil
        }
    }
    
    func toggleTaskCompletion(with id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isCompleted = tasks[index].isCompleted == true ? false : true
        }
    }
}

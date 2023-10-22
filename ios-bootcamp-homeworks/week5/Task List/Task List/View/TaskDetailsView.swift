//
//  TaskDetailsView.swift
//  Task List
//
//  Created by Roman on 10/1/23.
//

import SwiftUI

struct TaskDetailsView: View {
    var task: Task
    @EnvironmentObject var taskViewModel: TaskViewModel
    private func binding(for taskId: UUID) -> Binding<Bool> {
        Binding<Bool>(
            get: {
                self.taskViewModel.getTask(with: taskId)?.isCompleted ?? false
            },
            set: { newValue in
                if let task = self.taskViewModel.getTask(with: taskId) {
                    self.taskViewModel.toggleTaskCompletion(with: task.id)
                }
            }
        )
    }
    var body: some View {
        List {
            Section(header: Text("TASK TITLE ")) {
                Text(task.title)
            }
            
            Section(header: Text("Notes")) {
                Text(task.notes)
            }
            Section() {
                Toggle("Completed", isOn: binding(for: task.id))
            }  
        }
    }
}

struct TaskDetailsView_Previews: PreviewProvider {
    static var task = Task(id: UUID(), title: "Task", notes: "some notes", isCompleted: false)
    
    static var previews: some View {
        TaskDetailsView(task: task)
    }
}

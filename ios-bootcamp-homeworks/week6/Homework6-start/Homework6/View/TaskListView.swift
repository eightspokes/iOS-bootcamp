//
//  TaskListView.swift
//  

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskStore: TaskStore
    var showTasksCompleted: Bool = false
    var showAllTasks: Bool = false
    @State private var searchText = ""
    
    let gridSpacing: CGFloat = 10
    let gridSquareSize: CGFloat = 170
    
    var gridRows: [GridItem] {
        return[
            GridItem(.fixed(gridSquareSize), spacing: gridSpacing, alignment: .center),
            GridItem(.fixed(gridSquareSize), spacing: gridSpacing, alignment: .center)
        ]
    }
    var searchResults: [Task] {
        if searchText.isEmpty {
            return taskStore.tasks
        } else {
            return taskStore.tasks.filter { $0.title.contains(searchText) }
        }
    }
    var body: some View {
        VStack {
            if showAllTasks{
                LazyHGrid(rows: gridRows, alignment: .center, spacing: gridSpacing, pinnedViews: [], content: {
                    ForEach(0 ..< 4) { squareIndex in
                        Square(taskStore: taskStore, squareIndex: squareIndex)
                    }
                })
            }
            List(searchResults) { task in
                if task.isCompleted == showTasksCompleted || showAllTasks{
                    NavigationLink(value: task) {
                        VStack {
                            TaskRowView(task: $taskStore.tasks
                                .first(where: { $0.id == task.id })!)
                        }
                        .padding([.leading, .trailing], 20)
                    }
                }
                
            }
            .background(Color.clear)
            .searchable(text: $searchText)
            .navigationDestination(for: Task.self) { task in
                TaskDetailView(task: $taskStore.tasks
                    .first(where: { $0.id == task.id })!)
            }
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(taskStore: TaskStore(), showTasksCompleted: false, showAllTasks: true)
    }
}

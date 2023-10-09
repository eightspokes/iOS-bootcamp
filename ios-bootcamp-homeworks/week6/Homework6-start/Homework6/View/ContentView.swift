//
//  ContentView.swift
//

import SwiftUI

struct ContentView: View {
    @StateObject var taskStore = TaskStore()
    var body: some View {

        VStack {
            TabView(){
                NavigationStack {
                    TaskListView(taskStore: taskStore, showTasksCompleted:  true)
                        .navigationTitle("Completed Tasks")
                }
                
                .tabItem(){
                    Image(systemName: "checkmark.circle")
                    Text("Completed")
                }
                
                NavigationStack {
                    TaskListView(taskStore: taskStore, showTasksCompleted:  false)
                        .navigationTitle("Tasks to complete")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                
                                NewTaskButtonView(taskStore: taskStore)
                            }
                        }
                }
                .tabItem(){
                    Image(systemName: "list.bullet.circle")
                    Text("Task")
                }
                NavigationStack {
                    TaskListView(taskStore: taskStore, showAllTasks: true)
                        .navigationTitle(" All Tasks")
                }
                .tabItem(){
                    Image(systemName: "star")
                    Text("All Tasks")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

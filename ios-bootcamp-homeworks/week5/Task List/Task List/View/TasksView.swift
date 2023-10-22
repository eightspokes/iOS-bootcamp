//
//  TasksView.swift
//  Task List
//
//  Created by Roman on 9/30/23.
//

import SwiftUI

struct NewTaskButtonLabel: View {
    
    var body: some View {
        HStack {
            Image(systemName: "plus.circle.fill")
                .bold()
            .foregroundStyle(.blue)
            Text("New Task").bold()
        }
    }
}


struct MyTaskLabel: View {
   var task: Task
    var body: some View {
        HStack {
            Text(task.title)
                .bold() // Makes the title bold
            Spacer() // Pushes the title to the right
            if task.isCompleted{
                Image(systemName: "checkmark.square")
                    .foregroundColor(.green)
                    .bold()
            }else{
                Image(systemName: "square")
                    .foregroundColor(.red)
                    .bold()
            }
                
        }
    }
}



struct TasksView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    /// A flag indicating whether this view is in preview mode.
    var preview: Bool = false
    @State var showAddTask = false
    
    
    var body: some View {
        NavigationStack{
            Text("Hello")
                
            ScrollView{
                ForEach(taskViewModel.tasks){ task in
                    NavigationLink(destination: TaskDetailsView(task: task)) {
                        MyTaskLabel(task: task)
                        .padding() 
                    }
                    Divider()
                }
            }
            .sheet(isPresented: $showAddTask){
                NewTaskSheetView()
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack() {
                        Button {
                            showAddTask = true
                        } label: {
                            NewTaskButtonLabel()
                                
                                
                    }
                        Spacer()
                    }
                }
            }
            .navigationTitle("My Tasks")
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView(preview: true)
            .environmentObject(TaskViewModel(isPreview: true ))
    }
}

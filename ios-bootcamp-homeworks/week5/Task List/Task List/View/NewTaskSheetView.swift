//
//  NewTaskSheetView.swift
//  Task List
//
//  Created by Roman on 10/1/23.
//

import SwiftUI

struct NewTaskSheetView: View {
    
    @EnvironmentObject var taskViewModel: TaskViewModel
    @State private var newTaskTitle = ""
    @State private var newNote = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            HStack{
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    Spacer()
                    Text("Adding New Task")
                        .bold()
                    Spacer()
                    Button("Add") {
                        taskViewModel.addTask(title: newTaskTitle, notes: newNote)
                        newTaskTitle = ""
                        newNote = ""
                        dismiss()
                    }
                    .disabled(newTaskTitle.isEmpty)
                }
                .padding()
            }
            
            List{
                Section{
                    TextField("Title", text: $newTaskTitle)
                } header: {
                    Text("Task Title")
                }
                Section{
                    TextEditor(text: $newNote)
                        .frame(minHeight: 100)
                    
                } header: {
                    Text("Notes")
                }
            }
            Spacer()
        }
    }
}

struct NewTaskSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskSheetView()
    }
}

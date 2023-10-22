//
//  TaskRow.swift
//  

import SwiftUI


struct CheckToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            withAnimation(.easeInOut(duration: 0.3)) {
                configuration.isOn.toggle()
            }

        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .foregroundStyle(configuration.isOn ? Color.green : Color.red)
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }
        .buttonStyle(.plain)
    }
}

struct TaskRowView: View {
  @Binding var task: Task
  @State var completed = false
  var body: some View {
    HStack {
      Text(task.title)
      Spacer()
        Toggle("", isOn: $task.isCompleted)
            .toggleStyle(CheckToggleStyle())
    }
    .font(.title3)
    .bold()
    .padding([.top, .bottom], 15)
    .padding([.leading, .trailing], 10)
  }
}

struct TaskRow_Previews: PreviewProvider {
  @State static var task = Task(title: "Task", category: .noCategory, isCompleted: false)
  static var previews: some View {
   
      TaskRowView(task: $task)
  }
}

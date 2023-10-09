//
//  Square.swift
//  Homework6
//
//  Created by Roman on 10/8/23.
//

import SwiftUI
struct SquareMessage: View {
    var message: String
    @Binding var value: Int
    var body: some View {
        VStack{
            Text(message)
            Text("\(value)")
        }
        .foregroundColor(.white)
        .font(.title).bold()
    }
}


struct Square: View {
    @ObservedObject var taskStore: TaskStore
    let gridSquareColor: Color = .red
    let gridSquareSize: CGFloat = 170
    var squareIndex: Int
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                  .frame(width: gridSquareSize, height: gridSquareSize, alignment: .center)
              .foregroundColor(gridSquareColor)
            switch squareIndex{
            case 0 :
                SquareMessage(message: "Personal", value: taskStore.numberOfPersonalTasks)
            case 1 :
                SquareMessage(message: "Work", value: taskStore.numberOfWorkTasks)
            case 2 :
                SquareMessage(message: "Home", value: taskStore.numberOfHomeTasks)
            case 3:
                SquareMessage(message: "Other", value: taskStore.numberOfNoCategoryTasks)
            default:
                Text("Invalid index")
            }
        }
    }
}

struct Square_Previews: PreviewProvider {
    static var previews: some View {
        Square(taskStore: TaskStore(), squareIndex: 1)
    }
}

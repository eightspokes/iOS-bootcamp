//
//  Task_ListApp.swift
//  Task List
//
//  Created by Roman on 9/30/23.
//

import SwiftUI

@main
struct Task_ListApp: App {
    @StateObject var taskViewModel = TaskViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(taskViewModel)
        }
    }
}

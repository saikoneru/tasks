//
//  TaskCellView.swift
//  Todo
//
//  Created by Sai Koneru on 06/06/2020.
//  Copyright © 2020 Sai Koneru. All rights reserved.
//

import SwiftUI

struct TaskCell: View {
    @ObservedObject var taskVM: TaskViewModel
    @Binding var taskTitle: String
    
    var task: Task

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .onTapGesture {
                    self.taskVM.togglTaskStatus(task: self.task)
                }
            if task.title != "" {
                Text(task.title)
                    .strikethrough(task.isCompleted)
            } else {
                TextField("Enter task title", text: self.$taskTitle, onCommit: {
                    self.taskVM.updateTaskTitle(title: self.taskTitle, task: self.task)
                    self.taskTitle = ""
                })
            }
        }
    }
}

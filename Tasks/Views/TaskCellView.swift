//
//  TaskCellView.swift
//  Todo
//
//  Created by Sai Koneru on 06/06/2020.
//  Copyright © 2020 Sai Koneru. All rights reserved.
//

import SwiftUI

struct TaskCell: View {
    @EnvironmentObject var taskVM: TaskViewModel
    
    var task: Task
    var taskIndex: Int {
        taskVM.taskList.firstIndex(where: { $0.id == task.id })!
    }
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(.blue)
                .onTapGesture {
                    self.taskVM.taskList[self.taskIndex].isCompleted.toggle()
                }
                .padding(.trailing, 10)
            
            if self.task.isCompleted {
                Text(task.title)
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(task.isCompleted ? .gray : .black)
                    .strikethrough(task.isCompleted)
            } else {
                TextField("Enter task title", text: self.$taskVM.taskList[self.taskIndex].title)
            }
        }
        .padding(.vertical, 10)
    }
}

struct TaskCellView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                TaskCell(task: Task(title: "Sample Task"))
            }
            .navigationBarTitle("Today")
        }
    }
}

//
//  TaskViewModel.swift
//  Todo
//
//  Created by Sai Koneru on 06/06/2020.
//  Copyright © 2020 Sai Koneru. All rights reserved.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var taskList: [Task] = []
        
    func addTask() {
        self.taskList.append(Task(title: ""))
    }
}

#if DEBUG
var testTaskList = [
    Task(title: "Create list using SwiftUI"),
    Task(title: "Create a model for Todo", isCompleted: true)
]
#endif

//
//  ContentView.swift
//  Todo
//
//  Created by Sai Koneru on 06/06/2020.
//  Copyright © 2020 Sai Koneru. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskVM = TaskViewModel()
    @State var taskTitle: String = ""
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                List(taskVM.taskList) { task in
                    TaskCell(taskVM: self.taskVM, taskTitle: self.$taskTitle, task: task)
                }
                
                Button(action: {
                    self.taskVM.addTask()
                }) {
                    Image(systemName: "plus")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .shadow(color: Color.blue, radius: 3, x: 0, y: 0)
                }
                .padding()
            }
            .navigationBarTitle("Today")
        }
    }    
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
#endif

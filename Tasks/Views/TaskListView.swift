//
//  ContentView.swift
//  Todo
//
//  Created by Sai Koneru on 06/06/2020.
//  Copyright © 2020 Sai Koneru. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var taskVM: TaskViewModel
    @State var taskTitle: String = ""
        
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                List {
                    ForEach(taskVM.taskList.sorted(by: { !$0.isCompleted && $1.isCompleted })) { task in
                        TaskCell(task: task)
                    }
                    .onDelete(perform: self.taskVM.deleteTask)
                    .onMove(perform: self.taskVM.reOrderTask)
                }
                .padding(.top)
                
                Button(action: {
                    self.taskVM.addTask()
                }) {
                    Image(systemName: "plus")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                .padding()
            }
            .navigationBarTitle("Today")
            .navigationBarItems(trailing: EditButton())
        }
    }    
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView().environmentObject(TaskViewModel())
    }
}
#endif

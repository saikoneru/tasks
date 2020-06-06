//
//  Todo.swift
//  Todo
//
//  Created by Sai Koneru on 06/06/2020.
//  Copyright © 2020 Sai Koneru. All rights reserved.
//

import Foundation

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var isCompleted: Bool = false
}

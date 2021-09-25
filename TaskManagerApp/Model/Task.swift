//
//  Task.swift
//  TaskManagerApp
//
//  Created by Yadilsa Diaz on 9/25/21.
//

import Foundation



enum Priority: Int {
    case all
    case high
    case medium
    case low
}



struct Task {
    let title: String
    let priority: Priority
}

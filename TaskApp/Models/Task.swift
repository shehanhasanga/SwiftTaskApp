//
//  Task.swift
//  TaskApp
//
//  Created by shehan karunarathna on 2022-02-09.
//

import Foundation

struct Task : Identifiable{
    var id :String = UUID().uuidString
    var taskTitle : String
    var taskDescription : String
    var date:Date
}

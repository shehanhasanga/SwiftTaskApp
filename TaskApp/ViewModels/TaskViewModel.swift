//
//  TaskViewModel.swift
//  TaskApp
//
//  Created by shehan karunarathna on 2022-02-09.
//

import Foundation
import QuartzCore

class TaskViewModel:ObservableObject{
    @Published var storedTasks : [Task] = [
        Task(taskTitle: "Meeting", taskDescription: "Discuss tasks for the day", date: .init(timeIntervalSince1970: 1641645497)),
        Task(taskTitle: "Icon set", taskDescription: "Edit icons in the application", date: .init(timeIntervalSince1970: 1641649097)),
        Task(taskTitle: "Prototype", taskDescription: "Make and send prototype", date: .init(timeIntervalSince1970: 1641652697)),
        Task(taskTitle: "Party", taskDescription: "Go to the party with friends", date: .init(timeIntervalSince1970: 1641677097)),
        Task(taskTitle: "Client meeting", taskDescription: "Explain project to the client", date: .init(timeIntervalSince1970: 1641681497))
    
    ]
    
    init(){
        fetchCurrentWeek()
    }
    
    @Published var currentWeek :[Date] = []
    
    @Published var today = Date()
    
    func fetchCurrentWeek() {
        let today = Date()
        let calander = Calendar.current
        let week = calander.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstweekDay = week?.start else {return}
        
        (1..<7).forEach { day in
            if let weekday = calander.date(byAdding: .day, value: day, to: firstweekDay){
                currentWeek.append(weekday)
            }
        }
    }
    
    func extractDate(date:Date, format:String) -> String{
        let formater = DateFormatter()
        formater.dateFormat = format
        return formater.string(from: date)
    }
    
    func isToday(date:Date) -> Bool {
        let calander = Calendar.current
        return calander.isDate(date, inSameDayAs: today)
    }
    
}

//
//  ContentView.swift
//  BarChart
//
//  Created by Franck Dalin Mbeutcha Tchuisseu on 2024-02-03.
//

import SwiftUI
import Charts

struct SleepData: Identifiable {
    let id = UUID()
    let date: Date
    let hoursOfSleep: Double
    
    init(date: String, hoursOfSleep: Double) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        self.date = formatter.date(from: date) ?? Date.distantPast
        self.hoursOfSleep = hoursOfSleep
    }
}

struct ContentView: View {
    let sleepDataWeek: [SleepData] = [
        SleepData(date: "20240101", hoursOfSleep: 6.5),
        SleepData(date: "20240102", hoursOfSleep: 7.0),
        SleepData(date: "20240103", hoursOfSleep: 8.0),
        SleepData(date: "20240104", hoursOfSleep: 6.0),
        SleepData(date: "20240105", hoursOfSleep: 7.5),
        SleepData(date: "20240106", hoursOfSleep: 5.5),
        SleepData(date: "20240107", hoursOfSleep: 8.5)
    ]

    var body: some View {
        Chart(sleepDataWeek){
            BarMark(
                x: .value("Date", $0.date),
                y: .value("Hours of Sleep", $0.hoursOfSleep)
            )
        }
    }
}

#Preview {
    ContentView()
}

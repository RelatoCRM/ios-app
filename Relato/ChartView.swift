//
//  ChartView.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 23/10/24.
//

import Foundation
import Charts
import SwiftUI

struct ChartData: Identifiable {
    let id = UUID()
    let views: Int
    let date: Date
}

class ChartViewModel: ObservableObject {
    @Published var chartData = [ChartData]()
    
    // fake the fetching of the read records for the previous 30 days
    // in a real app, this is something would come back from an API
    func generateChartData() {
        var tempChartData = [ChartData]()
        
        for i in 1...31 {
            let newDay = ChartData(views: Int.random(in: 0...1_000), date: Calendar.current.date(byAdding: .day, value: -i, to: .now) ?? .now)
            
            tempChartData.append(newDay)
        }
        
        chartData = tempChartData
    }
    
    // Again, in a real app this is something that should come back from the API that is providing the data
    func totalNumberOfViews() -> Int {
        var totalViews = 0
        
        for eachItem in chartData {
            totalViews += eachItem.views
        }
        
        return totalViews
    }
}

struct ChartView: View {
    @StateObject var vm = ChartViewModel()
    @State private var showDateRangePicker = false
    @State var fromDate: Date = Date()
    @State var toDate: Date = Date()

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(vm.totalNumberOfViews(), format: .number)
                        .bold()
                        .font(.title3)
                    Text("Visits this month")
                }
                
                Spacer()
                
                VStack {
                    // Button to show the date range picker
                    Button(action: {
                        showDateRangePicker = true
                    }) {
                        Image(systemName: "calendar")
                            .resizable()
                            .foregroundStyle(Color("AccentColor"))  // Makes the image resizable
                            .frame(width: 25, height: 25) // Set the desired size
                    }
                    .sheet(isPresented: $showDateRangePicker) {
                        // Present the custom date range picker view
                        DateRangePickerView(fromDate: $fromDate, toDate: $toDate)
                    }

                    // Display the selected date range
                }
                .padding()
            }

            Chart(vm.chartData) { item in
                BarMark(
                    x: .value("Date", item.date),
                    y: .value("Visits", item.views)
                ).foregroundStyle(Color("AccentColor"))
            }
            .frame(height: 200)
        }
        .padding()
        .onAppear {
            vm.generateChartData()
        }
    }
}

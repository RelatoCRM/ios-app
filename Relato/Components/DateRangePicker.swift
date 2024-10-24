//
//  DateRangePicker.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 23/10/24.
//

import SwiftUI

struct DateRangePickerView: View {
    @Binding var fromDate: Date
    @Binding var toDate: Date

    var body: some View {
        VStack {
            // From Date Picker
            DatePicker("From Date", selection: $fromDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding(.horizontal).tint(Color("AccentColor"))

            
            HStack {
                Text("Selection: ")
                Text("\(fromDate, format: .dateTime.year().month(.abbreviated).day())")
                Image(systemName:"arrow.right").foregroundStyle(Color("AccentColor"))
                Text("\(toDate, format: .dateTime.year().month(.abbreviated).day())").tint(Color("AccentColor"))
            }
            
            // To Date Picker (limited to after fromDate)
            DatePicker("To Date", selection: $toDate, in: fromDate..., displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding(.horizontal).tint(Color("AccentColor"))

            // Button to close the date picker
            HStack {
                Button(action: {
                    // You can dismiss the view using a custom logic here or bind to a parent view
                }) {
                    Text("Done")
                        .padding(9)
                        .background(Color("AccentColor"))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .tint(Color("AccentColor"))
                }
            }
        }
        .padding()
    }
}

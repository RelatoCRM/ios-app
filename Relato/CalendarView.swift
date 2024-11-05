import SwiftUI

// Main Calendar View
struct CalendarView: View {
    @State private var selectedDate: Date = Date()
    @State private var currentDate: Date = Date()
    @State private var monthOffset: Int = 0
    @State private var showUpcomingEvents: Bool = true
    @State private var events: [CalendarEvent] = [
        CalendarEvent(date: Date(), title: "Meeting with team", created_by: "Manu Ríos"),
        CalendarEvent(date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, title: "Doctor's appointment", created_by: "Bea Gómez"),
        CalendarEvent(date: Calendar.current.date(byAdding: .day, value: 3, to: Date())!, title: "Lunch with friends", created_by: "Begoña Gómez")
    ]
    @State private var showNewEventSheet: Bool = false
    @State private var showDayDetail: Bool = false // To show DayDetailView

    private let calendar = Calendar.current
    
    var body: some View {
        NavigationView {
            VStack {
                // Calendar header and controls here
                HStack {
                    Button(action: { monthOffset -= 1 }) { /* Month navigation button */ }
                    Spacer()
                    Text(monthAndYearString()).font(.title2).fontWeight(.bold)
                    Spacer()
                    Button(action: { monthOffset += 1 }) { /* Month navigation button */ }
                }.padding()

                // Weekday headers and Days grid here
                HStack { /* Weekday symbols */ }
                let days = generateDaysInMonth()
                LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 7), spacing: 10) {
                    ForEach(days, id: \.self) { day in
                        DayCell(date: day.date, isToday: day.isToday, isSelected: day.isSelected) {
                            selectedDate = day.date!
                            showDayDetail = true // Trigger the detail view for selected day
                        }
                    }
                }.padding()

                // Upcoming or selected day events toggle and list
                HStack { /* Toggle button views here */ }
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) { /* Events list for selected view */ }
                }.padding()
            }
            .background(Color("BackgroundColor"))
            .sheet(isPresented: $showNewEventSheet) {
                NewCommunicationView() // Sheet for new event
            }
            .background(
                // Floating button to add new event
                Button(action: { showNewEventSheet = true }) {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .background(Color("AccentColor"))
                        .clipShape(Circle())
                        .padding()
                },
                alignment: .bottomTrailing
            )
            .navigationDestination(isPresented: $showDayDetail) {
                DayDetailView(date: selectedDate, events: eventsForSelectedDate())
            }
        }
    }

    // Helper functions for calendar setup
    private func monthAndYearString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: calendar.date(byAdding: .month, value: monthOffset, to: currentDate)!)
    }

    // Generates all dates for the current displayed month
    private func generateDaysInMonth() -> [Day] {
        let date = calendar.date(byAdding: .month, value: monthOffset, to: currentDate)!
        
        // Get the range of days and the first weekday
        let range = calendar.range(of: .day, in: .month, for: date)!
        let firstWeekday = calendar.component(.weekday, from: calendar.date(from: calendar.dateComponents([.year, .month], from: date))!)
        
        // Generate Day objects to represent each day in the grid
        var days = (1..<firstWeekday).map { _ in Day.empty }
        days += range.map { day -> Day in
            let dayDate = calendar.date(byAdding: .day, value: day - 1, to: calendar.date(from: calendar.dateComponents([.year, .month], from: date))!)!
            return Day(date: dayDate,
                       isToday: calendar.isDateInToday(dayDate),
                       isSelected: calendar.isDate(dayDate, inSameDayAs: selectedDate))
        }
        return days
    }

    
    // Filters events based on selected view
    private func eventsForSelectedDate() -> [CalendarEvent] {
        events.filter { calendar.isDate($0.date, inSameDayAs: selectedDate) }
    }
}


// MARK: - Day Cell Component

struct DayCell: View {
    let date: Date?
    let isToday: Bool
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Group {
            if let date = date {
                Button(action: action) {
                    Text("\(Calendar.current.component(.day, from: date))")
                        .fontWeight(isToday ? .bold : .regular)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(8)
                        .background(isSelected ? Color("AccentColor").opacity(0.2) : Color.clear)
                        .clipShape(Circle())
                        .foregroundColor(isToday ? .red : .primary)
                }
            } else {
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

// MARK: - Supporting Models

struct Day: Identifiable, Hashable {
    var id = UUID()
    var date: Date?
    var isToday: Bool
    var isSelected: Bool
    
    static let empty = Day(date: nil, isToday: false, isSelected: false)
}

#Preview {
    CalendarView()
}

// MARK: - Day Detail View for selected date

struct DayDetailView: View {
    let date: Date
    let events: [CalendarEvent]
    
    private let calendar = Calendar.current
    private let hours = Array(0...23) // For time slots
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Events for \(date, formatter: dayFormatter)")
                .font(.headline)
                .padding(.vertical)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(hours, id: \.self) { hour in
                        HStack(alignment: .top) {
                            Text("\(hour):00")
                                .font(.subheadline)
                                .frame(width: 50, alignment: .leading)
                                .foregroundColor(.gray)
                            
                            VStack(alignment: .leading) {
                                ForEach(eventsForHour(hour: hour)) { event in
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(event.title)
                                            .font(.subheadline)
                                        Text(event.created_by)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    .padding(5)
                                    .background(Color("AccentColor").opacity(0.1))
                                    .cornerRadius(8)
                                }
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(Text("Day View"))
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Filter events for each hour slot
    private func eventsForHour(hour: Int) -> [CalendarEvent] {
        events.filter {
            calendar.component(.hour, from: $0.date) == hour
        }
    }
    
    // Formatter for day title
    private var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }
}

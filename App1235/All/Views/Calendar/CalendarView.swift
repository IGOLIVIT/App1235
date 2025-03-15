//
//  CalendarView.swift
//  App1235
//
//  Created by IGOR on 14/03/2025.
//

import SwiftUI

struct CalendarView: View {
    
    @StateObject var viewModel = CalendarViewModel()
    
    @State private var currentDate = Date()  // Текущий месяц
    private let calendar = Calendar.current
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy" // "Март 2025"
        return formatter
    }()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Calendar")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    // Название месяца и кнопки переключения
                    HStack {
                        Button(action: previousMonth) {
                            Image(systemName: "chevron.left")
                                .padding()
                        }
                        
                        Spacer()
                        
                        Text(formatter.string(from: currentDate))
                            .font(.system(size: 16, weight: .semibold))
                            .bold()
                        
                        Spacer()
                        
                        Button(action: nextMonth) {
                            Image(systemName: "chevron.right")
                                .padding()
                        }
                    }
                    .padding(.horizontal)
                    
                    // Дни недели
                    let weekDays = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
                    HStack {
                        ForEach(weekDays, id: \.self) { day in
                            Text(day)
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .font(.headline)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Сетка с днями
                    let days = getDaysInMonth()
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                        ForEach(days, id: \.self) { day in
                            if let day = day {
                                Text("\(day)")
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(width: 30, height: 30)
                                    .background(Color.red.opacity(0.2))
                                    .clipShape(Circle())
                            } else {
                                Text("")
                            }
                        }
                    }
                    .padding()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                .padding(.bottom)
                    
                    if viewModel.events.isEmpty {
                        
                        Text("Add a finance-related event to your calendar")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .regular))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                                                
                    } else {
                                                    
                            LazyVStack {
                                
                                ForEach(viewModel.events, id: \.self) { index in
                                
                                    VStack {
                                        
                                        Text(index.evName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .medium))
                                            .frame(maxWidth: .infinity)
                                            .padding(7)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                                        
                                        Text(index.evDescr ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(9)
                                            .padding(.horizontal)
                                        
                                        Text(index.evTop ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .medium))
                                            .frame(maxWidth: .infinity)
                                            .padding(7)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                                    }
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                                }
                            }
                        }
                    }
            }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("bg2"))
                .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Text("+")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color("prim")))
                })
                .padding()
            }
        }
        .onAppear {
            
            viewModel.fetchEvents()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            NewEvent(viewModel: viewModel)
        })
    }
    
    // Получаем количество дней в месяце и сдвиг
    private func getDaysInMonth() -> [Int?] {
        let range = calendar.range(of: .day, in: .month, for: currentDate)!
        let firstWeekday = calendar.component(.weekday, from: calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate))!) - 1
        let shift = (firstWeekday == 0 ? 6 : firstWeekday - 1) // Сдвиг, чтобы неделя начиналась с понедельника
        return Array(repeating: nil, count: shift) + Array(range)
    }
    
    // Переключение месяца назад
    private func previousMonth() {
        currentDate = calendar.date(byAdding: .month, value: -1, to: currentDate)!
    }
    
    // Переключение месяца вперед
    private func nextMonth() {
        currentDate = calendar.date(byAdding: .month, value: 1, to: currentDate)!
    }
}

#Preview {
    CalendarView()
}

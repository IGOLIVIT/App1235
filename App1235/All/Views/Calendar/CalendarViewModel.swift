//
//  CalendarViewModel.swift
//  App1235
//
//  Created by IGOR on 14/03/2025.
//

import SwiftUI
import CoreData

final class CalendarViewModel: ObservableObject {
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isSettings: Bool = false

    @Published var evName: String = ""
    @Published var evTop: String = ""
    @Published var evDescr: String = ""
    @Published var evDate: String = ""

    @Published var events: [EventModel] = []
    @Published var selectedEvent: EventModel?

    func addEvent() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "EventModel", into: context) as! EventModel

        loan.evName = evName
        loan.evTop = evTop
        loan.evDescr = evDescr
        loan.evDate = evDate

        CoreDataStack.shared.saveContext()
    }

    func fetchEvents() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<EventModel>(entityName: "EventModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.events = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.events = []
        }
    }
}

//
//  JournalViewModel.swift
//  App1235
//
//  Created by IGOR on 14/03/2025.
//

import SwiftUI
import CoreData

final class JournalViewModel: ObservableObject {

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isSettings: Bool = false

    @Published var deCur: String = ""
    @Published var deTime: String = ""
    @Published var deDir: String = ""
    @Published var deSum: String = ""
    @Published var deDescr: String = ""
    @Published var deTot: String = ""

    @Published var deals: [DealModel] = []
    @Published var selectedDeal: DealModel?

    func addDeal() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "DealModel", into: context) as! DealModel

        loan.deCur = deCur
        loan.deTime = deTime
        loan.deDir = deDir
        loan.deSum = deSum
        loan.deDescr = deDescr
        loan.deTot = deTot

        CoreDataStack.shared.saveContext()
    }

    func fetchDeals() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<DealModel>(entityName: "DealModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.deals = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.deals = []
        }
    }
}

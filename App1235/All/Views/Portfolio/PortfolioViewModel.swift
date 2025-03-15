//
//  PortfolioViewModel.swift
//  App1235
//
//  Created by IGOR on 14/03/2025.
//

import SwiftUI

final class PortfolioViewModel: ObservableObject {
    
    @Published var isDetail: Bool = false

    @Published var ran: String = String(format: "%.f", Double(.random(in: 1...2)))
    @Published var ran2: String = String(format: "%.f", Double(.random(in: 1...3)))

    @Published var periods: [String] = ["12H", "1D", "1W", "1M", "1Y"]
    @Published var current_per: String = "12H"
    
    @Published var cryptos: [String] = ["Ethereum", "Cardano", "TRON"]
    @Published var current_crypto: String = ""
    
    @Published var valuts: [String] = ["EURUSD", "USDJPY", "AUDUSD", "USDCAD", "EURJPY", "EURAUD", "EURCHF", "EURNZD"]
    @Published var selected_valut = "EURUSD"
    
    @AppStorage("money") var money: Int = 10000
    
    @AppStorage("progress") var progress: Int = 0
    @AppStorage("level") var level: Int = 1


    @Published var time: Int = 30
    @Published var time_list: [Int] = [30, 60, 120, 160]
    
    @Published var timer_sys = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var isRunned: Bool = false
    
    @Published var current_amount: String = "50"
    @Published var amount_list: [String] = ["50", "100", "1000", "5000"]
    
    @Published var resultText: String = ""
        
    public func timer_sys_start() {
        
        if !current_amount.isEmpty && money > 0 && time > 0 {
            
            isRunned = true
            
            resultText = ""
            
        } else {
            
            withAnimation(.spring()) {
                
                resultText = "Not enough money"
            }
        }
    }
    
    public func timer_sys_stop() {
        
        let randomInt = Int.random(in: 1...2)
        
        if randomInt == 1 {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                withAnimation(.spring()) {
                    
                    self.resultText = "+$\(self.current_amount)"
                    self.money += Int(self.current_amount) ?? 0
                    self.progress += 10
                    
                    if self.progress > 300 {
                        
                        self.level += 1
                    }
                }
            }
        }
        
        if randomInt == 2 {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                withAnimation(.spring()) {
                    
                    self.resultText = "-$\(self.current_amount)"
                    self.money -= Int(self.current_amount) ?? 0
                    self.progress += 10
                    
                    if self.progress > 300 {
                        
                        self.level += 1
                    }
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
            withAnimation(.spring()) {
                
                self.resultText = ""
            }
        }
        
        timer_sys.upstream.connect().cancel()
            
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            withAnimation(.spring()) {
                
                self.isRunned = false
                self.time = 30
            }
        }
    }
}


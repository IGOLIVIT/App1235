//
//  ContentView.swift
//  App1235
//
//  Created by IGOR on 11/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Journal

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()

                    if status {
                        
                        VStack(spacing: 0, content: {
                        
                                TabView(selection: $current_tab, content: {

                                    JournalView()
                                        .tag(Tab.Journal)
                                    
                                    PortfolioView()
                                        .tag(Tab.Portfolio)

                                    CalendarView()
                                        .tag(Tab.Calendar)
                                    
                                    SettingsView()
                                        .tag(Tab.Settings)
                                    
                                })
                                
                                TabBar(selectedTab: $current_tab)
                            })
                        .ignoresSafeArea(.all, edges: .bottom)

                    } else {
                        
                        OB1()
                    }
        }
    }
}

#Preview {
    ContentView()
}

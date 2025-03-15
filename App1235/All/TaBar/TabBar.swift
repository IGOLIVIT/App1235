//
//  TabBar.swift
//  App1235
//
//  Created by IGOR on 15/03/2025.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 6, content: {
                        
                        Rectangle()
                            .fill(.gray.opacity(0.13))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("prim") : Color.white)
                            .frame(width: 15, height: 15)

                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("prim") : Color.white)
                            .font(.system(size: 11, weight: .regular))

                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 24)
        .padding(.bottom, 38)
        .background(RoundedRectangle(cornerRadius: 0).fill(Color.black))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Journal = "Journal"
    
    case Portfolio = "Portfolio"
    
    case Calendar = "Calendar"
    
    case Settings = "Settings"

}

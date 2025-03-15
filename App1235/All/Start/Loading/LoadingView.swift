//
//  LoadingView.swift
//  App1235
//
//  Created by IGOR on 13/03/2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 120)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    LoadingView()
}

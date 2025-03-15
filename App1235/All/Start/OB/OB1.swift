//
//  OB1.swift
//  App1235
//
//  Created by IGOR on 13/03/2025.
//

import SwiftUI

struct OB1: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            LinearGradient(colors: [.black, .white.opacity(0.3), .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                
                Image("s1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(40)
                    .padding(.top, 90)
                
                Text("Practice in a trading simulator")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .semibold))
                    .multilineTextAlignment(.center)
                
                Text("A place where you can practice before real trading")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .medium))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 60)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    OB2()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 12).fill(.red))
                })
                .padding()
            }
        }
    }
}

#Preview {
    OB1()
}

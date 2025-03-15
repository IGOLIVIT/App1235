//
//  OB2.swift
//  App1235
//
//  Created by IGOR on 13/03/2025.
//

import SwiftUI

struct OB2: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            LinearGradient(colors: [.black, .white.opacity(0.3), .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                
                Image("s2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(40)
                    .padding(.top, 30)
                
                Text("Start your workout with our app")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .semibold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    RegView()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Get started")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 12).fill(.red))
                })
                .padding(.horizontal)
                
                NavigationLink(destination: {
                    
                    SignView()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Sign in")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 12).stroke(.white))
                })
                .padding()
            }
        }
    }
}

#Preview {
    OB2()
}

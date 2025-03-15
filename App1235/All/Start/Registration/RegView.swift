//
//  RegView.swift
//  App1235
//
//  Created by IGOR on 13/03/2025.
//

import SwiftUI

struct RegView: View {
    
    @StateObject var viewModel = RegViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            LinearGradient(colors: [.black, .white.opacity(0.3), .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                
                Text("Registration")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 50)
                
                Text("Create an account to communicate in the community")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 40)

                HStack {
                    
                    Text("login")
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.trailing)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter your login")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                            .opacity(viewModel.addLogin.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addLogin)
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                        
                    })
                }
                .padding(13)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                
                HStack {
                    
                    Text("Password")
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.trailing)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter your password")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                            .opacity(viewModel.addPassword.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addPassword)
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                        
                    })
                }
                .padding(13)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                
                HStack {
                    
                    Text("Password")
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.trailing)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter your password")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                            .opacity(viewModel.addPassword2.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addPassword2)
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                        
                    })
                }
                .padding(13)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.login = viewModel.addLogin
                    viewModel.password = viewModel.addPassword
                    viewModel.addLogin = ""
                    viewModel.addPassword = ""
                    
                    viewModel.status = true
                    
                }, label: {
                    
                    Text("next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 12).stroke(.white))
                })
            }
            .padding()
        }
    }
}

#Preview {
    RegView()
}

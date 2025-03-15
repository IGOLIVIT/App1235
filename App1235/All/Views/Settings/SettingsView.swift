//
//  SettingsView.swift
//  App1235
//
//  Created by IGOR on 15/03/2025.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
 
    @StateObject var viewModel = RegViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 14) {
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/b0d91674-81a6-4543-9c56-e2fda2640c98") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "doc.text.fill")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 17, weight: .regular))
                                
                                Text("Usage Policy")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        })
                        .padding(.top)
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 17, weight: .regular))
                                
                                Text("Rate us")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        })
                        
                        HStack {

                            Text("login")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing, 20)
                            
                            Text(viewModel.login)
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                            
                            Spacer()

                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                        HStack {

                            Text("Password")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing, 20)
                            
                            Text(viewModel.password)
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                            
                            Spacer()

                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        .padding(.bottom, 100)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = true
                            }
                            
                        }, label: {

                                Image(systemName: "trash")
                                .foregroundColor(.white)
                                    .font(.system(size: 17, weight: .regular))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("bg2"))
                .ignoresSafeArea()
            }
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack(spacing: 15) {

                    Text("Are you sure you want to delete account and all data?")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                    
                    Text("This action can not be undone")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))

                    Rectangle()
                        .fill(Color("bg"))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.vertical, 7)
                    
                    HStack {
                        
                        Button(action: {

                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.blue)
                                .font(.system(size: 17, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteAllData()
                            
                            viewModel.password = ""
                            viewModel.login = ""
                            
                            viewModel.status = false

                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 17, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                    }
                    .padding(.top, 25)

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SettingsView()
}

//
//  JournalView.swift
//  App1235
//
//  Created by IGOR on 14/03/2025.
//

import SwiftUI

struct JournalView: View {
    
    @StateObject var viewModel = JournalViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Deal Journal 📝")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                if viewModel.deals.isEmpty {
                    
                    VStack {
                        
                        Text("Traders need a trade journal to analyze their trading, identify errors and improve their strategy. It helps you trade consciously, not chaotically.")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .regular))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                        
                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("bg2"))
                    .ignoresSafeArea()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.deals, id: \.self) { index in
                                
                                VStack(spacing: 10) {
                                    
                                    HStack {
                                        
                                        Text(index.deCur ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .semibold))
                                            .padding(8)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim2")))
                                            .padding(.trailing, 40)
                                        
                                        Text(index.deDir ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .semibold))
                                            .padding(8)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim2")))

                                        Spacer()
                                    }
                                    
                                    HStack {
                                        
                                        Text(index.deTime ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .semibold))
                                            .padding(8)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim2")))
                                            .padding(.trailing, 40)
                                        
                                        Text(index.deDescr ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 17, weight: .semibold))
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        
                                        Text(index.deCur ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .semibold))
                                            .padding(8)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim2")))
                                            .padding(.trailing, 40)
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedDeal = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDelete = true
                                            }
                                            
                                        }, label: {
                                            
                                            Image(systemName: "trash")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14, weight: .semibold))
                                                .padding(8)
                                                .padding(.horizontal)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim2")))
                                            
                                        })
                                    }
                                }
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("bg2"))
                    .ignoresSafeArea()
                }
            }
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Text("+")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color("prim")))
                })
                .padding()
            }
        }
        .onAppear {
            
            viewModel.fetchDeals()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddDeal(viewModel: viewModel)
        })
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

                    Text("Are you sure you want to delete?")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding(.vertical)

                    Rectangle()
                        .fill(Color.gray)
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
                            
                            CoreDataStack.shared.deleteDeal(withDeDir: viewModel.selectedDeal?.deDir ?? "", completion: {
                                
                                viewModel.fetchDeals()
                            })

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
    JournalView()
}

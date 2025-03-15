//
//  AddDeal.swift
//  App1235
//
//  Created by IGOR on 14/03/2025.
//

import SwiftUI

struct AddDeal: View {
    
    @StateObject var viewModel: JournalViewModel
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("Back")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .regular))
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.addDeal()
                        
                        viewModel.deCur = ""
                        viewModel.deTime = ""
                        viewModel.deDir = ""
                        viewModel.deSum = ""
                        viewModel.deDescr = ""
                        viewModel.deTot = ""
                        
                        viewModel.fetchDeals()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {

                        Text("Done")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .regular))
                    })
                    .opacity(viewModel.deCur.isEmpty || viewModel.deTime.isEmpty || viewModel.deDir.isEmpty || viewModel.deSum.isEmpty || viewModel.deDescr.isEmpty || viewModel.deTot.isEmpty ? 0.6 : 1)
                    .disabled(viewModel.deCur.isEmpty || viewModel.deTime.isEmpty || viewModel.deDir.isEmpty || viewModel.deSum.isEmpty || viewModel.deDescr.isEmpty || viewModel.deTot.isEmpty ? true : false)
                }
                .padding(.horizontal)
                .padding(.top)
                
                Text("Deal Journal 📝")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack {

                    VStack(spacing: 16) {
                        
                        HStack {
                            
                            Text("Currency")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Currency pair")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.deCur.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.deCur)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Entry time")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Your entry time")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.deTime.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.deTime)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Direction")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter direction")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.deDir.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.deDir)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Sum")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter Sum")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.deSum.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.deSum)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Description")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Brief description")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.deDescr.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.deDescr)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("total")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Profit/Loss")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.deTot.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.deTot)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("bg2"))
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    AddDeal(viewModel: JournalViewModel())
}

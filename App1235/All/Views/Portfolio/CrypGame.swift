//
//  CrypGame.swift
//  App1235
//
//  Created by IGOR on 14/03/2025.
//

import SwiftUI

struct CrypGame: View {
    
    @StateObject var viewModel: PortfolioViewModel

    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDetail = false
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

                }
                .padding(.horizontal)
                .padding(.top)
                
                Text(viewModel.current_crypto)
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        HStack {
                            
                            Image(viewModel.current_crypto)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50)
                            
                            VStack {
                                
                                Text("$\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))")
                                    .foregroundColor(.white)
                                    .font(.system(size: 28, weight: .semibold))
                                
                                Text("-\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))%")
                                    .foregroundColor(.red)
                                    .font(.system(size: 13, weight: .medium))
                            }
                        }
                        
                        if viewModel.ran2 == "1" {
                            
                            Image("gam1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        } else if viewModel.ran2 == "2" {
                            
                            Image("gam2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        } else {
                            
                            Image("gam3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        
                        Text("\(viewModel.time) sec.")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .padding(.top, 10)
                        
                        HStack {

                            Button(action: {
                                
                                if viewModel.time < 0 && viewModel.money < Int(viewModel.current_amount) ?? 0 && viewModel.current_amount.isEmpty {
                                    
                                    viewModel.resultText = "Not enough money"
                                    
                                } else {
                                    
                                    viewModel.timer_sys_start()
                                }
                                
                            }, label: {

                                    Text("SELL")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                        .frame(maxWidth: .infinity)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.red))
                            })
                                                        
                            Button(action: {
                                
                                if viewModel.time < 0 && viewModel.money < Int(viewModel.current_amount) ?? 0 && viewModel.current_amount.isEmpty {
                                    
                                    viewModel.resultText = "Not enough money"
                                    
                                } else {
                                    
                                    viewModel.timer_sys_start()
                                }
                                
                            }, label: {

                                    Text("BUY")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                            })
                        }
                        .opacity(viewModel.isRunned ? 0.5 : 1)
                        .padding(.top, 10)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("bg2"))
                .ignoresSafeArea()
            }
        }
        .onReceive(viewModel.timer_sys, perform: { _ in
            
            if viewModel.isRunned {
                
                if viewModel.time > 0 {
                    
                    viewModel.time -= 1
                    
                } else {
                    
                    viewModel.timer_sys_stop()
                }
            }
        })
        .disabled(viewModel.isRunned ? true : false)
        .overlay (
        
            ZStack {
                
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("\(viewModel.resultText)")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                }
            }
                .opacity(viewModel.resultText.isEmpty ? 0 : 1)
        )
    }
}

#Preview {
    CrypGame(viewModel: PortfolioViewModel())
}

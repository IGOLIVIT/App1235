//
//  PortfolioView.swift
//  App1235
//
//  Created by IGOR on 14/03/2025.
//

import SwiftUI

struct PortfolioView: View {
    
    @StateObject var viewModel = PortfolioViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Portfolio")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack {
                    
                    HStack {
                        
                        Image("gd")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text("Today Gains")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("$\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                        }
                        
                        Spacer()
                        
                        Rectangle()
                            .fill(.gray.opacity(0.1))
                            .frame(width: 1, height: 50)
                        
                        Spacer()
                        
                        Image("gu")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text("Overall Loss")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("$\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 18).fill(.white))
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack {
                            
                            VStack(alignment: .leading, spacing: 7) {
                                
                                Text("Portfolio Balance")
                                    .foregroundColor(.white)
                                    .font(.system(size: 12, weight: .medium))
                                
                                HStack {
                                    
                                    Text("$\(String(format: "%.f", Double(.random(in: 1...4))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 26, weight: .medium))
                                        .padding(.trailing, 20)
                                 
                                    HStack {
                                        
                                        Image("cu")
                                        
                                        Text("\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))%")
                                            .foregroundColor(.black)
                                            .font(.system(size: 12, weight: .medium))
                                    }
                                    .padding(4)
                                    .padding(.horizontal, 9)
                                    .background(RoundedRectangle(cornerRadius: 19).fill(.white))
                                }
                                
                                HStack {
                                    
                                    Text("$\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .medium))
                                    
                                    Text("(Today)")
                                        .foregroundColor(.white.opacity(0.5))
                                        .font(.system(size: 14, weight: .medium))
                                }
                            }
                            .padding(24)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 30).fill(Color("red").opacity(0.7)))
                            .padding(.bottom)
                            
                                Image(viewModel.current_per)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            
                            HStack {
                                
                                ForEach(viewModel.periods, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.current_per = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                            .foregroundColor(viewModel.current_per == index ? .white : .blue)
                                            .font(.system(size: 14, weight: .regular))
                                            .padding(4)
                                            .padding(.horizontal, 6)
                                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim").opacity(viewModel.current_per == index ? 1 : 0)))
                                            .frame(maxWidth: .infinity)
                                    })
                                }
                            }
                            .padding(.bottom)
                            
                            HStack {
                                
                                Text("Top stocks")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, weight: .semibold))
                                
                                Spacer()
                            }
                            
                            ForEach(viewModel.cryptos, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.current_crypto = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Image(index)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 40)
                                        
                                        VStack {
                                            
                                            Text(index)
                                        }
                                        
                                        Spacer()
                                        
                                        if viewModel.ran == "1" {
                                            
                                            Image("g1")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 40)
                                            
                                        } else {
                                            
                                            Image("g2")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 40)
                                        }
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .trailing) {
                                            
                                            Text("$\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))")
                                                .foregroundColor(.black)
                                                .font(.system(size: 17, weight: .medium))
                                            
                                            if viewModel.ran == "1" {
                                                
                                                Text("-\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))%")
                                                    .foregroundColor(.red)
                                                    .font(.system(size: 12, weight: .medium))
                                                
                                            } else {
                                                
                                                Text("+\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))%")
                                                    .foregroundColor(.green)
                                                    .font(.system(size: 12, weight: .medium))
                                            }
                                        }
                                    }
                                })
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 18).fill(.white))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("bg2"))
                
            }
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            CrypGame(viewModel: viewModel)
        })
            }
}

#Preview {
    PortfolioView()
}

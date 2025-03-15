//
//  NewEvent.swift
//  App1235
//
//  Created by IGOR on 14/03/2025.
//

import SwiftUI

struct NewEvent: View {

    @StateObject var viewModel: CalendarViewModel
    
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
                        
                        viewModel.addEvent()
                        
                        viewModel.evName = ""
                        viewModel.evTop = ""
                        viewModel.evDescr = ""
                        viewModel.evDate = ""
                        
                        viewModel.fetchEvents()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {

                        Text("Done")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .regular))
                    })
                    .opacity(viewModel.evName.isEmpty || viewModel.evDescr.isEmpty || viewModel.evTop.isEmpty || viewModel.evDate.isEmpty ? 0.6 : 1)
                    .disabled(viewModel.evName.isEmpty || viewModel.evDescr.isEmpty || viewModel.evTop.isEmpty || viewModel.evDate.isEmpty ? true : false)
                }
                .padding(.horizontal)
                .padding(.top)
                
                Text("Events")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack {

                    VStack(spacing: 16) {
                        
                        HStack {
                            
                            Text("Name")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Event name")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.evName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.evName)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("topic")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("theme of the event")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.evTop.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.evTop)
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
                                
                                Text("Event description")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.evDescr.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.evDescr)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Date")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Event date")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.evDate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.evDate)
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
    NewEvent(viewModel: CalendarViewModel())
}

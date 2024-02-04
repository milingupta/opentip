//
//  ControlView.swift
//  OpenTip
//
//  Created by Milin Gupta on 2/1/24.
//

import SwiftUI

struct ControlView: View {
    
    @ObservedObject var viewModel: TipViewModel
    
    var body: some View {
        Section("Controls") {
            HStack {
                Image(systemName: "dollarsign")
                    .foregroundStyle(.blue)
                
                TextField("Enter Bill Amount", text: $viewModel.textInputBillAmount)
                    .fixedSize(horizontal: false, vertical: true)
                    .onChange(of: viewModel.textInputBillAmount) {
                        viewModel.calculateTip()
                    }
                    .keyboardType(.decimalPad)
            }
            
            HStack {
                Image(systemName: "building.columns")
                    .foregroundStyle(.blue)
                
                TextField("Enter Tax Amount", text: $viewModel.textInputTaxAmount)
                    .fixedSize(horizontal: false, vertical: true)
                    .onChange(of: viewModel.textInputTaxAmount) {
                        viewModel.calculateTip()
                    }
                    .keyboardType(.decimalPad)
            }
            
            
            if viewModel.isShowingTipPercentTextField {
                HStack {
                    Image(systemName: "percent")
                        .foregroundStyle(.blue)
                    
                    TextField("Enter Tip Percentage", text: $viewModel.textInputTipPercent)
                        .onChange(of: viewModel.textInputTipPercent) {
                            if viewModel.tipPercent > 100 {
                                viewModel.tipPercent = 100
                            }
                            
                            viewModel.calculateTip()
                        }
                        .keyboardType(.numberPad)
                }
            } else {
                HStack {
                    Image(systemName: "percent")
                        .foregroundStyle(.blue)
                    
                    HStack {
                        Text("Tip Percent")
                        
                        Spacer()
                        
                        Text("\(viewModel.tipPercent)")
                            .padding(.horizontal)
                        
                        Stepper("") {
                            viewModel.incrementTip()
                        } onDecrement: {
                            viewModel.decrementTip()
                        } onEditingChanged: { _ in
                            viewModel.calculateTip()
                        }
                        .labelsHidden()
                    }
                }
            }
            
            HStack {
                Image(systemName: "person")
                    .foregroundStyle(.blue)
                
                HStack {
                    Text("People")
                    
                    Spacer()
                    
                    Text("\(viewModel.numberPeople)")
                        .padding(.horizontal)
                    
                    Stepper("") {
                        viewModel.incrementPeople()
                    } onDecrement: {
                        viewModel.decrementPeople()
                    } onEditingChanged: { _ in
                        viewModel.calculateTip()
                    }
                    .labelsHidden()
                }
            }
            
            HStack {
                Image(systemName: "arrow.up")
                    .foregroundStyle(.blue)
                
                HStack {
                    Text("Round Up Tip")
                    
                    Spacer()
                    
                    Text(viewModel.isRoundingUp ? "On" : "Off")
                        .padding(.horizontal)
                    
                    Toggle("", isOn: $viewModel.isRoundingUp)
                        .labelsHidden()
                        .onChange(of: viewModel.isRoundingUp) {
                            viewModel.calculateTip()
                        }
                }
            }
            
            HStack {
                Image(systemName: "keyboard")
                    .foregroundStyle(.blue)
                
                HStack {
                    Text("Manual Tip Entry")
                    
                    Spacer()
                    
                    Text(viewModel.isShowingTipPercentTextField ? "On" : "Off")
                        .padding(.horizontal)
                    
                    Toggle("", isOn: $viewModel.isShowingTipPercentTextField)
                        .labelsHidden()
                }
            }
        }
    }
}

#Preview {
    ControlView(viewModel: TipViewModel())
}

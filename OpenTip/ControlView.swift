//
//  ControlView.swift
//  OpenTip
//
//  Created by Milin Gupta on 2/1/24.
//

import SwiftUI

struct ControlView: View {
    
    @ObservedObject var viewModel: TipViewModel
    @Binding var isShowingTipPercentTextField: Bool
    
    var body: some View {
        Section("Controls") {
            HStack {
                Image(systemName: "dollarsign")
                TextField("Enter Bill Amount", text: $viewModel.textInputBillAmount)
                    .fixedSize(horizontal: false, vertical: true)
                    .onChange(of: viewModel.textInputBillAmount) {
                        viewModel.calculateTip()
                    }
                    .keyboardType(.decimalPad)
            }
            
            HStack {
                Image(systemName: isShowingTipPercentTextField ? "chevron.down.circle" : "chevron.forward.circle")
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isShowingTipPercentTextField.toggle()
                        }
                    }
                    .foregroundStyle(.blue)
                
                HStack {
                    Text("Tip %")
                    
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
            
            if isShowingTipPercentTextField {
                HStack {
                    Image(systemName: "keyboard")
                        .foregroundStyle(.placeholder)
                    
                    TextField("Enter Tip %", text: $viewModel.textInputTipPercent)
                        .onChange(of: viewModel.textInputTipPercent) {
                            if viewModel.tipPercent > 100 {
                                viewModel.tipPercent = 100
                            }
                            
                            viewModel.calculateTip()
                        }
                        .keyboardType(.numberPad)
                }
            }
            
            HStack {
                Image(systemName: "person")
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
                HStack {
                    Text("Round Up Tip")
                    
                    Spacer()
                    
                    Text(viewModel.isRoundingUp ? "On" : "Off")
                        .padding(.horizontal)
                        .foregroundStyle(viewModel.isRoundingUp ? .blue : Color(UIColor.label))
                    
                    Toggle("", isOn: $viewModel.isRoundingUp)
                        .labelsHidden()
                        .tint(.blue)
                        .onChange(of: viewModel.isRoundingUp) {
                            viewModel.calculateTip()
                        }
                }
            }
        }
    }
}

#Preview {
    ControlView(viewModel: TipViewModel(), isShowingTipPercentTextField: .constant(false))
}

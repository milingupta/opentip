//
//  ContentView.swift
//  OpenTip
//
//  Created by Milin Gupta on 1/31/24.
//

import SwiftUI

struct ContentView: View {
        
    @StateObject var viewModel = TipViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                ControlView(viewModel: viewModel)
                ResultView(viewModel: viewModel)
            }
            .navigationTitle(
                (viewModel.displayedAmountOption == 1) ? "$\(String(format: "%.2f", viewModel.tipAmount))"
                : (viewModel.displayedAmountOption == 2) ? "$\(String(format: "%.2f", viewModel.totalAmount))"
                : (viewModel.displayedAmountOption == 3) ? "$\(String(format: "%.2f", viewModel.subtotalAmount))"
                : "")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Text("Displayed Amount")
                        Button {
                            viewModel.displayedAmountOption = 1
                        } label: {
                            Label("Tip Amount", systemImage: viewModel.displayedAmountOption == 1 ? "checkmark" : "")
                        }
                        
                        Button {
                            viewModel.displayedAmountOption = 2
                        } label: {
                            Label("Total Amount", systemImage: viewModel.displayedAmountOption == 2 ? "checkmark" : "")
                        }
                        
                        Button {
                            viewModel.displayedAmountOption = 3
                        } label: {
                            Label("Subtotal Amount", systemImage: viewModel.displayedAmountOption == 3 ? "checkmark" : "")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
        }
    }
    
}

#Preview {
    ContentView()
}

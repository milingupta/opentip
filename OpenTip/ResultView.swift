//
//  ResultView.swift
//  OpenTip
//
//  Created by Milin Gupta on 2/1/24.
//

import SwiftUI

struct ResultView: View {
    
    @ObservedObject var viewModel: TipViewModel
    
    var body: some View {
        Section("Results") {
            HStack {
                Text("Tip Amount")
                Spacer()
                Text("$\(String(format: "%.2f", viewModel.tipAmount))")
                    .bold()
            }
            .foregroundStyle(viewModel.displayedAmountOption == 1 ? .blue : Color(.label))
            
            HStack {
                Text("Total Amount")
                Spacer()
                Text("$\(String(format: "%.2f", viewModel.totalAmount))")
                    .bold()
            }
            .foregroundStyle(viewModel.displayedAmountOption == 2 ? .blue : Color(.label))
            
            HStack {
                Text("Subtotal Amount")
                Spacer()
                Text("$\(String(format: "%.2f", viewModel.subtotalAmount))")
                    .bold()
            }
            .foregroundStyle(viewModel.displayedAmountOption == 3 ? .blue : Color(.label))
        }
    }
}

#Preview {
    ResultView(viewModel: TipViewModel())
}

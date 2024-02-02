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
            HStack {
                Text("Total Amount With Tip")
                Spacer()
                Text("$\(String(format: "%.2f", viewModel.totalAmount))")
                    .bold()
            }
        }
    }
}

#Preview {
    ResultView(viewModel: TipViewModel())
}

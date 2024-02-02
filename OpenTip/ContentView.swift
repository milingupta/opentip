//
//  ContentView.swift
//  OpenTip
//
//  Created by Milin Gupta on 1/31/24.
//

import SwiftUI

struct ContentView: View {
        
    @StateObject var viewModel = TipViewModel()
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        NavigationStack {
            if horizontalSizeClass == .compact && verticalSizeClass == .regular {
                Form {
                    ControlView(viewModel: viewModel, isShowingTipPercentTextField: $viewModel.isShowingTipPercentTextField)
                    ResultView(viewModel: viewModel)
                }
                .navigationTitle("$\(String(format: "%.2f", viewModel.tipAmount))")
            } else {
                HStack {
                    Form {
                        ControlView(viewModel: viewModel, isShowingTipPercentTextField: $viewModel.isShowingTipPercentTextField)
                    }
                    Form {
                        Section {
                            Text("$\(String(format: "%.2f", viewModel.tipAmount))")
                                .font(.title)
                                .bold()
                        }
                        ResultView(viewModel: viewModel)
                    }
                }
            }
        }
    }
    
}

#Preview {
    ContentView()
}

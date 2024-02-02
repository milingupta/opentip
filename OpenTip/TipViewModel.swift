//
//  TipViewModel.swift
//  OpenTip
//
//  Created by Milin Gupta on 1/31/24.
//

import Foundation

final class TipViewModel: ObservableObject {
    
    // Published property for the TextField input
    @Published var textInputBillAmount: String = ""
    @Published var textInputTipPercent: String = ""
    
    @Published var isShowingTipPercentTextField: Bool = false
    
    // The actual decimal value you want to store
    var billAmount: Double {
        get {
            // Convert input to Double, return 0 if conversion fails
            return Double(textInputBillAmount) ?? 0.0
        }
        set {
            // Update textInput with the new value, making it an empty string if the value is 0
            textInputBillAmount = newValue == 0 ? "" : String(newValue)
        }
    }
    
    var tipPercent: Int {
        get {
            return Int(textInputTipPercent) ?? 0
        }
        set {
            textInputTipPercent = newValue == 0 ? "" : String(newValue)
        }
    }
    
    
    @Published var numberPeople: Int = 1
    
    @Published var tipAmount: Double = 0
    @Published var totalAmount: Double = 0
    
    @Published var isRoundingUp: Bool = false
    
    
    func incrementTip() {
        if tipPercent < 100 {
            tipPercent += 1
        }
    }
    
    func decrementTip() {
        if tipPercent > 0 {
            tipPercent -= 1
        }
    }

    func incrementPeople() {
        if numberPeople < 100 {
            numberPeople += 1
        }
    }
    
    
    func decrementPeople() {
        if numberPeople > 1 {
            numberPeople -= 1
        }
    }
    
    func calculateTip() {
        tipAmount = (billAmount * (Double(tipPercent) / 100)) / Double(numberPeople)
        if isRoundingUp {
            tipAmount.round(.up)
        }
        totalAmount = (billAmount + (tipAmount * Double(numberPeople))) / Double(numberPeople)
    }
    
}

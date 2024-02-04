//
//  TipViewModel.swift
//  OpenTip
//
//  Created by Milin Gupta on 1/31/24.
//

import Foundation

final class TipViewModel: ObservableObject {
    
    @Published var displayedAmountOption = 1
    
    @Published var textInputBillAmount: String = ""
    @Published var textInputTipPercent: String = ""
    @Published var textInputTaxAmount: String = ""
    
    @Published var isShowingTipPercentTextField: Bool = false
    
    var billAmount: Double {
        get {
            return Double(textInputBillAmount) ?? 0.0
        }
        set {
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
    
    var taxAmount: Double {
        get {
            return Double(textInputTaxAmount) ?? 0.0
        }
        set {
            textInputTaxAmount = newValue == 0 ? "" : String(newValue)
        }
    }
    
    
    @Published var numberPeople: Int = 1
    
    @Published var tipAmount: Double = 0
    @Published var totalAmount: Double = 0
    @Published var subtotalAmount: Double = 0
    
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
        
        subtotalAmount = totalAmount + (taxAmount / Double(numberPeople))
    }
    
}

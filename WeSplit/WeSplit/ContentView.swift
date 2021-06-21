//
//  ContentView.swift
//  WeSplit
//
//  Created by Jerozan Jeyendrarasa on 17/04/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var strAmount = ""
    @State private var strNumberOfPeople = "1"
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var amount: Double {
        return Double(strAmount) ?? 0
    }
    var numberOfPeople: Int {
        return max(Int(strNumberOfPeople) ?? 1, 1)
    }
    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let tipValue = amount / 100 * tipSelection
        let grandTotal = amount + tipValue
        
        return grandTotal
    }
    var totalPerPerson: Double {
        let amountPerPerson = totalAmount / Double(numberOfPeople)

        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $strAmount)
                        .keyboardType(.decimalPad)
                    TextField("Number of people", text: $strNumberOfPeople)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total amount")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                        .foregroundColor(tipPercentages[tipPercentage] == 0 ? .red : .black)
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  LenghtConverter
//
//  Created by Jerozan Jeyendrarasa on 22/04/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var fromUnit = UnitLength.meters
    @State private var toUnit = UnitLength.inches
    @State private var strValue = ""
    
    var value: Double {
        return Double(strValue) ?? 0
    }
    
    var res: Double {
        let valueMeasurement = Measurement(value: value, unit: fromUnit)
        return valueMeasurement.converted(to: toUnit).value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("from")) {
                    TextField("Value", text: $strValue)
                        .keyboardType(.decimalPad)
                    UnitPicker(unit: $fromUnit)
                }
                Section(header: Text("to")) {
                    Text("\(res, specifier: "%.2f")")
                    UnitPicker(unit: $toUnit)
                }
            }
            .navigationTitle("LengthConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

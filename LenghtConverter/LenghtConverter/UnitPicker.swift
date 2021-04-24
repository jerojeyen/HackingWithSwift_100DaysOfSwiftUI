//
//  File.swift
//  LenghtConverter
//
//  Created by Jerozan Jeyendrarasa on 22/04/2021.
//

import SwiftUI

struct UnitPicker: View {
    @Binding var unit: UnitLength
    
    var body: some View {
        Picker("Select unit", selection: $unit) {
            Text(UnitLength.meters.symbol)
                .tag(UnitLength.meters)
            Text(UnitLength.inches.symbol)
                .tag(UnitLength.inches)
            Text(UnitLength.feet.symbol)
                .tag(UnitLength.feet)
            Text(UnitLength.yards.symbol)
                .tag(UnitLength.yards)
            Text(UnitLength.miles.symbol)
                .tag(UnitLength.miles)
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct UnitPicker_Previews: PreviewProvider {
    static var previews: some View {
        UnitPicker(unit: .constant(UnitLength.meters))
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .previewDisplayName("Preview in meters")
        
        UnitPicker(unit: .constant(UnitLength.inches))
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .previewDisplayName("Preview in inches")
    }
}

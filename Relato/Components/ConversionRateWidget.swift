//
//  ConversionRateWidget.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 23/10/24.
//

import SwiftUI

struct ConversionRateWidget: View {
    var body: some View {
        VStack(alignment: .center, content: {
            Text("$23.781").colorInvert().font(.title).fontWeight(.bold)
            Text("Sales this month").colorInvert()
        })
            .padding()
            .background(Color("AccentColor"))
            .cornerRadius(12)
    }
}

#Preview {
    ConversionRateWidget()
}

//
//  SalesWidget.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 23/10/24.
//

import SwiftUI

struct SalesWidget: View {
    var body: some View {
        VStack(alignment: .center, content: {
            Text("54%").colorInvert().font(.title).fontWeight(.bold)
            Text("Conversion Rate").colorInvert()
        })
            .padding()
            .background(Color("AccentColor"))
            .cornerRadius(12)
    }
}

#Preview {
    SalesWidget()
}

//
//  LeadsView.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 21/10/24.
//

import SwiftUI

struct LeadsView: View {
    var body: some View {
#if os(iOS)
        ScrollView{
            HStack {
                VStack {
                    Text("Featured").font(.headline).fontWeight(.bold).frame(maxWidth: .infinity,alignment:.leading).foregroundColor(.gray)
                    Text("Leads").font(.title).fontWeight(.bold).frame(maxWidth: .infinity,alignment:.leading)
                }.frame(maxWidth: .infinity,alignment: .leading)
            }.padding()
        }
#endif
        
#if os(macOS)
        
#endif
    }
}

#Preview {
    LeadsView()
}

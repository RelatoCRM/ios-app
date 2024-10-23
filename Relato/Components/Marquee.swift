//
//  Marquee.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 23/10/24.
//

import Foundation
import SwiftUI

struct Marquee: View {
    let text: String
    @State private var offsetX: CGFloat = 0
    @State private var isAnimating: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            Text(text)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .offset(x: offsetX)
                .onAppear {
                    let textWidth = textWidth(for: geometry.size)
                    let containerWidth = geometry.size.width
                    offsetX = containerWidth // Start from the right edge

                    // Start the marquee animation
                    withAnimation(Animation.linear(duration: Double(textWidth / 30)).repeatForever(autoreverses: false)) {
                        offsetX = -textWidth // Move to the left past the text width
                    }
                }
        }
        .frame(height: 20) // Adjust height as needed
        .clipped()
    }
    
    // Calculate the width of the text in the available space
    private func textWidth(for size: CGSize) -> CGFloat {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .headline).pointSize)
        label.text = text
        label.sizeToFit()
        return label.frame.width
    }
}

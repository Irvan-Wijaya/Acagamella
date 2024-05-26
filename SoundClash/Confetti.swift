//
//  Confetti.swift
//  SoundClash
//
//  Created by Irvan Wijaya on 22/05/24.
//

import Foundation
import SwiftUI

struct Confetti: View {
    let color: Color
    @State private var xOffset: CGFloat = 0
    @State private var yOffset: CGFloat = 0
    @State private var rotation: Double = 0

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: 30, height: 10)
            .rotationEffect(.degrees(rotation))
            .offset(x: xOffset, y: yOffset)
            .onAppear {
                // Randomize initial position and rotation
                self.xOffset = CGFloat.random(in: -300...300)
                self.yOffset = CGFloat.random(in: -800...200)
                self.rotation = Double.random(in: 0...360)
                
                // Animate confetti falling
                withAnimation(Animation.linear(duration: 10)) {
                    self.yOffset = UIScreen.main.bounds.height
                }
            }
    }
}

struct ConfettiView: View {
    @State private var confetti: [Color] = [.red, .green, .blue, .orange, .yellow, .purple, .teal, .pink, .mint, .black, .brown, .cyan, .indigo, .white, .red, .green, .blue, .orange, .yellow, .purple, .teal, .pink, .mint, .black, .brown, .cyan, .indigo, .white]

    var body: some View {
        ZStack {
            ForEach(0..<confetti.count, id: \.self) { index in
                Confetti(color: confetti[index])
                    .opacity(index.isMultiple(of: 2) ? 0.7 : 1) // alternate opacity for effect
            }
        }
    }
}

//
//  SplashScreen.swift
//  SoundClash
//
//  Created by Irvan Wijaya on 23/05/24.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                ContentView()
            } else {
                
                Image("Acagamella")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 480, height: 480)
                
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color(.clear))
    }
}

#Preview {
    SplashScreen()
}

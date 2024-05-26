//
//  WelcomeScreen.swift
//  SoundClash
//
//  Created by Irvan Wijaya on 24/05/24.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        VStack {
            Text("Welcome to Acagamella")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            Text("Get ready to test your knowledge and have fun!")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
            
            NavigationLink(destination: WelcomeScreen()) {
                Text("Start")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("Welcome")
    }
}


#Preview {
    WelcomeScreen()
}

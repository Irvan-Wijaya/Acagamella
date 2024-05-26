//
//  ContentView.swift
//  SoundClash
//
//  Created by Irvan Wijaya on 20/05/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        let questions = [
            QuizQuestion(musicFile: "Plants vs. Zombies sound effect (acapella)", question: "What game is this?", choices: ["Plant VS Zombie 🌻🧟", "Among Us 👾🔪", "Brawl Stars 🤼💥", "Fruit Ninja 🍉🔪"], correctAnswer: "Plant VS Zombie 🌻🧟"),
            
            QuizQuestion(musicFile: "Jetpack Joyride (acapella)", question: "What's the name of this game?", choices: ["Roblox 🎲🏗️", "Jetpack Joyride 🚀🏃‍♂️", "Hay Day 🌾🚜","Angry Birds 🐦🎯"], correctAnswer: "Jetpack Joyride 🚀🏃‍♂️"),
            
            QuizQuestion(musicFile: "Subway Surfers (acapella)", question: "Can you tell me the title of this game?", choices: ["Pokémon GO 🐾📍", "Temple Run 🏃💎", "Candy Crush Saga 🍭🍬", "Subway Surfers 🛤️🏃"], correctAnswer: "Subway Surfers 🛤️🏃"),
            
            QuizQuestion(musicFile: "Angry Birds sound effect (acapella)", question: "What's this game called?", choices: ["Minecraft ⛏️🌍", "Cooking Fever 🍳👩‍🍳", "Angry Birds 🐦🎯", "Sonic Dash 🦔🏃‍♂️"], correctAnswer: "Angry Birds 🐦🎯"),
            
            QuizQuestion(musicFile: "Candy Crush SAGA (acapella)", question: "What game are we playing?", choices: ["Fruit Ninja 🍉🔪", "Crossy Road 🐔🛣️", "Candy Crush Saga 🍭🍬", "Hay Day 🌾🚜"], correctAnswer: "Candy Crush Saga 🍭🍬"),
            
            QuizQuestion(musicFile: "Animal Crossing theme (acapella)", question: "Which title does this game go by?", choices: ["Alto's Odyssey 🏜️🏂", "Animal Crossing: New Horizons 🏝️🏕️", "The Sims Mobile 🏠👫", "Geometry Dash ▲🎵"], correctAnswer: "Animal Crossing: New Horizons 🏝️🏕️"),
            
            QuizQuestion(musicFile: "Gravity Falls (acapella)", question: "How about this?", choices: ["Gravity Falls 🌲👦👧🌌", "Doodle Jump 🚀↗️", "8 Ball Pool 🎱🏆", "Among Us 👾🔪"], correctAnswer: "Gravity Falls 🌲👦👧🌌"),
            
            QuizQuestion(musicFile: "Fruit Ninja (acapella)", question: "Could you identify this game for me?", choices: ["Hungry Shark Evolution 🦈🍴", "SimCity BuildIt 🏙️🔧", "Asphalt 8: Airborne 🏎️🌬️", "Fruit Ninja 🍉🔪"], correctAnswer: "Fruit Ninja 🍉🔪"),
            
            QuizQuestion(musicFile: "Cut the Rope theme (acapella)", question: "What's the title of this game?", choices: ["Hill Climb Racing 🚗🏞️", "Dragon City 🐉🏙️", "Sonic Dash 🦔🏃‍♂️", "Cut the Rope 🍬🐸🎮"], correctAnswer: "Cut the Rope 🍬🐸🎮"),
            
            QuizQuestion(musicFile: "GTA theme (acapella)", question: "Do you know what game this is?", choices: ["GTA San Andreas 🚗💥🔫", "Plague Inc. 🦠🌍", "Minecraft ⛏️🌍", "Brawl Stars 🤼💥"], correctAnswer: "GTA San Andreas 🚗💥🔫")
        ]

        QuizView(questions: questions)
    }
}

#Preview {
    ContentView()
}

//
//  QuizQuestion.swift
//  SoundClash
//
//  Created by Irvan Wijaya on 20/05/24.
//

import Foundation
import SwiftData

struct QuizQuestion: Identifiable {
    let id = UUID()
    let musicFile: String
    let question: String
    let choices: [String]
    let correctAnswer: String
}

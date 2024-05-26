import SwiftUI
import AVFoundation

class QuizViewModel: ObservableObject {
    @Published var questions: [QuizQuestion]
    @Published var currentQuestionIndex = 0
    @Published var score = 0
    @Published var showResult = false
    @Published var selectedAnswer: String?
    @Published var isAnswerCorrect: Bool?
    
    var player: AVAudioPlayer!
    
    private var audioPlayer: AVAudioPlayer?

    init(questions: [QuizQuestion]) {
        self.questions = questions
    }
    
    var currentQuestion: QuizQuestion {
        questions[currentQuestionIndex]
    }
        
    func playMusic() {
        let musicFile = currentQuestion.musicFile
        if let url = Bundle.main.url(forResource: musicFile, withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("Error playing music file: \(error.localizedDescription)")
            }
        }
    }
    
    func pauseMusic() {
        player?.pause()
    }

    
    func checkAnswer(_ answer: String) {
        if selectedAnswer == nil {
            selectedAnswer = answer
            isAnswerCorrect = (answer == currentQuestion.correctAnswer)
            if isAnswerCorrect == true {
                score += 100
                triggerHapticFeedback()
            }
        }
    }
    
    func nextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
            selectedAnswer = nil
            isAnswerCorrect = nil
        } else {
            showResult = true
        }
    }
    
    func triggerHapticFeedback() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}

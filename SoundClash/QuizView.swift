import SwiftUI

struct QuizView: View {
    @StateObject private var viewModel: QuizViewModel
    @State private var isSpinning = false
    @State private var animatedGradient = false

    init(questions: [QuizQuestion]) {
        _viewModel = StateObject(wrappedValue: QuizViewModel(questions: questions))
    }

    var body: some View {
        ZStack {
            LinearGradient(colors: [.pink, .blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .hueRotation(.degrees(animatedGradient ? 180 : 0))
                .ignoresSafeArea()
                .onAppear {
                    withAnimation(.linear(duration: 5.0).repeatForever(autoreverses: true)) {
                        animatedGradient.toggle()
                    }
                }
            
            BlurView(style: .systemThinMaterial)
                            .ignoresSafeArea()

            if viewModel.showResult {
                VStack {
                    Spacer()
                    ConfettiView()
                    Text("Quiz Finished!")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 20)
                                
                    Text("Your Score:")
                        .font(.headline)
                        .fontWeight(.medium)
                        .padding(.bottom, 5)
                                
                    Text("\(viewModel.score)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("ADA C7 - NC2")
                        .font(.headline)
                        .fontWeight(.regular)
                        .padding(.vertical, 8)
                    
                    Text("Music Source: Youtube -  MayTree")
                        .font(.headline)
                        .fontWeight(.regular)
                        .padding(.vertical, 8)
                    
                    Spacer()
                }
            } else {
                VStack {
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.6), lineWidth: 10)
                            .frame(width: 550, height: 550)

                        Circle()
                            .stroke(Color.black, lineWidth: 20)
                            .frame(width: 520, height: 520)

                        Circle()
                            .fill(Color.black.opacity(0.85))
                            .frame(width: 500, height: 500)

                        Circle()
                            .stroke(Color.black, lineWidth: 3)
                            .frame(width: 450, height: 450)

                        Circle()
                            .stroke(Color.black, lineWidth: 3)
                            .frame(width: 350, height: 350)

                        Circle()
                            .stroke(Color.black, lineWidth: 3)
                            .frame(width: 280, height: 280)

                        Circle()
                            .fill(Color.black)
                            .frame(width: 200, height: 200)

                        Circle()
                            .trim(from: 0.1, to: 1.0)
                            .stroke(Color.white, lineWidth: 5)
                            .frame(width: 130, height: 130)

                        Circle()
                            .fill(Color.teal)
                            .frame(width: 125, height: 125)

                        Image(systemName: "play.fill")
                            .scaleEffect(2.5)
                            .symbolEffect(.pulse)
                            .foregroundColor(.white)
                    }
                    .rotationEffect(.degrees(isSpinning ? 2160 : 0))
                    .onTapGesture {
                        withAnimation(.linear(duration: 80)) {
                            viewModel.playMusic()
                            isSpinning.toggle()
                        }
                    }
                    .padding(.bottom, 32)

                    Text(viewModel.currentQuestion.question)
                        .font(.largeTitle)
                        .padding(.bottom, 16)

                    ForEach(viewModel.currentQuestion.choices, id: \.self) { choice in
                        Button(action: {
                            viewModel.checkAnswer(choice)
                        }) {
                            Text(choice)
                                .frame(maxWidth: 600, maxHeight: 40)
                                .padding()
                                .font(.system(size: 20))
                                .background(viewModel.selectedAnswer == choice ? (viewModel.isAnswerCorrect == true ? Color.clear : Color.red) : Color.white)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color.green, Color.teal]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                .foregroundColor(.black)
                        }
                        .cornerRadius(50)
                    }
                    .padding(.bottom, 8)

                    if viewModel.isAnswerCorrect == true {
                        ConfettiView()
                    }

                    if viewModel.selectedAnswer != nil {
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                viewModel.nextQuestion()
                                viewModel.pauseMusic()
                                withAnimation(.linear(duration: 0)) {
                                    isSpinning = false
                                }
                            }, label: {
                                Image(systemName: "forward.fill")
                            })
                            .scaleEffect(CGSize(width: 3.0, height: 3.0))
                            .foregroundColor(.white)
                            .symbolEffect(.pulse)
                        }
                        .padding([.leading, .trailing], 72)
                        .padding(.top, 16)
                    }

                }
                .padding()
            }
        }
    }
}

#Preview {
    QuizView(questions: [
        QuizQuestion(musicFile: "Plants vs. Zombies sound effect (acapella)", question: "What game is this?", choices: ["Plant VS Zombie", "Song B", "Song C", "song d"], correctAnswer: "Plant VS Zombie"),
    ])
}


struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

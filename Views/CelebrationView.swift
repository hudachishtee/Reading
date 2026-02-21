import SwiftUI

struct CelebrationView: View {
    
    let story: Story
    
    @State private var particles: [ConfettiParticle] = []
    
    var body: some View {
        
        ZStack {
            
            Color(red: 227/255, green: 242/255, blue: 255/255)
                .ignoresSafeArea()
            
            // 🎉 Full Screen Continuous Confetti
            GeometryReader { _ in
                ZStack {
                    ForEach(particles) { particle in
                        
                        Group {
                            if particle.isCircle {
                                Circle()
                                    .fill(particle.color)
                            } else {
                                RoundedRectangle(cornerRadius: 2)
                                    .fill(particle.color)
                                    .rotationEffect(.degrees(particle.rotation))
                            }
                        }
                        .frame(width: particle.size,
                               height: particle.size)
                        .position(particle.position)
                        .opacity(particle.opacity)
                    }
                }
                .onAppear {
                    startConfetti()
                }
            }
            .allowsHitTesting(false)
            
            VStack(spacing: 30) {
                
                Spacer()
                
                Text("You Did It! 🎉")
                    .font(.custom("OpenDyslexic-Bold", size: 34))
                    .foregroundColor(Color(red: 54/255,
                                           green: 92/255,
                                           blue: 92/255))
                
                Text("You finished reading\n\(story.title)!")
                    .font(.custom("OpenDyslexic-Regular", size: 22))
                    .multilineTextAlignment(.center)
                
                Image("owl_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                
                Spacer()
                
                NavigationLink(destination: StoryListView()) {
                    Text("Back to Library")
                        .font(.custom("OpenDyslexic-Bold", size: 22))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 80/255,
                                          green: 150/255,
                                          blue: 140/255))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 40)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // MARK: - Continuous Confetti Logic (FULL SCREEN FIX)
    private func startConfetti() {
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { _ in
            
            for _ in 0..<4 {
                
                let startX = CGFloat.random(in: 0...screenWidth)
                
                var particle = ConfettiParticle(
                    position: CGPoint(x: startX, y: -20),
                    color: randomColor(),
                    size: CGFloat.random(in: 6...14),
                    opacity: 1,
                    rotation: Double.random(in: 0...360),
                    isCircle: Bool.random()
                )
                
                particles.append(particle)
                
                let index = particles.count - 1
                
                withAnimation(
                    .linear(duration: Double.random(in: 3...6))
                ) {
                    particles[index].position.y = screenHeight + 40
                    particles[index].opacity = 0
                }
            }
            
            // Memory safety
            if particles.count > 250 {
                particles.removeFirst(60)
            }
        }
    }
    
    private func randomColor() -> Color {
        [
            .red,
            .yellow,
            .blue,
            .green,
            .orange,
            .pink,
            .purple
        ].randomElement()!
    }
}

// MARK: - Particle Model (Same File)
struct ConfettiParticle: Identifiable {
    let id = UUID()
    var position: CGPoint
    var color: Color
    var size: CGFloat
    var opacity: Double
    var rotation: Double
    var isCircle: Bool
}

#Preview {
    NavigationStack {
        CelebrationView(story: StoryData.stories[0])
    }
}

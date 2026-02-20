import SwiftUI

struct CelebrationView: View {
    
    let story: Story
    @Environment(\.dismiss) private var dismiss
    @State private var animate = false
    
    var body: some View {
        
        ZStack {
            
            // Background
            Color(red: 227/255, green: 242/255, blue: 255/255)
                .ignoresSafeArea()
            
            // MARK: Confetti
            ForEach(0..<40, id: \.self) { _ in
                Circle()
                    .fill(randomColor())
                    .frame(width: 8, height: 8)
                    .offset(
                        x: CGFloat.random(in: -200...200),
                        y: animate ? 800 : -400
                    )
                    .animation(
                        .easeIn(duration: Double.random(in: 1.5...3))
                        .repeatForever(autoreverses: false),
                        value: animate
                    )
            }
            
            VStack(spacing: 30) {
                
                Spacer()
                
                Text("You Did It! 🎉")
                    .font(.custom("OpenDyslexic-Bold", size: 36))
                    .foregroundColor(Color(red: 54/255,
                                           green: 92/255,
                                           blue: 92/255))
                
                Text("You finished reading\n\(story.title)!")
                    .font(.custom("OpenDyslexic-Regular", size: 22))
                    .multilineTextAlignment(.center)
                
                Image("owl_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                
                Spacer()
                
                Button {
                    popToLibrary()
                } label: {
                    Text("Back to Library")
                        .font(.custom("OpenDyslexic-Bold", size: 22))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: 300)
                        .background(Color(red: 80/255,
                                          green: 150/255,
                                          blue: 140/255))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
                
                Spacer()
            }
        }
        .onAppear {
            animate = true
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // MARK: Proper Pop To Root
    private func popToLibrary() {
        // Pop multiple levels safely
        for i in 0..<6 {
            DispatchQueue.main.asyncAfter(deadline: .now() + (Double(i) * 0.05)) {
                dismiss()
            }
        }
    }
    
    // MARK: Confetti Colors
    private func randomColor() -> Color {
        [.red, .blue, .green, .orange, .purple, .pink, .yellow].randomElement()!
    }
}

#Preview {
    NavigationStack {
        CelebrationView(story: StoryData.stories[0])
    }
}

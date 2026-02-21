import SwiftUI

struct CelebrationView: View {
    
    let story: Story
    
    var body: some View {
        
        ZStack {
            
            Color(red: 227/255, green: 242/255, blue: 255/255)
                .ignoresSafeArea()
            
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
                
                // 🔥 REAL ROOT FIX
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
}

#Preview {
    NavigationStack {
        CelebrationView(story: StoryData.stories[0])
    }
}

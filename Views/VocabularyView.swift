import SwiftUI

struct VocabularyView: View {
    
    let story: Story
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ZStack {
            
            // MARK: Background Color
            Color(red: 227/255, green: 242/255, blue: 255/255)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // MARK: Top Bar (Back + Done)
                HStack {
                    
                    // Back Button
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(Color(red: 54/255,
                                                   green: 92/255,
                                                   blue: 92/255))
                    }
                    
                    Spacer()
                    
                    // Done Button → Celebration Screen
                    NavigationLink {
                        CelebrationView(story: story)
                    } label: {
                        Text("Done")
                            .font(.custom("OpenDyslexic-Bold", size: 18))
                            .foregroundColor(Color(red: 54/255,
                                                   green: 92/255,
                                                   blue: 92/255))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                
                ScrollView {
                    VStack(spacing: 35) {
                        
                        Spacer(minLength: -15)
                        
                        // MARK: Rounded Header
                        Text("Vocabulary of\nthe Week")
                            .font(.custom("OpenDyslexic-Bold", size: 30))
                            .foregroundColor(Color(red: 54/255,
                                                   green: 92/255,
                                                   blue: 92/255))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 22)
                            .background(
                                RoundedRectangle(cornerRadius: 40)
                                    .fill(Color(red: 208/255,
                                                green: 226/255,
                                                blue: 214/255))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color(red: 120/255,
                                                  green: 168/255,
                                                  blue: 140/255),
                                            lineWidth: 1.5)
                            )
                            .padding(.horizontal)
                            .padding(.top, 20)
                        
                        
                        ForEach(story.vocabulary) { item in
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                HStack {
                                    Text(item.word)
                                        .font(.custom("OpenDyslexic-Bold", size: 22))
                                    
                                    Spacer()
                                    
                                    Button {
                                        AudioManager.shared.playSound(named: item.audioFileName)
                                    } label: {
                                        Image(systemName: "speaker.wave.2.fill")
                                            .foregroundColor(.gray)
                                    }
                                }
                                
                                Text(item.meaning)
                                    .font(.custom("OpenDyslexic-Regular", size: 18))
                                
                                Text("“\(item.example)”")
                                    .font(.custom("OpenDyslexic-Regular", size: 16))
                                    .foregroundStyle(.gray)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(red: 208/255,
                                                green: 226/255,
                                                blue: 214/255))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(red: 120/255,
                                                  green: 168/255,
                                                  blue: 140/255),
                                            lineWidth: 1.2)
                            )
                            .padding(.horizontal)
                        }
                        
                        Spacer(minLength: 40)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onDisappear {
            AudioManager.shared.stop()
        }
    }
}

#Preview {
    NavigationStack {
        VocabularyView(story: StoryData.stories[0])
    }
}

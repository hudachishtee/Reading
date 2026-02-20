import SwiftUI

struct MoralView: View {
    
    let story: Story
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var isIpad: Bool {
        sizeClass == .regular
    }
    
    var body: some View {
        
        ZStack {
            
            Color(red: 227/255, green: 242/255, blue: 255/255)
                .ignoresSafeArea()
            
            VStack {
                
                // MARK: Title
                Text("Moral of the Story")
                    .font(.custom("OpenDyslexic-Bold",
                                  size: isIpad ? 32 : 22))
                    .foregroundColor(Color(red: 54/255,
                                           green: 92/255,
                                           blue: 92/255))
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(red: 208/255,
                                        green: 226/255,
                                        blue: 214/255))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color(red: 120/255,
                                          green: 168/255,
                                          blue: 140/255),
                                    lineWidth: 1.5)
                    )
                    .padding(.top, isIpad ? 30 : 40)
                
                Spacer(minLength: isIpad ? 50 : 30)
                
                // MARK: Thought Bubble + Owl
                HStack(alignment: .bottom, spacing: 16) {
                    
                    Text("A small kindness\ncan make a\nbig difference.")
                        .lineLimit(3)
                        .font(.custom("OpenDyslexic-Regular",
                                      size: isIpad ? 26 : 18))
                        .multilineTextAlignment(.center)
                        .lineSpacing(6)
                        .foregroundColor(.black.opacity(0.85))
                        .padding(.vertical, 20)
                        .padding(.horizontal, 24)
                        .background(
                            RoundedRectangle(cornerRadius: 28)
                                .fill(Color.white)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 28)
                                .stroke(Color(red: 120/255,
                                              green: 168/255,
                                              blue: 140/255),
                                        lineWidth: 1.5)
                        )
                        .frame(maxWidth: isIpad ? 520 : 240) // 👈 flexible width
                        .layoutPriority(1) // 👈 prevents compression
                    
                    Image("owl_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: isIpad ? 220 : 120)
                }
                .padding(.horizontal, isIpad ? 80 : 20)
                
                Spacer()
                
                // MARK: Explore Vocabulary Button
                NavigationLink {
                    VocabularyView(story: story)
                        .onAppear {
                            AudioManager.shared.stop()
                        }
                } label: {
                    Text("Explore Vocabulary")
                        .font(.custom("OpenDyslexic-Bold",
                                      size: isIpad ? 22 : 18))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: isIpad ? 350 : .infinity)
                        .background(Color(red: 80/255,
                                          green: 150/255,
                                          blue: 140/255))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
                .padding(.horizontal, isIpad ? 120 : 30)
                .padding(.bottom, isIpad ? 50 : 30)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        MoralView(story: StoryData.stories[0])
    }
}

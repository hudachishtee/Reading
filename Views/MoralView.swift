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
                    .padding(.vertical, 14)
                    .padding(.horizontal, 30)
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
                    .padding(.top, isIpad ? 30 : 50)
                
                Spacer(minLength: 40)
                
                // MARK: Bubble + Owl
                HStack(alignment: .bottom, spacing: 16) {
                    
                    Text(story.moral)
                        .font(.custom("OpenDyslexic-Regular",
                                      size: isIpad ? 26 : 18))
                        .multilineTextAlignment(.center)
                        .lineSpacing(8)
                        .foregroundColor(.black.opacity(0.85))
                        .padding(.vertical, 24)
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
                        .frame(maxWidth: isIpad ? 520 : 260)
                    
                    Image("owl_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: isIpad ? 220 : 120)
                }
                .padding(.horizontal, isIpad ? 80 : 20)
                
                Spacer()
                
                // MARK: Vocabulary Button
                NavigationLink {
                    VocabularyView(story: story)
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
                .padding(.bottom, isIpad ? 50 : 40)
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

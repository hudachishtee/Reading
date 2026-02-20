import SwiftUI

struct StoryReaderView: View {
    
    let story: Story
    @State private var currentPage = 0
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var isIpad: Bool {
        sizeClass == .regular
    }
    
    var body: some View {
        
        VStack {
            
            Spacer(minLength: isIpad ? 40 : 20)
            
            // MARK: Story Image
            Image(story.pages[currentPage].image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: isIpad ? 650 : .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .padding(.horizontal, isIpad ? 60 : 20)
            
            Spacer(minLength: 30)
            
            // MARK: Story Text
            Text(story.pages[currentPage].text)
                .font(.custom("OpenDyslexic-Regular",
                              size: isIpad ? 30 : 22))
                .lineSpacing(12)
                .foregroundColor(.black.opacity(0.85))
                .multilineTextAlignment(.leading)
                .padding(.horizontal, isIpad ? 100 : 30)
            
            Spacer()
            
            // MARK: Bottom Control Bar
            VStack(spacing: 20) {
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color(red: 228/255, green: 248/255, blue: 235/255))
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color(red: 130/255,
                                              green: 182/255,
                                              blue: 147/255),
                                        lineWidth: 1.5)
                        )
                        .frame(height: isIpad ? 90 : 70)
                        .padding(.horizontal, isIpad ? 120 : 30)
                    
                    HStack {
                        
                        // Previous
                        Button {
                            if currentPage > 0 {
                                AudioManager.shared.stop()
                                currentPage -= 1
                            }
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: isIpad ? 28 : 22, weight: .bold))
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        // Play Button
                        Button {
                            playNarration()
                        } label: {
                            Circle()
                                .fill(Color(red: 80/255,
                                            green: 150/255,
                                            blue: 140/255))
                                .frame(width: isIpad ? 70 : 55,
                                       height: isIpad ? 70 : 55)
                                .overlay(
                                    Image(systemName: "play.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: isIpad ? 28 : 22))
                                )
                        }
                        
                        Spacer()
                        
                        // Next
                        Button {
                            if currentPage < story.pages.count - 1 {
                                AudioManager.shared.stop()
                                currentPage += 1
                            }
                        } label: {
                            Image(systemName: "chevron.right")
                                .font(.system(size: isIpad ? 28 : 22, weight: .bold))
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal, isIpad ? 160 : 60)
                }
                
                // MARK: Page Dots
                HStack(spacing: 10) {
                    ForEach(0..<story.pages.count, id: \.self) { index in
                        Circle()
                            .fill(index == currentPage
                                  ? Color(red: 80/255,
                                          green: 150/255,
                                          blue: 140/255)
                                  : Color.gray.opacity(0.4))
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.bottom, isIpad ? 30 : 20)
            }
        }
        .background(Color(red: 227/255, green: 242/255, blue: 255/255))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            
            // MARK: Done Button (Only on Last Page)
            if currentPage == story.pages.count - 1 {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        MoralView(story: story)
                            .onAppear {
                                AudioManager.shared.stop()
                            }
                    } label: {
                        Text("Done")
                            .font(.custom("OpenDyslexic-Bold", size: 16))
                            .foregroundColor(Color(red: 80/255,
                                                   green: 150/255,
                                                   blue: 140/255))
                    }
                }
            }
        }
    }
    
    private func playNarration() {
        let page = story.pages[currentPage]
        AudioManager.shared.playSound(named: page.audioFileName)
    }
}

#Preview {
    NavigationStack {
        StoryReaderView(story: StoryData.stories[0])
    }
}

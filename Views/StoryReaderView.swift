import SwiftUI

struct StoryReaderView: View {
    
    let story: Story
    @State private var currentPage = 0
    @State private var isPlaying = false
    
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.dismiss) private var dismiss
    
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
            
            // MARK: Story Text (Automatic Paragraph Split)
            Text(formattedText(for: story.pages[currentPage].text))
                .font(.custom("OpenDyslexic-Regular",
                              size: isIpad ? 30 : 22))
                .lineSpacing(14)
                .foregroundColor(.black.opacity(0.85))
                .multilineTextAlignment(.leading)
                .padding(.horizontal, isIpad ? 100 : 30)
                .animation(.easeInOut, value: currentPage)
            
            Spacer()
            
            // MARK: Bottom Controls
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
                        
                        // MARK: Previous
                        Button {
                            if currentPage > 0 {
                                stopAudio()
                                currentPage -= 1
                            }
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: isIpad ? 28 : 22, weight: .bold))
                                .foregroundColor(currentPage == 0 ? .gray : .black)
                        }
                        .disabled(currentPage == 0)
                        
                        Spacer()
                        
                        // MARK: Play / Pause
                        Button {
                            toggleAudio()
                        } label: {
                            Circle()
                                .fill(Color(red: 80/255,
                                            green: 150/255,
                                            blue: 140/255))
                                .frame(width: isIpad ? 70 : 55,
                                       height: isIpad ? 70 : 55)
                                .overlay(
                                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: isIpad ? 28 : 22))
                                )
                        }
                        
                        Spacer()
                        
                        // MARK: Next
                        Button {
                            if currentPage < story.pages.count - 1 {
                                stopAudio()
                                currentPage += 1
                            }
                        } label: {
                            Image(systemName: "chevron.right")
                                .font(.system(size: isIpad ? 28 : 22, weight: .bold))
                                .foregroundColor(
                                    currentPage == story.pages.count - 1 ? .gray : .black
                                )
                        }
                        .disabled(currentPage == story.pages.count - 1)
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
            if currentPage == story.pages.count - 1 {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        MoralView(story: story)
                            .onAppear { stopAudio() }
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
        .onDisappear {
            stopAudio()
        }
    }
}

// MARK: - Helpers
extension StoryReaderView {
    
    private func formattedText(for text: String) -> String {
        text
            .replacingOccurrences(of: ". ", with: ".\n")
    }
    
    private func toggleAudio() {
        if isPlaying {
            stopAudio()
        } else {
            let page = story.pages[currentPage]
            AudioManager.shared.playSound(named: page.audioFileName)
            isPlaying = true
        }
    }
    
    private func stopAudio() {
        AudioManager.shared.stop()
        isPlaying = false
    }
}

#Preview {
    NavigationStack {
        StoryReaderView(story: StoryData.stories[1])
    }
}

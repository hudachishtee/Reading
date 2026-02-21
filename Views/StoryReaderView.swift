import SwiftUI
import AVFoundation

struct StoryReaderView: View {
    
    let story: Story
    
    @State private var currentPage = 0
    @State private var isPlaying = false
    
    @State private var sentences: [String] = []
    @State private var highlightedIndex: Int = -1
    
    @State private var audioDuration: Double = 0
    @State private var timer: Timer?
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var isIpad: Bool {
        sizeClass == .regular
    }
    
    var body: some View {
        
        ZStack {
            
            Color(red: 227/255, green: 242/255, blue: 255/255)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Spacer(minLength: isIpad ? 40 : 20)
                
                // MARK: Image
                Image(story.pages[currentPage].image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: isIpad ? 650 : .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding(.horizontal, isIpad ? 60 : 20)
                
                Spacer(minLength: 20)
                
                // MARK: Scrollable Text
                ScrollView {
                    VStack(alignment: .leading, spacing: 14) {
                        ForEach(Array(sentences.enumerated()), id: \.offset) { index, sentence in
                            Text(sentence)
                                .font(.custom("OpenDyslexic-Regular",
                                              size: isIpad ? 30 : 22))
                                .foregroundColor(
                                    index == highlightedIndex
                                    ? Color(red: 80/255,
                                            green: 150/255,
                                            blue: 140/255)
                                    : .black.opacity(0.85)
                                )
                                .animation(.easeInOut(duration: 0.3), value: highlightedIndex)
                        }
                    }
                    .padding(.horizontal, isIpad ? 100 : 30)
                    .padding(.bottom, 20)
                }
                .frame(maxHeight: isIpad ? 300 : 220)
                
                Spacer()
                
                // MARK: Controls
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
                                    stopAudio()
                                    currentPage -= 1
                                    preparePage()
                                }
                            } label: {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: isIpad ? 28 : 22, weight: .bold))
                                    .foregroundColor(currentPage == 0 ? .gray : .black)
                            }
                            .disabled(currentPage == 0)
                            
                            Spacer()
                            
                            // Play / Pause
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
                            
                            // Next
                            Button {
                                if currentPage < story.pages.count - 1 {
                                    stopAudio()
                                    currentPage += 1
                                    preparePage()
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
                    
                    // Page Dots
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
        }
        .onAppear {
            preparePage()
        }
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
    }
}

// MARK: - Logic
extension StoryReaderView {
    
    private func preparePage() {
        let text = story.pages[currentPage].text
        
        sentences = text
            .components(separatedBy: ". ")
            .map { $0.hasSuffix(".") ? $0 : $0 + "." }
        
        highlightedIndex = -1
        
        loadAudioDuration()
    }
    
    private func loadAudioDuration() {
        let fileName = story.pages[currentPage].audioFileName
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
            let asset = AVURLAsset(url: url)
            audioDuration = CMTimeGetSeconds(asset.duration)
        }
    }
    
    private func toggleAudio() {
        if isPlaying {
            stopAudio()
        } else {
            startAudio()
        }
    }
    
    private func startAudio() {
        let page = story.pages[currentPage]
        AudioManager.shared.playSound(named: page.audioFileName)
        
        isPlaying = true
        startHighlighting()
    }
    
    private func stopAudio() {
        AudioManager.shared.stop()
        timer?.invalidate()
        isPlaying = false
        highlightedIndex = -1
    }
    
    private func startHighlighting() {
        guard sentences.count > 0 else { return }
        
        let interval = audioDuration / Double(sentences.count)
        
        highlightedIndex = 0
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { t in
            if highlightedIndex < sentences.count - 1 {
                highlightedIndex += 1
            } else {
                t.invalidate()
                isPlaying = false
            }
        }
    }
}

#Preview {
    NavigationStack {
        StoryReaderView(story: StoryData.stories[0])
    }
}

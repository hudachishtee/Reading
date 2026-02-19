import SwiftUI

struct StoryCardView: View {
    
    let story: Story
    @State private var showTapHint = false   // ← ADDED
    
    var body: some View {
        
        GeometryReader { geo in
            
            // Your Sketch base width (iPhone 16e)
            let designWidth: CGFloat = 390
            let scale = geo.size.width / designWidth
            
            ZStack(alignment: .topLeading) {
                
                // MARK: - Pill Background
                RoundedRectangle(cornerRadius: 30 * scale, style: .continuous)
                    .fill(Color(red: 228/255, green: 248/255, blue: 235/255))
                    .overlay(
                        RoundedRectangle(cornerRadius: 15 * scale, style: .continuous)
                            .stroke(Color(red: 130/255,
                                          green: 182/255,
                                          blue: 147/255),
                                    lineWidth: 1.2 * scale)
                    )
                    .frame(
                        width: 227.06 * scale,
                        height: 101.07 * scale
                    )
                    .position(
                        x: (154.99 + 227.06/2) * scale,
                        y: (245.52 + 101.07/2 - 235.67) * scale
                    )
                
                
                // MARK: - Cover Image
                Image(story.coverImage)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: 178.28 * scale,
                        height: 119 * scale
                    )
                    .clipShape(
                        RoundedRectangle(cornerRadius: 25 * scale,
                                         style: .continuous)
                    )
                    .position(
                        x: (5.05 + 178.28/2) * scale,
                        y: (119/2) * scale
                    )
                
                
                // MARK: - Title
                Text(story.title)
                    .font(.custom("OpenDyslexic-Bold", size: 15 * scale))
                    .foregroundColor(Color(red: 47/255, green: 93/255, blue: 98/255))
                    .frame(width: 190 * scale, alignment: .leading)
                    .position(
                        x: (130.99 + 60 + 190/2) * scale,
                        y: (261.21 - 225.67) * scale
                    )
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .minimumScaleFactor(0.5)

                
                // MARK: - Description
                Text(storySubtitle(for: story.title))
                    .font(.custom("OpenDyslexic-Regular",
                                  size: 10 * scale))
                    .foregroundColor(.black.opacity(0.75))
                    .frame(width: 204 * scale, alignment: .leading)
                    .position(
                        x: (190 + 204/2) * scale,
                        y: (300.9 - 235.67) * scale
                    )
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .minimumScaleFactor(0.5)
                
                // MARK: - Tap Text (Animated)
                Text("Tap to Start Reading!")
                    .font(.custom("OpenDyslexic-Regular",
                                  size: 9 * scale))
                    .foregroundColor(.black.opacity(0.45))
                    .frame(width: 204 * scale, alignment: .leading)
                    .position(
                        x: (190 + 204/2) * scale,
                        y: (322.9 - 235.67) * scale
                    )
                    .lineLimit(1)
                    .opacity(showTapHint ? 1 : 0) // ← ADDED
            }
            .frame(height: 140 * scale)
            .onAppear {   // ← ADDED
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(
                        .easeInOut(duration: 1.2)
                        .repeatForever(autoreverses: true)
                    ) {
                        showTapHint = true
                    }
                }
            }
        }
        .frame(height: 150)
    }
    
    
    // MARK: - Subtitle Helper
    private func storySubtitle(for title: String) -> String {
        switch title {
        case "The Extra Sandwich":
            return "A story about sharing."
        case "The Brave Little Wave":
            return "A story about courage."
        case "The Sunset Promise":
            return "A story about friendship."
        default:
            return "A heartwarming story."
        }
    }
}

#Preview {
    VStack(spacing: 40) {
        StoryCardView(story: StoryData.stories[0])
        StoryCardView(story: StoryData.stories[1])
        StoryCardView(story: StoryData.stories[2])
    }
    .padding()
    .background(Color(red: 227/255, green: 242/255, blue: 255/255))
}

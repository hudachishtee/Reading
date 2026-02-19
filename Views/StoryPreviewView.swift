import SwiftUI

struct StoryPreviewView: View {
    
    let story: Story
    
    var body: some View {
        
        GeometryReader { geo in
            
            let isIpad = geo.size.width > 600
            let contentWidth: CGFloat = isIpad ? 600 : geo.size.width * 0.85
            
            VStack {
                
                Spacer()
                
                VStack(spacing: isIpad ? 60 : 40) {
                    
                    // MARK: Title Box
                    Text(story.title)
                        .font(.custom("OpenDyslexic-Bold",
                                      size: isIpad ? 31 : 21))
                        .foregroundColor(Color(red: 47/255,
                                               green: 93/255,
                                               blue: 98/255))
                        .padding(.vertical, isIpad ? 25 : 18)
                        .frame(maxWidth: .infinity)
                        .lineLimit(1)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(red: 228/255,
                                            green: 248/255,
                                            blue: 235/255))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(red: 130/255,
                                                      green: 182/255,
                                                      blue: 147/255),
                                                lineWidth: 1.5)
                                )
                        )
                    
                    // MARK: Cover Image
                    Image(story.coverImage)
                        .resizable()
                        .scaledToFill()
                        .frame(height: isIpad ? 380 : 250)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 25,
                                             style: .continuous)
                        )
                    
                    // MARK: Start Button
                    NavigationLink {
                        StoryReaderView(story: story)
                    } label: {
                        Text("Start Reading")
                            .font(.custom("OpenDyslexic-Regular",
                                          size: isIpad ? 24 : 18))
                            .foregroundColor(.black)
                            .padding(.vertical, isIpad ? 18 : 14)
                            .padding(.horizontal, isIpad ? 60 : 40)
                            .background(
                                Capsule()
                                    .fill(Color(red: 228/255,
                                                green: 248/255,
                                                blue: 235/255))
                                    .overlay(
                                        Capsule()
                                            .stroke(Color(red: 130/255,
                                                          green: 182/255,
                                                          blue: 147/255),
                                                    lineWidth: 1.5)
                                    )
                            )
                    }
                }
                .frame(width: contentWidth)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color(red: 227/255,
                          green: 242/255,
                          blue: 255/255))
        .ignoresSafeArea()
    }

}

#Preview {
    NavigationStack {
        StoryPreviewView(
            story: StoryData.stories[0]
        )
    }
}

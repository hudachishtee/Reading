import SwiftUI

struct StoryCardView: View {
    
    let story: Story
    
    var body: some View {
        
        HStack(spacing: 15) {
            
            Image(story.coverImage)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Text(story.title)
                .font(.custom("OpenDyslexic-Regular", size: 18))
                .multilineTextAlignment(.leading)
            
            Spacer()
        }
        .padding()
        .background(Color.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 2)
    }
}

#Preview {
    StoryCardView(story: StoryData.stories[0])
        .padding()
        .background(Color.appBackground)
}

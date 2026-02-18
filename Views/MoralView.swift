import SwiftUI

struct MoralView: View {
    
    let story: Story
    
    var body: some View {
        VStack {
            
            Text("Moral of the Story")
                .font(.custom("OpenDyslexic-Bold", size: 28))
            
            Text(story.moral)
                .font(.custom("OpenDyslexic-Regular", size: 22))
                .lineSpacing(8)
                .padding()
        }
        .padding()
    }
}

#Preview {
    MoralView(story: StoryData.stories[0])
}

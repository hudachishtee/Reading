import SwiftUI

struct StoryReaderView: View {
    
    let story: Story
    @State private var currentPage = 0
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var isIpad: Bool {
        sizeClass == .regular
    }
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text(story.title)
                .font(.custom("OpenDyslexic-Bold", size: isIpad ? 32 : 24))
            
            Image(story.pages[currentPage].image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: isIpad ? 600 : .infinity)
            
            Text(story.pages[currentPage].text)
                .font(.custom("OpenDyslexic-Regular",
                              size: isIpad ? 26 : 20))
                .lineSpacing(8)
                .padding(isIpad ? 40 : 20)
            
            HStack {
                Button("Previous") {
                    if currentPage > 0 { currentPage -= 1 }
                }
                
                Spacer()
                
                Button("Next") {
                    if currentPage < story.pages.count - 1 {
                        currentPage += 1
                    }
                }
            }
            .padding(.horizontal)
            
            NavigationLink("View Moral") {
                MoralView(story: story)
            }
            
            NavigationLink("Vocabulary of the Week") {
                VocabularyView(story: story)
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        StoryReaderView(story: StoryData.stories[0])
    }
}

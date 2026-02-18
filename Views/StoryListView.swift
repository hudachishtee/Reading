import SwiftUI

struct StoryListView: View {
    
    let stories = StoryData.stories
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                ForEach(stories) { story in
                    NavigationLink(destination: StoryReaderView(story: story)) {
                        StoryCardView(story: story)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Choose A Story")
    }
}

#Preview {
    NavigationStack {
        StoryListView()
    }
}

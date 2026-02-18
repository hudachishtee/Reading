import SwiftUI

struct VocabularyView: View {
    
    let story: Story
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                
                Text("Vocabulary of the Week")
                    .font(.custom("OpenDyslexic-Bold", size: 28))
                
                ForEach(story.vocabulary) { item in
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text(item.word)
                            .font(.custom("OpenDyslexic-Bold", size: 22))
                        
                        Text(item.meaning)
                            .font(.custom("OpenDyslexic-Regular", size: 18))
                        
                        Text("“\(item.example)”")
                            .font(.custom("OpenDyslexic-Regular", size: 16))
                            .foregroundStyle(.gray)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.cardBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 2)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appBackground)
    }
}

#Preview {
    VocabularyView(story: StoryData.stories[0])
}

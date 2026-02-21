import SwiftUI

struct StoryListView: View {
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 50) {
                
                // MARK: Header
                Text("Choose A Story")
                    .font(.custom("OpenDyslexic-Bold", size: 28))
                    .foregroundColor(Color(red: 47/255, green: 93/255, blue: 98/255))
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color(red: 228/255, green: 248/255, blue: 235/255))
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color(red: 130/255,
                                                  green: 182/255,
                                                  blue: 147/255),
                                            lineWidth: 1.2)
                            )
                    )
                    .padding(.top, 50)
                    .padding(.horizontal)
                
                // MARK: Story Cards
                VStack(spacing: 35) {
                    ForEach(StoryData.stories) { story in
                        
                        NavigationLink {
                            StoryPreviewView(story: story)
                        } label: {
                            StoryCardView(story: story)
                                .scaleEffect(1.08)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
                
                Spacer(minLength: 40)
            }
        }
        .background(Color.appBackground)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        StoryListView()
    }
}

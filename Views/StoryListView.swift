import SwiftUI

struct StoryListView: View {
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 80) {
                
                // Custom Header
                Text("Choose A Story")
                    .font(.custom("OpenDyslexic-Bold", size: 26))
                    .foregroundColor(Color(red: 47/255, green: 93/255, blue: 98/255))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(red: 228/255, green: 248/255, blue: 235/255))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(red: 130/255,
                                                  green: 182/255,
                                                  blue: 147/255),
                                            lineWidth: 1)
                            )
                    )
                    .padding(.horizontal)
            
                // Story Cards
                VStack(spacing: 25) {
                    ForEach(StoryData.stories) { story in
                        
                        NavigationLink {
                            // 🔥 Now goes to Preview Screen
                            StoryPreviewView(story: story)
                        } label: {
                            StoryCardView(story: story)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
                
                Spacer(minLength: 40)
            }
        }
        .background(Color.appBackground)
        .navigationBarBackButtonHidden(false)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        StoryListView()
    }
}

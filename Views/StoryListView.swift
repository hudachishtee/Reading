import SwiftUI

struct StoryListView: View {
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var isIpad: Bool {
        sizeClass == .regular
    }
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: isIpad ? 60 : 50) {
                
                // MARK: Header
                Text("Choose A Story")
                    .font(.custom("OpenDyslexic-Bold",
                                  size: isIpad ? 36 : 28))
                    .foregroundColor(Color(red: 47/255,
                                           green: 93/255,
                                           blue: 98/255))
                    .padding(.vertical, isIpad ? 24 : 18)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color(red: 228/255,
                                        green: 248/255,
                                        blue: 235/255))
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color(red: 130/255,
                                                  green: 182/255,
                                                  blue: 147/255),
                                            lineWidth: 1.2)
                            )
                    )
                    .padding(.top, isIpad ? 70 : 50)
                    .padding(.horizontal, isIpad ? 200 : 20)
                
                // MARK: Story Cards
                VStack(spacing: isIpad ? 150 : 5) {
                    
                    ForEach(StoryData.stories) { story in
                        
                        NavigationLink {
                            StoryPreviewView(story: story)
                        } label: {
                            
                            StoryCardView(story: story)
                                .frame(maxWidth: isIpad ? 750 : .infinity)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, isIpad ? 100 : 20)
                
                Spacer(minLength: 60)
            }
            .frame(maxWidth: .infinity)
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

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                Image("owl")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                
//                Text("Reading Adventures")
//                    .font(.custom("OpenDyslexic-Bold", size: 28))
//                
//                Text("A Dyslexia Storybook App")
//                    .font(.custom("OpenDyslexic-Regular", size: 16))
//                    .foregroundColor(.gray)
                
                Spacer()
                
                NavigationLink("Start") {
                    StoryListView()
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}

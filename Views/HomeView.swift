import SwiftUI

struct HomeView: View {
    
    @State private var navigate = false
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.appBackground
                    .ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                    
                    Image("owl")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .opacity(navigate ? 0 : 1)
                        .animation(.easeInOut(duration: 0.5), value: navigate)
                    
                    Spacer()
                }
                
                // Hidden NavigationLink
                NavigationLink(
                    destination: StoryListView(),
                    isActive: $navigate
                ) {
                    EmptyView()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    navigate = true
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

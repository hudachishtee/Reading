import SwiftUI

struct HomeView: View {
    
    @State private var navigate = false
    @State private var scale: CGFloat = 0.5
    @State private var opacity: Double = 0
    
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
                        .scaleEffect(scale)
                        .opacity(opacity)
                    
                    Spacer()
                }
            }
            .onAppear {
                
                // Entrance animation
                withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
                    scale = 1
                    opacity = 1
                }
                
                // Navigate after animation
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                    navigate = true
                }
            }
            .navigationDestination(isPresented: $navigate) {
                StoryListView()
            }
        }
    }
}

#Preview {
    HomeView()
}

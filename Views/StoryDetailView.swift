////
////  StoryDetailView.swift
////  Reading
////
////  Created by Huda Chishtee on 19/02/2026.
////
//
//import SwiftUI
//
//struct StoryDetailView: View {
//    
//    let story: Story
//    @State private var currentPage = 0
//    
//    var body: some View {
//        
//        VStack {
//            
//            TabView(selection: $currentPage) {
//                ForEach(story.pages) { page in
//                    
//                    VStack(spacing: 20) {
//                        
//                        Image(page.image) // ✅ FIXED HERE
//                            .resizable()
//                            .scaledToFit()
//                            .frame(maxHeight: 300)
//                        
//                        Text(page.text)
//                            .font(.custom("OpenDyslexic-Regular", size: 20))
//                            .padding()
//                    }
//                    .tag(page.id)
//                    .padding()
//                }
//            }
//            .tabViewStyle(.page)
//            
//            Spacer()
//            
//            // Vocabulary Button
//            NavigationLink {
//                VocabularyView(story: story)
//            } label: {
//                Text("Vocabulary of the Week")
//                    .font(.custom("OpenDyslexic-Bold", size: 18))
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.cardBackground)
//                    .clipShape(RoundedRectangle(cornerRadius: 20))
//                    .shadow(radius: 2)
//            }
//            .padding()
//        }
//        .background(Color.appBackground)
//        .navigationBarTitleDisplayMode(.inline)
//    }
//}
//
//#Preview {
//    NavigationStack {
//        StoryDetailView(story: StoryData.stories[0])
//    }
//}

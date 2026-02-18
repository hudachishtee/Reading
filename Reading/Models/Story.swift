import Foundation

struct Story: Identifiable {
    let id = UUID()
    let title: String
    let coverImage: String
    let pages: [StoryPage]
    let moral: String
    let vocabulary: [VocabularyItem]
}

struct StoryPage: Identifiable {
    let id = UUID()
    let image: String
    let text: String
}

struct VocabularyItem: Identifiable {
    let id = UUID()
    let word: String
    let meaning: String
    let example: String
}

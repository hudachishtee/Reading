import Foundation

struct StoryData {
    
    static let stories: [Story] = [
        
        Story(
            title: "The Extra Sandwich",
            coverImage: "sandwich_cover",
            pages: [
                StoryPage(image: "story1_page1",
                          text: "Nora packed two sandwiches today. She did not know why. It just felt right."),
                StoryPage(image: "story1_page2",
                          text: "At school, a boy sat alone. He looked at her sandwich."),
                StoryPage(image: "story1_page3",
                          text: "She shared the extra sandwich. The boy smiled and said thank you.")
            ],
            moral: "A small kindness can make a big difference.",
            vocabulary: [
                VocabularyItem(word: "Share",
                               meaning: "To give part to others",
                               example: "She shared her sandwich."),
                VocabularyItem(word: "Kind",
                               meaning: "Caring and helpful",
                               example: "He was kind to his friend.")
            ]
        ),
        
        Story(
            title: "The Brave Little Wave",
            coverImage: "wave_cover",
            pages: [
                StoryPage(image: "story2page1",
                          text: "A little wave lived far out in the ocean."),
                StoryPage(image: "story2page2",
                          text: "The little wave felt scared."),
                StoryPage(image: "story2page3",
                          text: "The little wave rolled toward the shore bravely.")
            ],
            moral: "Being brave means trying even when you feel scared.",
            vocabulary: [
                VocabularyItem(word: "Brave",
                               meaning: "Not giving up even when afraid",
                               example: "She was brave."),
                VocabularyItem(word: "Encourage",
                               meaning: "To help someone feel strong",
                               example: "Friends encourage each other.")
            ]
        ),
        
        Story(
            title: "The Sunset Promise",
            coverImage: "sunset_cover",
            pages: [
                StoryPage(image: "story3page1",
                          text: "Two friends sat by the sea."),
                StoryPage(image: "story3page2",
                          text: "They promised to meet again tomorrow."),
                StoryPage(image: "story3page3",
                          text: "Their promise stayed warm in their hearts.")
            ],
            moral: "Friendship and promises stay in your heart.",
            vocabulary: [
                VocabularyItem(word: "Promise",
                               meaning: "Saying you will do something",
                               example: "I promise to come back."),
                VocabularyItem(word: "Friendship",
                               meaning: "Caring and being kind",
                               example: "Friendship makes us happy.")
            ]
        )
    ]
}

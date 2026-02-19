import Foundation

struct StoryData {
    
    static let stories: [Story] = [
        
        // MARK: - Story 1
        Story(
            title: "The Extra Sandwich",
            coverImage: "sandwich_cover",
            pages: [
                StoryPage(
                    image: "story1_page1",
                    text: "Nora packed two sandwiches today. She did not know why. It just felt right.",
                    audioFileName: "story1_page1_audio"
                ),
                StoryPage(
                    image: "story1_page2",
                    text: "At school, a boy sat alone. He looked at her sandwich.",
                    audioFileName: "story1_page2_audio"
                ),
                StoryPage(
                    image: "story1_page3",
                    text: "She shared the extra sandwich. The boy smiled and said thank you.",
                    audioFileName: "story1_page3_audio"
                )
            ],
            moral: "A small kindness can make a big difference.",
            vocabulary: [
                VocabularyItem(
                    word: "Share",
                    meaning: "To give part to others",
                    example: "She shared her sandwich."
                ),
                VocabularyItem(
                    word: "Kind",
                    meaning: "Caring and helpful",
                    example: "He was kind to his friend."
                )
            ]
        ),
        
        
        // MARK: - Story 2
        Story(
            title: "The Brave Little Wave",
            coverImage: "wave_cover",
            pages: [
                StoryPage(
                    image: "story2page1",
                    text: "A little wave lived far out in the ocean.",
                    audioFileName: "story2_page1_audio"
                ),
                StoryPage(
                    image: "story2page2",
                    text: "The little wave felt scared.",
                    audioFileName: "story2_page2_audio"
                ),
                StoryPage(
                    image: "story2page3",
                    text: "The little wave rolled toward the shore bravely.",
                    audioFileName: "story2_page3_audio"
                )
            ],
            moral: "Being brave means trying even when you feel scared.",
            vocabulary: [
                VocabularyItem(
                    word: "Brave",
                    meaning: "Not giving up even when afraid",
                    example: "She was brave."
                ),
                VocabularyItem(
                    word: "Encourage",
                    meaning: "To help someone feel strong",
                    example: "Friends encourage each other."
                )
            ]
        ),
        
        
        // MARK: - Story 3
        Story(
            title: "The Sunset Promise",
            coverImage: "sunset_cover",
            pages: [
                StoryPage(
                    image: "story3page1",
                    text: "Two friends sat by the sea.",
                    audioFileName: "story3_page1_audio"
                ),
                StoryPage(
                    image: "story3page2",
                    text: "They promised to meet again tomorrow.",
                    audioFileName: "story3_page2_audio"
                ),
                StoryPage(
                    image: "story3page3",
                    text: "Their promise stayed warm in their hearts.",
                    audioFileName: "story3_page3_audio"
                )
            ],
            moral: "Friendship and promises stay in your heart.",
            vocabulary: [
                VocabularyItem(
                    word: "Promise",
                    meaning: "Saying you will do something",
                    example: "I promise to come back."
                ),
                VocabularyItem(
                    word: "Friendship",
                    meaning: "Caring and being kind",
                    example: "Friendship makes us happy."
                )
            ]
        )
    ]
}

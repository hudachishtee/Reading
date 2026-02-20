//
//  AudioManager.swift
//  Reading
//
//  Created by Huda Chishtee on 20/02/2026.
//

import AVFoundation

class AudioManager {
    
    static let shared = AudioManager()
    private var player: AVAudioPlayer?
    
    func playSound(named fileName: String) {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            print("Audio file not found: \(fileName)")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
    
    func stop() {
        player?.stop()
    }
}

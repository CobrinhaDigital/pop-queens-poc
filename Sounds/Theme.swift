//
//  Theme.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 23/02/25.
//
import SwiftUI
import AVFoundation

class AudioManager {
    @MainActor static let shared = AudioManager() 
    
    private var audioPlayer: AVAudioPlayer?
    
    private init() {}
    
    func playAudio() {
        guard let url = Bundle.main.url(forResource: "Girl Pop Attitude", withExtension: "mp3") else {
            print("Audio file not found")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
}

struct PlayAudioButton: View {
    @State private var audioPlayer: AVAudioPlayer?
    @State private var playing = false

    var body: some View {
        Button {
            if playing {
                stopAudio()
            } else {
                playAudio()
            }
            
            playing.toggle()
        } label: {
            HStack {
                Image(systemName: playing ? "stop.circle.fill" : "play.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                Text(playing ? "Stop audio" : "Play Audio")
                    .font(.headline)
                    .foregroundColor(.blue)
            }
            .padding()
        }
    }

    func playAudio() {
        guard let url = Bundle.main.url(forResource: "Girl Pop Attitude", withExtension: "mp3") else {
            print("Audio file not found")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
    
    func stopAudio() {
        audioPlayer?.stop()
    }
}

struct PlayAudioButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayAudioButton()
    }
}

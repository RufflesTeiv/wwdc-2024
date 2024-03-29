//
//  SoundController.swift
//
//
//  Created by Rafa (Ruffles) on 26/02/24.
//

import Foundation
import AVFoundation
import SwiftUI

class SoundController : NSObject, AVAudioPlayerDelegate {
    static var shared: SoundController = {
        let instance = SoundController()
        return instance
    }()
    
    private var audioPlayerPool : [AVAudioPlayer] = []
    private var busyAudioPlayers : [AVAudioPlayer] = []
    
    override init() {
        super.init()
    }
    
    private func getAudioPlayer(sound: Sound) -> AVAudioPlayer? {
        if !audioPlayerPool.isEmpty {
            return audioPlayerPool.removeFirst()
        }
        
        guard let url = Bundle.main.url(
            forResource: sound.rawValue,
            withExtension: ".wav"
        ) else {
            print("Fail to get url for \(sound)")
            return nil
        }
        
        var audioPlayer: AVAudioPlayer?
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            return audioPlayer
        } catch {
            print("Fail to load \(sound)")
            return nil
        }
    }
    
    func playSound(sound: Sound) {
        guard let player = getAudioPlayer(sound: sound) else {
            return
        }
        player.play()
        player.delegate = self
        busyAudioPlayers.append(player)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        busyAudioPlayers.removeAll(where: {$0 == player})
        audioPlayerPool.append(player)
    }
    
    enum Sound: String, CaseIterable {
        case bookFlip2
    }
}


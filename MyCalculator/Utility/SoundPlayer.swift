//
//  SoundPlayer.swift
//  MyCalculator
//
//  Created by IS 543 on 9/26/24.
//

import Foundation
import AVFoundation

struct SoundPlayer {
    var player: AVAudioPlayer?

    mutating func playSound(named soundName: String) async {
        guard let path = Bundle.main.path(forResource: soundName, ofType: nil) else {
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            player?.play()
        } catch {
            //Don't play if error
        }
    }
}

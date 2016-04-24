//
//  Speech.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/25.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation
import AVFoundation

@objc(Speech)
class Speech: NSObject, ActionProtocol {
    
    var standbyViewController:StandbyViewController?
    
    internal func run(actionSettings: Dictionary<String, AnyObject>, standbyViewController: StandbyViewController) {
        self.standbyViewController = standbyViewController
        let actionSettings = SpeechSettings(properties: actionSettings)
        let talker = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: actionSettings.words)
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        talker.speakUtterance(utterance)
    }
    
    internal func stop() {
        standbyViewController?.stopAction()
    }
}
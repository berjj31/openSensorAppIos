//
//  AudioPlay.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/04.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation
import MediaPlayer

@objc(PlayAudio)
class PlayAudio: NSObject, ActionProtocol, AVAudioPlayerDelegate {
    
    var standbyViewController:StandbyViewController?
    var audio: AVAudioPlayer?
    
    internal func run(actionSettings: Dictionary<String, AnyObject>, standbyViewController: StandbyViewController) {
        self.standbyViewController = standbyViewController
        let intSongId = actionSettings["mediaItemPersistentID"] as! Int
        let item: MPMediaItem = getMediaItemBySongId(intSongId as NSNumber)
        let url: NSURL = item.valueForProperty(MPMediaItemPropertyAssetURL) as! NSURL
        do {
            audio = try AVAudioPlayer(contentsOfURL: url, fileTypeHint: nil)
            audio?.delegate = self
            audio!.play()
        } catch {
            print(error)
        }
    }
    
    internal func getMediaItemBySongId(songId : NSNumber) -> MPMediaItem {
        let property: MPMediaPropertyPredicate = MPMediaPropertyPredicate(value: songId, forProperty: MPMediaItemPropertyPersistentID)
        let query: MPMediaQuery = MPMediaQuery()
        query.addFilterPredicate(property)
        let items: [MPMediaItem] = query.items! as [MPMediaItem]
        return items[items.count - 1]
    }

    internal func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        stop()
    }
    
    internal func stop() {
        standbyViewController?.stopAction()
    }
}
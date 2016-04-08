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
    
    internal func run(actionSettings: Dictionary<String, AnyObject>, standbyViewController: StandbyViewController) throws {
        self.standbyViewController = standbyViewController
        let stringSongId = actionSettings["mediaItemPersistentID"] as! String
        let songId = NSNumber(unsignedLongLong: UInt64(stringSongId)!) as NSNumber
        let item: MPMediaItem = getMediaItemBySongId(songId)
        if item.cloudItem {
            let userInfo: [NSObject: AnyObject] = [NSLocalizedDescriptionKey: "audio on cloud"]
            throw NSError.init(domain: "PlayAudio", code: -1, userInfo: userInfo)
        }
        if item.protectedAsset {
            let userInfo: [NSObject: AnyObject] = [NSLocalizedDescriptionKey: "DRM protected audio"]
            throw NSError.init(domain: "PlayAudio", code: -2, userInfo: userInfo)
        }
        let url: NSURL = item.valueForProperty(MPMediaItemPropertyAssetURL) as! NSURL
        do {
            audio = try AVAudioPlayer(contentsOfURL: url, fileTypeHint: nil)
            audio?.delegate = self
            audio!.play()
        } catch {
            throw error
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
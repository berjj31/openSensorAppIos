//
//  PlayAudioSettings.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/20.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation

struct PlayAudioSettings: ActionSettingsProtocol {
    let actionName: String
    let actionSettingDisplayName: String
    let mediaItemPersistentID: String
}

extension PlayAudioSettings {
    
    init(properties: Dictionary<String, AnyObject>) {
        self.init(
            actionName : properties["actionName"] as! String,
            actionSettingDisplayName : properties["actionSettingDisplayName"] as! String,
            mediaItemPersistentID : properties["mediaItemPersistentID"] as! String
        )
    }
    
    func toDictionary() -> Dictionary<String, AnyObject> {
        return [
            "actionName" : actionName,
            "actionSettingDisplayName" : actionSettingDisplayName,
            "mediaItemPersistentID": mediaItemPersistentID,
        ]
    }
    
}
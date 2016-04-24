//
//  SpeechSettings.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/25.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation
struct SpeechSettings: ActionSettingsProtocol {
    let actionName: String
    let actionSettingDisplayName: String
    let words: String
}

extension SpeechSettings {
    
    init(properties: Dictionary<String, AnyObject>) {
        self.init(
            actionName : properties["actionName"] as! String,
            actionSettingDisplayName : properties["actionSettingDisplayName"] as! String,
            words : properties["words"] as! String
        )
    }
    
    func toDictionary() -> Dictionary<String, AnyObject> {
        return [
            "actionName" : actionName,
            "actionSettingDisplayName" : actionSettingDisplayName,
            "words": words,
        ]
    }
    
}
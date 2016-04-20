//
//  OpenUrlSettings.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/20.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation

struct OpenUrlSettings: ActionSettingsProtocol {
    let actionName: String
    let actionSettingDisplayName: String
    let url: String
}

extension OpenUrlSettings {
    
    init(properties: Dictionary<String, AnyObject>) {
        self.init(
            actionName : properties["actionName"] as! String,
            actionSettingDisplayName : properties["actionSettingDisplayName"] as! String,
            url : properties["url"] as! String
        )
    }
    
    func toDictionary() -> Dictionary<String, AnyObject> {
        return [
            "actionName" : actionName,
            "actionSettingDisplayName" : actionSettingDisplayName,
            "url": url,
        ]
    }
    
}
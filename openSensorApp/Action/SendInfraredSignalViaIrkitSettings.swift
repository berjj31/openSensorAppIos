//
//  SendInfraredSignalViaIrkitSettings.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/27.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation
struct SendInfraredSignalViaIrkitSettings: ActionSettingsProtocol {
    let actionName: String
    let actionSettingDisplayName: String
    let serverName: String
    let infraredSignalJson: String
}

extension SendInfraredSignalViaIrkitSettings {
    
    init(properties: Dictionary<String, AnyObject>) {
        self.init(
            actionName : properties["actionName"] as! String,
            actionSettingDisplayName : properties["actionSettingDisplayName"] as! String,
            serverName : properties["serverName"] as! String,
            infraredSignalJson : properties["infraredSignalJson"] as! String
        )
    }
    
    func toDictionary() -> Dictionary<String, AnyObject> {
        return [
            "actionName" : actionName,
            "actionSettingDisplayName" : actionSettingDisplayName,
            "serverName": serverName,
            "infraredSignalJson": infraredSignalJson
        ]
    }
    
}
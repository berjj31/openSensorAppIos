//
//  ShakeSettings.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/20.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation

struct ShakeSettings: SensorSettingsProtocol {
    let sensorName: String
    let sensorSettingDisplayName: String
}

extension ShakeSettings {
    
    init(properties: Dictionary<String, AnyObject>) {
        self.init(
            sensorName : properties["sensorName"] as! String,
            sensorSettingDisplayName : properties["sensorSettingDisplayName"] as! String
        )
    }
    
    func toDictionary() -> Dictionary<String, AnyObject> {
        return [
            "sensorName" : sensorName,
            "sensorSettingDisplayName" : sensorSettingDisplayName,
        ]
    }
}
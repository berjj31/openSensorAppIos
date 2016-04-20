//
//  HttpReachabilitySettings.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/20.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation

struct HttpReachabilitySettings: SensorSettingsProtocol {
    let sensorName: String
    let sensorSettingDisplayName: String
    let url: String
}

extension HttpReachabilitySettings {
    
    init(properties: Dictionary<String, AnyObject>) {
        self.init(
            sensorName : properties["sensorName"] as! String,
            sensorSettingDisplayName : properties["sensorSettingDisplayName"] as! String,
            url : properties["url"] as! String
        )
    }
    
    func toDictionary() -> Dictionary<String, AnyObject> {
        return [
            "sensorName" : sensorName,
            "sensorSettingDisplayName" : sensorSettingDisplayName,
            "url": url,
        ]
    }
    
}
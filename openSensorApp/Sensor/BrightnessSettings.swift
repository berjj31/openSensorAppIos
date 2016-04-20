//
//  BrightnessSettings.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/20.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation

struct BrightnessSettings: SensorSettingsProtocol {
    let sensorName: String
    let sensorSettingDisplayName: String
    let threshold: Float
    let detectionRight: Bool
}

extension BrightnessSettings {
    
    init(properties: Dictionary<String, AnyObject>) {
        self.init(
            sensorName : properties["sensorName"] as! String,
            sensorSettingDisplayName : properties["sensorSettingDisplayName"] as! String,
            threshold : properties["threshold"] as! Float,
            detectionRight : properties["detectionRight"] as! Bool
        )
    }
    
    func toDictionary() -> Dictionary<String, AnyObject> {
        return [
            "sensorName" : sensorName,
            "sensorSettingDisplayName" : sensorSettingDisplayName,
            "threshold" : threshold,
            "detectionRight" : detectionRight,
        ]
    }
    
}
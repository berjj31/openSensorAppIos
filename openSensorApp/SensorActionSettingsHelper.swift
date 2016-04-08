//
//  SensorActionSettingsHelper.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/04.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation

class SensorActionSettingsHelper {
    
    static let settingsFileName = "sensorActionSettings"
    
    static func getSettingFilePath() -> String {
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
        return path.stringByAppendingPathComponent(settingsFileName)
    }
    
    static func read() -> Array<Dictionary<String, AnyObject>> {
        let data = NSKeyedUnarchiver.unarchiveObjectWithFile(getSettingFilePath())
        if (data == nil) {
            return []
        }
        return data as! Array<Dictionary<String, AnyObject>>
    }
    
    static func write(newSensorActionSettings: Array<Dictionary<String, AnyObject>>) {
        NSKeyedArchiver.archiveRootObject(newSensorActionSettings, toFile: getSettingFilePath())
    }
}
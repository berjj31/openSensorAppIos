//
//  Brightness.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/04.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation
import UIKit

@objc(Brightness)
class Brightness: NSObject, SensorProtocol {
    
    var standbyViewController: StandbyViewController?
    var sensorActionSettings: Array<Dictionary<String, AnyObject>> = []
    
    internal func startup(sensorActionIndex: Int, sensorActionSetting: Dictionary<String, AnyObject>, standbyViewController: StandbyViewController) throws {
        self.standbyViewController = standbyViewController
        self.sensorActionSettings.append(sensorActionSetting)
        if (self.sensorActionSettings.count == 1) {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(Brightness.callback(_:)), name: UIScreenBrightnessDidChangeNotification, object: nil)
        }
    }
    
    internal func stop() {
        self.sensorActionSettings = []
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIScreenBrightnessDidChangeNotification, object: nil)
    }
    
    @objc
    internal func callback(notification: NSNotification) {
        for sensorActionSetting in self.sensorActionSettings {
            let sensorSetting = sensorActionSetting["sensorSetting"]
            let threshold = sensorSetting!["threshold"] as! Float
            let detectionRight = sensorSetting!["detectionRight"] as! Bool
            if (detect(Float(UIScreen.mainScreen().brightness), threshold: threshold, detectionRight: detectionRight)) {
                standbyViewController!.dispatchAction(sensorActionSetting)
            }
        }
    }
    
    internal func detect(value: Float, threshold: Float, detectionRight: Bool) -> Bool {
        if (detectionRight) {
            return (value >= threshold) ? true : false
        }
        return (value <= threshold) ? true : false
    }
}
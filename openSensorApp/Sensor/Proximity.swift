//
//  Proximity.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/08.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation
import UIKit

@objc(Proximity)
class Proximity: NSObject, SensorProtocol {
    
    var standbyViewController: StandbyViewController?
    var sensorActionSettings: Array<Dictionary<String, AnyObject>> = []
    
    internal func startup(sensorActionIndex: Int, sensorActionSetting: Dictionary<String, AnyObject>, standbyViewController: StandbyViewController) throws {
        self.standbyViewController = standbyViewController
        self.sensorActionSettings.append(sensorActionSetting)
        if (self.sensorActionSettings.count == 1) {
            UIDevice.currentDevice().proximityMonitoringEnabled = true
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(Proximity.callback(_:)), name: UIDeviceProximityStateDidChangeNotification, object: nil)
        }
    }
    
    internal func stop() {
        self.sensorActionSettings = []
        UIDevice.currentDevice().proximityMonitoringEnabled = false
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIDeviceProximityStateDidChangeNotification, object: nil)
    }
    
    @objc
    internal func callback(notification: NSNotification) {
        if (UIDevice.currentDevice().proximityState) {
            for sensorActionSetting in self.sensorActionSettings {
                    standbyViewController!.dispatchAction(sensorActionSetting)
            }
        }
    }
}
//
//  Shake.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/08.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation
import UIKit

@objc(Shake)
class Shake: NSObject, SensorProtocol {
    
    var standbyViewController: StandbyViewController?
    var sensorActionSettings: Array<Dictionary<String, Dictionary<String, AnyObject>>> = []
    var firstResponderDummy: ShakeFirstResponderDummy?
    
    internal func startup(sensorActionIndex: Int, sensorActionSetting: Dictionary<String, Dictionary<String, AnyObject>>, standbyViewController: StandbyViewController) throws {
        self.standbyViewController = standbyViewController
        self.sensorActionSettings.append(sensorActionSetting)
        if (self.sensorActionSettings.count == 1) {
            firstResponderDummy = ShakeFirstResponderDummy(frame: CGRectMake(0, 0, 1, 1))
            firstResponderDummy?.delegate = self
            firstResponderDummy?.becomeFirstResponder()
            standbyViewController.view.addSubview(firstResponderDummy!)
        }
    }
    
    internal func stop() {
        self.sensorActionSettings = []
        firstResponderDummy?.removeFromSuperview()
    }
    
    @objc
    internal func callback() {
        for sensorActionSetting in self.sensorActionSettings {
            standbyViewController!.dispatchAction(sensorActionSetting)
        }
    }
}
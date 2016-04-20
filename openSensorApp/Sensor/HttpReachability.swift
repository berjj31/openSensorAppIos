//
//  HttpStatusCode.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/08.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation
import UIKit

@objc(HttpReachability)
class HttpReachability: NSObject, SensorProtocol {
    
    var standbyViewController: StandbyViewController?
    var sensorActionSettings: Array<Dictionary<String, Dictionary<String, AnyObject>>> = []
    var timers: Array<NSTimer> = []
    var callbackSensorActionSetting: Dictionary<String, Dictionary<String, AnyObject>> = [:]
    
    internal func startup(sensorActionIndex: Int, sensorActionSetting: Dictionary<String, Dictionary<String, AnyObject>>, standbyViewController: StandbyViewController) throws {
        self.standbyViewController = standbyViewController
        self.sensorActionSettings.append(sensorActionSetting)
        let userInfo = sensorActionSetting
        self.timers.append(NSTimer.scheduledTimerWithTimeInterval(60.0, target: self, selector: #selector(HttpReachability.httpRequest(_:)), userInfo: userInfo, repeats: true))
    }
    
    internal func httpRequest(timer: NSTimer) {
        let userInfo = timer.userInfo as! Dictionary<String, Dictionary<String, AnyObject>>
        let sensorSettings =  HttpReachabilitySettings(properties: userInfo["sensorSetting"]!)
        let request = NSMutableURLRequest(URL: NSURL(string: sensorSettings.url)!)
        request.HTTPMethod = "GET"
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {
            data, response, error in
            if (error != nil) {
                self.callbackSensorActionSetting = userInfo
                self.callback()
            }
        })
        task.resume()
    }
    
    internal func stop() {
        callbackSensorActionSetting = [:]
        sensorActionSettings = []
        for timer in timers {
            timer.invalidate()
        }
        timers = []
    }
    
    @objc
    internal func callback() {
        standbyViewController!.dispatchAction(callbackSensorActionSetting)
    }
}
//
//  SendInfraredSignalViaIrkit.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/27.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation

@objc(SendInfraredSignalViaIrkit)
class SendInfraredSignalViaIrkit: NSObject, ActionProtocol {
    
    var standbyViewController:StandbyViewController?
    
    internal func run(actionSettings: Dictionary<String, AnyObject>, standbyViewController: StandbyViewController) {
        self.standbyViewController = standbyViewController
        let actionSettings = SendInfraredSignalViaIrkitSettings(properties: actionSettings)
        request(actionSettings.serverName, infraredSignalJson: actionSettings.infraredSignalJson)
    }
    
    internal func request(serverName: String, infraredSignalJson: String) {
        let request = NSMutableURLRequest(URL: NSURL(string: "http://" + serverName + "/messages")!)
        request.addValue("openSensorApp", forHTTPHeaderField: "X-Requested-With")
        request.HTTPMethod = "POST"
        request.HTTPBody = infraredSignalJson.dataUsingEncoding(NSUTF8StringEncoding)
        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {
            data, response, error in
        }).resume()
    }
    
    internal func stop() {
        standbyViewController?.stopAction()
    }
}
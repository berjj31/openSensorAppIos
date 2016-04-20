//
//  OpenWebBrowser.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/09.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation
import UIKit

@objc(OpenUrl)
class OpenUrl: NSObject, ActionProtocol {
    
    var standbyViewController:StandbyViewController?
    
    internal func run(actionSettings: Dictionary<String, AnyObject>, standbyViewController: StandbyViewController) {
        self.standbyViewController = standbyViewController
        let actionSettings = OpenUrlSettings(properties: actionSettings)
        let url = NSURL(string: actionSettings.url)!
        if UIApplication.sharedApplication().canOpenURL(url) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    internal func stop() {
        standbyViewController?.stopAction()
    }
}
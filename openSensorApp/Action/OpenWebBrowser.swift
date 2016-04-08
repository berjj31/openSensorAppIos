//
//  OpenWebView.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/09.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation
import UIKit

@objc(OpenWebBrowser)
class OpenWebBrowser: NSObject, ActionProtocol {
    
    var standbyViewController:StandbyViewController?
    
    internal func run(actionSettings: Dictionary<String, AnyObject>, standbyViewController: StandbyViewController) {
        self.standbyViewController = standbyViewController
        let stringUrl = actionSettings["url"] as! String
        let url = NSURL(string: stringUrl)!
        if UIApplication.sharedApplication().canOpenURL(url) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    internal func stop() {
        standbyViewController?.stopAction()
    }
}
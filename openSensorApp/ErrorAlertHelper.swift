//
//  ErrorAlertHelper.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/05.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation
import UIKit

class ErrorAlertHelper {
    
    static func show(error: NSError, parentViewController: UIViewController) {
        let alertController = UIAlertController(title: error.localizedDescription, message: error.localizedFailureReason, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
            print(error.localizedDescription)
            print(error.localizedFailureReason)
            })
        
        parentViewController.presentViewController(alertController, animated: true, completion: nil)
    }
    
}
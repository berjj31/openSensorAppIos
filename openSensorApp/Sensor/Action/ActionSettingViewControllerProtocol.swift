//
//  ActionSettingViewControllerProtocol.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/06.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation
import UIKit

protocol ActionSettingViewControllerProtocol {
    func getActionSettingDisplayName() -> String
    func saveEditingActionSetting(editingActionSetting: Dictionary<String, AnyObject>)
}

extension ActionSettingViewControllerProtocol {
    internal func saveEditingActionSetting(editingActionSetting: Dictionary<String, AnyObject>) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.editingActionSetting = editingActionSetting
    }
}

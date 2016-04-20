//
//  SettingsProtocol.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/20.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation

protocol SettingsProtocol {
    init (properties: Dictionary<String, AnyObject>)
    func toDictionary() -> Dictionary<String, AnyObject>
}
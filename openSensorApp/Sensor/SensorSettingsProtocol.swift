//
//  SensorSettingsProtocol.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/20.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation

protocol SensorSettingsProtocol: SettingsProtocol {
    var sensorName: String {get}
    var sensorSettingDisplayName: String {get}
}
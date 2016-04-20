//
//  ActionSettingsProtocol.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/20.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation

protocol ActionSettingsProtocol: SettingsProtocol {
    var actionName: String {get}
    var actionSettingDisplayName: String {get}
}
//
//  SensorProtocol.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/04.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation

protocol SensorProtocol {
    func startup(sensorActionIndex: Int, sensorActionSetting:Dictionary<String, AnyObject>, standbyViewController: StandbyViewController) throws
    func stop()
}
//
//  ActionProtocol.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/04.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation

protocol ActionProtocol {
    func run(actionSettings:Dictionary<String, AnyObject>, standbyViewController: StandbyViewController) throws
    func stop()
}
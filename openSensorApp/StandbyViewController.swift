//
//  StandbyViewController.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/04.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import UIKit

class StandbyViewController: UIViewController {

    var runningSensors: Dictionary<Int, SensorProtocol> = [:]
    var runningAction: ActionProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        startupSensors()
    }
    
    internal func startupSensors() {
        let sensorActionSettings: Array<Dictionary<String, Dictionary<String, AnyObject>>> = SensorActionSettingsHelper.read();
        for (sensorActionIndex, sensorActionSetting) in sensorActionSettings.enumerate() {
            let sensorSetting = sensorActionSetting["sensorSetting"]
            let sensorName = sensorSetting!["sensorName"] as! String

            let cls = NSClassFromString(sensorName) as! NSObject.Type
            runningSensors[sensorActionIndex] = (cls.init() as! SensorProtocol)
            
            do {
                try runningSensors[sensorActionIndex]!.startup(sensorActionIndex, sensorActionSetting: sensorActionSetting, standbyViewController: self as StandbyViewController)
            } catch let error as NSError {
                ErrorAlertHelper.show(error, parentViewController: self)
            }
        }
    }
    
    internal func stopSensors() {
        let sensorActionSettings: Array<Dictionary<String, Dictionary<String, AnyObject>>> = SensorActionSettingsHelper.read();
        for (sensorActionIndex, _) in sensorActionSettings.enumerate() {
            runningSensors[sensorActionIndex]!.stop()
        }
    }

    internal func dispatchAction(sensorActionSetting: Dictionary<String, AnyObject>) {
        guard runningAction == nil else {
            return
        }
        
        let actionSetting = sensorActionSetting["actionSetting"] as! Dictionary<String, AnyObject>
        let actionName = actionSetting["actionName"] as! String
        let cls = NSClassFromString(actionName) as! NSObject.Type
        runningAction = (cls.init() as! ActionProtocol)
        do {
            try runningAction!.run(actionSetting, standbyViewController: self as StandbyViewController)
        } catch let error as NSError {
            ErrorAlertHelper.show(error, parentViewController: self)
        }
    }
    
    internal func stopAction() {
        runningAction = nil;
    }
    
    @IBAction func settingsButtonTapped() {
        stopAction()
        stopSensors()
        let generalSettingsTableViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("GeneralSettings")
        let navigationController = UINavigationController(rootViewController: generalSettingsTableViewController)
        presentViewController(navigationController, animated: true, completion: nil)
    }

}


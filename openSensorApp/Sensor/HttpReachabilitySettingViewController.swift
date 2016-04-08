//
//  HttpReachabilitySettingViewController.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/08.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import UIKit

@objc(HttpReachabilitySettingViewController)
class HttpReachabilitySettingViewController: UIViewController, SensorSettingViewControllerProtocol {

    @IBOutlet var urlTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        title = "Sensor setting"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
    }
    
    @IBAction func getText(sender: UITextField) {
    }
    
    @IBAction func selectActionButtonTapped() {
        saveEditingSensorSetting([
            "sensorName" : "HttpReachability",
            "sensorSettingDisplayName" : getSensorSettingDisplayName(),
            "url" : urlTextField!.text!
            ])
        navigationController?.pushViewController(SelectActionViewController(), animated: true)
    }
    
    internal func getSensorSettingDisplayName() -> String {
        var displayName = "Not Reachable "
        displayName += urlTextField!.text!
        return displayName
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}

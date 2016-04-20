//
//  SaveSensorActionSettingsViewController.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/05.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import UIKit

class SaveSensorActionSettingsViewController: UIViewController {

    @IBOutlet var sensorSettingDisplayNameLabel: UILabel?
    @IBOutlet var actionSettingDisplayNameLabel: UILabel?
    
    var editingSensorSetting:SensorSettingsProtocol?
    var editingActionSetting:ActionSettingsProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "Save"
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        editingSensorSetting = appDelegate.editingSensorSetting
        editingActionSetting = appDelegate.editingActionSetting
        
        sensorSettingDisplayNameLabel?.text = editingSensorSetting!.sensorName
        actionSettingDisplayNameLabel?.text = editingActionSetting!.actionName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction internal func saveButtonTapped() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.editingSensorSetting = nil
        appDelegate.editingActionSetting = nil
        
        let newSetting = [
            "sensorSetting":editingSensorSetting!.toDictionary(),
            "actionSetting":editingActionSetting!.toDictionary()
        ]
        var currentSettings = SensorActionSettingsHelper.read()
        currentSettings.append(newSetting)
        SensorActionSettingsHelper.write(currentSettings)
        
        navigationController?.popToRootViewControllerAnimated(true)
    }

}

//
//  OpenWebBrowserSettingViewController.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/09.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import UIKit

@objc(OpenUrlSettingViewController)
class OpenUrlSettingViewController: UIViewController, ActionSettingViewControllerProtocol {

    @IBOutlet var urlTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    @IBAction func getText(sender: UITextField) {
    }

    @IBAction func saveSensorActionButtonTapped() {
        saveEditingActionSetting([
            "actionName" : "OpenUrl",
            "actionSettingDisplayName" : getActionSettingDisplayName(),
            "url" : (urlTextField?.text)!
            ])
        navigationController?.pushViewController(SaveSensorActionSettingsViewController(), animated: true)
    }
    
    func getActionSettingDisplayName() -> String {
        return "Open Url " + (urlTextField?.text)!
    }

}

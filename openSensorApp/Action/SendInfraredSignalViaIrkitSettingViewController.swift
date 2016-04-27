//
//  SendInfraredSignalViaIrkitSettingViewController.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/27.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import UIKit

@objc(SendInfraredSignalViaIrkitSettingViewController)
class SendInfraredSignalViaIrkitSettingViewController: UIViewController, ActionSettingViewControllerProtocol {

    @IBOutlet var serverNameTextField: UITextField?
    @IBOutlet var getRecentSignalButton: UIButton?
    @IBOutlet var recentSignalLabel: UILabel?
    
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
    
    @IBAction func getRecentSignal() {
        let request = NSMutableURLRequest(URL: NSURL(string: "http://" + serverNameTextField!.text! + "/messages")!)
        request.addValue("openSensorApp", forHTTPHeaderField: "X-Requested-With")
        request.HTTPMethod = "GET"
        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {
            data, response, error in
            if error != nil {
                ErrorAlertHelper.show(error!, parentViewController: self)
                return
            }
            (self.recentSignalLabel?.text = String(data: data!, encoding: NSUTF8StringEncoding))!
        }).resume()
        
    }
    
    @IBAction func saveSensorActionButtonTapped() {
        saveEditingActionSetting(SendInfraredSignalViaIrkitSettings(
            actionName: "SendInfraredSignalViaIrkit",
            actionSettingDisplayName: getActionSettingDisplayName(),
            serverName: (serverNameTextField?.text)!,
            infraredSignalJson: (recentSignalLabel?.text)!)
        )
        navigationController?.pushViewController(SaveSensorActionSettingsViewController(), animated: true)
    }
    
    func getActionSettingDisplayName() -> String {
        return "to IRKit:" + (serverNameTextField?.text)!
    }

}

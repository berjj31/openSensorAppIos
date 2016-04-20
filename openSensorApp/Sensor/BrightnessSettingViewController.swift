//
//  BrightnessSettingViewController.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/04.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import UIKit

@objc(BrightnessSettingViewController)
class BrightnessSettingViewController: UIViewController, SensorSettingViewControllerProtocol {

    @IBOutlet var blightnessProgressView: UIProgressView!
    @IBOutlet var thresholdSlider: UISlider!
    @IBOutlet var detectionRightSwitch: UISwitch!
    
    var brightness: Float = 0.0
    var threshold: Float = 0.0
    var detectionRight: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "Sensor setting"
        detectionRightSwitch.on = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        brightness = Float(UIScreen.mainScreen().brightness)
        blightnessProgressView.progress = brightness
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(brightnessDidChange(_:)), name: UIScreenBrightnessDidChangeNotification, object: nil)
    }
    
    internal func brightnessDidChange(notification: NSNotification) {
        brightness = Float(UIScreen.mainScreen().brightness)
        blightnessProgressView.progress = brightness
    }
    
    @IBAction func selectActionButtonTapped() {
        saveEditingSensorSetting(BrightnessSettings(
            sensorName: "Brightness",
            sensorSettingDisplayName: getSensorSettingDisplayName(),
            threshold: thresholdSlider.value,
            detectionRight: detectionRightSwitch.on
        ))
        navigationController?.pushViewController(SelectActionViewController(), animated: true)
    }
    
    internal func getSensorSettingDisplayName() -> String {
        var displayName = "Brightness "
        if (detectionRightSwitch.on) {
            displayName += "over "
        } else {
            displayName += "under "
        }
        displayName += String(format:"%.1f", thresholdSlider.value)
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

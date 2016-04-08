//
//  SelectSensorViewController.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/05.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import UIKit

class SelectSensorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var sensorNameList = []
    
    @IBOutlet var picker: UIPickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Select sensor"
        
        let closeButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: #selector(SelectSensorViewController.cancel))
        navigationItem.setLeftBarButtonItem(closeButton, animated: true)
        
        picker?.selectRow(0, inComponent: 0, animated: false)
        
        let path = NSBundle.mainBundle().pathForResource("sensorNameList", ofType: "plist")!
        sensorNameList = NSArray(contentsOfFile: path)!
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
    
    internal func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    internal func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sensorNameList.count
    }
    
    internal func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sensorNameList[row] as? String
    }
    
    internal func cancel() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func selectButtonTapped() {
        let sensorSettingViewControllerName = (sensorNameList[(picker?.selectedRowInComponent(0))!] as? String)! + "SettingViewController"
        let cls = NSClassFromString(sensorSettingViewControllerName) as! UIViewController.Type
        let sensorSettingViewController:UIViewController = (cls.init() as UIViewController)
        
        navigationController?.pushViewController(sensorSettingViewController, animated: true)
    }

}

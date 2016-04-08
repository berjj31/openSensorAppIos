//
//  SelectActionViewController.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/05.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import UIKit

class SelectActionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var actionNameList = []
    
    @IBOutlet var picker: UIPickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "Select action"
        
        picker?.selectRow(0, inComponent: 0, animated: false)
        
        let path = NSBundle.mainBundle().pathForResource("actionNameList", ofType: "plist")!
        actionNameList = NSArray(contentsOfFile: path)!
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
        return actionNameList.count
    }
    
    internal func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return actionNameList[row] as? String
    }
    
    internal func cancel() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func selectButtonTapped() {
        let actionSettingViewControllerName = (actionNameList[(picker?.selectedRowInComponent(0))!] as? String)! + "SettingViewController"
        let cls = NSClassFromString(actionSettingViewControllerName) as! UIViewController.Type
        let actionSettingViewController:UIViewController = (cls.init() as UIViewController)
        
        navigationController?.pushViewController(actionSettingViewController, animated: true)
    }

}

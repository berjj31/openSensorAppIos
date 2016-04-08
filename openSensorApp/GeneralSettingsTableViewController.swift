//
//  GeneralSettingsTableViewController.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/04.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import UIKit

class GeneralSettingsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView?
    
    var sensorActionSettings: Array<Dictionary<String, AnyObject>> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        title = "General settings"
        
        let standbyButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: #selector(GeneralSettingsTableViewController.standby))
        navigationItem.setLeftBarButtonItem(standbyButton, animated: true)
        
        let editButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Trash, target: self, action: #selector(GeneralSettingsTableViewController.editButtonTapped))
        navigationItem.setRightBarButtonItem(editButton, animated: true)
        
        tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "default")
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.tableFooterView = UIView()
    }
    
    internal func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func viewWillAppear(animated: Bool) {
        sensorActionSettings = SensorActionSettingsHelper.read();
        tableView?.reloadData()        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    internal func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sensorActionSettings.count
    }

    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("default", forIndexPath: indexPath)

        // Configure the cell...
        let setting = sensorActionSettings[indexPath.row]
        let sensorSetting = setting["sensorSetting"]
        let actionSetting = setting["actionSetting"]
        let sensorName = sensorSetting!["sensorSettingDisplayName"] as! String
        let actionName = actionSetting!["actionSettingDisplayName"] as! String
        cell.textLabel?.text = sensorName + "\n> " + actionName
        cell.textLabel?.numberOfLines = 2
        cell.layoutIfNeeded()
        return cell
    }

    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete"){
            (action, indexPath) in
                self.sensorActionSettings.removeAtIndex(indexPath.row)
                SensorActionSettingsHelper.write(self.sensorActionSettings)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
        deleteAction.backgroundColor = UIColor.redColor()
        return [deleteAction]
    }

    internal func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    internal func standby() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    internal func editButtonTapped() {
        tableView?.setEditing(!(tableView?.editing)!, animated: true)
    }
    
    @IBAction func addNewActionSensorButtonTapped() {
        let selectSensorViewController = SelectSensorViewController()
        navigationController?.pushViewController(selectSensorViewController, animated: true)
    }

}

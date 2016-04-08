//
//  PlayAudioSettingViewController.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/05.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

@objc(PlayAudioSettingViewController)
class PlayAudioSettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ActionSettingViewControllerProtocol {
    
    @IBOutlet var tableView: UITableView?
    
    var albumList: Array<MPMediaItemCollection> = []
    var songList: Array<Array<MPMediaItem>> = []
    var selectedMediaItem: MPMediaItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "Action setting"
        setup()
        tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "default")
        tableView?.tableFooterView = UIView()
    }
    
    internal func setup() {
        albumList = MPMediaQuery.albumsQuery().collections! as [MPMediaItemCollection]
        for album in albumList {
            songList.append(album.items)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    internal func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return albumList.count
    }
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songList[section].count
    }
    
    internal func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let firstSong = songList[section][0] as MPMediaItem
        return firstSong.valueForProperty(MPMediaItemPropertyAlbumTitle) as? String
    }
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("default", forIndexPath: indexPath)
        
        // Configure the cell...
        let song = songList[indexPath.section][indexPath.row] as MPMediaItem
        cell.textLabel?.text = song.valueForProperty(MPMediaItemPropertyTitle) as? String
        return cell
    }
    
    internal func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedMediaItem = songList[indexPath.section][indexPath.row]
        saveEditingActionSetting([
            "actionName" : "PlayAudio",
            "actionSettingDisplayName" : getActionSettingDisplayName(),
            "mediaItemPersistentID" : String((selectedMediaItem?.persistentID)!)
            ])
        navigationController?.pushViewController(SaveSensorActionSettingsViewController(), animated: true)
    }
    
    func getActionSettingDisplayName() -> String {
        return "Play audio " + (selectedMediaItem?.title)!
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

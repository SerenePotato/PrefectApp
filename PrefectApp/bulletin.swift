//
//  FirstViewController.swift
//  PrefectApp
//
//  Created by Home on 14/10/2016.
//  Copyright © 2016 Royce Yu. All rights reserved.
//

import UIKit

class bulletin: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let kSectionCount:Int=2
    let announcementSection:Int=0
    let eventSection:Int=1
    
    let announcements: [String] = ["Announcement 1", "Announcement 2"]
    let events: [String] = ["Event 1", "Event 2"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return kSectionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section
        {
        case announcementSection:return announcements.count
        case eventSection:return events.count
        default:return 0
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section
        {
        case announcementSection:return "Announcements"
        case eventSection: return "Events"
        default:return "Unknown"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "announcementCell")!as UITableViewCell
            switch indexPath.section
            {
            case announcementSection:cell.textLabel!.text=announcements[indexPath.row]
            case eventSection:cell.textLabel!.text=events[indexPath.row]
            default:cell.textLabel!.text="Unknown"
            }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var eventsignupmessage: String
        switch indexPath.section
        {
        case eventSection:eventsignupmessage = "Are you sure you want to sign up?"
        default:eventsignupmessage = "何も選んだ"
        }
        let alertController = UIAlertController(title: "Event Sign Up", message:eventsignupmessage,preferredStyle: UIAlertControllerStyle.alert)
        let defaultAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler:nil)
        alertController.addAction(defaultAction)
        present(alertController,animated:true,completion:nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


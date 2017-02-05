//
//  FirstViewController.swift
//  Tabbed App Demo
//
//  Created by Administrator on 11/1/16.
//  Copyright © 2016 Administrator. All rights reserved.
//
// EVENT 

import UIKit


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var EventsTableView: UITableView!
    
    var detailViewController: EventsDetailViewController? = nil
    
    
    var objects = [String]()
    
    var TableData:Array<String> = Array <String>()
    var events: [String] = []
    var eventsDesc: [String] = []
    var eventsLoc: [String] = []
    var eventsHLoc: [String] = []
    var eventsDay: [String] = []
    var eventsStart: [String] = []
    var eventsEnd: [String] = []
    var aObject: [String:AnyObject] = [:]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventTableViewCell
        // let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "eventCell") as! EventTableViewCell
        cell.lblEventDate.text = eventsDay[indexPath.row]
        cell.lblEventTitle.text = events[indexPath.row]
        // cell.textLabel!.text = events[indexPath.row]
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let path = Bundle.main.path(forResource: "events2", ofType: "json") {
            
            let url = URL(fileURLWithPath: path)
            
            do {
                
                let allEventsData = try Data(contentsOf: url)
                
                let allEvents = try JSONSerialization.jsonObject(with: allEventsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                
                //               print(allEvents)
                
                
                if let arrJSON = allEvents["Events"] {
                    
                    
                    for index in 0...arrJSON.count-1 {
                        
                        aObject = arrJSON[index] as! [String : AnyObject]
                        
                        events.append(aObject["Title"] as! String)
                        eventsDesc.append(aObject["Description"] as! String)
                        eventsLoc.append(aObject["Location"] as! String)
                        eventsHLoc.append(aObject["HumanLocation"] as! String)
                        eventsDay.append(aObject["Day"] as! String)
                        eventsStart.append(aObject["Time"] as! String)
                        eventsEnd.append(aObject["Duration"] as! String)
                        
                        
                        
                        
               // print(events)
                        
                        
                    }
                    
                    
                    
                }
                
                EventsTableView.reloadData()
                
            }
            catch {
                
            }
            
            
        }
        
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Segues
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         performSegue(withIdentifier: "eventShowDetail", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       

        
        if segue.identifier == "eventShowDetail" {
            
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
            
            if let indexPath = EventsTableView.indexPathForSelectedRow {
                let controller = segue.destination  as! EventsDetailViewController
                controller.detailItem = events[indexPath.row]
                controller.detailDesc = eventsDesc[indexPath.row]
                controller.detailLoc = eventsLoc[indexPath.row]
                controller.detailHLoc = eventsHLoc[indexPath.row]
                controller.detailDay = eventsDay[indexPath.row]
                controller.detailStart = eventsStart[indexPath.row]
                controller.detailEnd = eventsEnd[indexPath.row]
                
                
 print(events[indexPath.row])
                
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
        
    }
    
    
    
}

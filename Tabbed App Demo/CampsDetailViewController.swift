//
//  CampsDetailViewController.swift
//  Tabbed App Demo
//
//  Created by Administrator on 1/21/17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import UIKit

class CampsDetailViewController: UIViewController {

    
    @IBOutlet var CampsDetailViewController: UIView!
    
    @IBOutlet weak var detailTitleLabel: UILabel!
    
    @IBOutlet weak var detailLocLabel: UILabel!
    
    @IBOutlet weak var detailHLocLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
        self.findEvents()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func configureView() {
        
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailTitleLabel {
                label.text = detail.description
            }
        }
        
        
        if let detaill = self.detailLoc {
            if let loc = self.detailLocLabel {
                loc.text = detaill
            }
        }
        if let detailh = self.detailHLoc {
            if let hloc = self.detailHLocLabel {
                hloc.text = detailh
            }
        }
        
    }
    
        func findEvents() {
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
            
            
            if let path = Bundle.main.path(forResource: "events2", ofType: "json") {
                
                let url = URL(fileURLWithPath: path)
                
                do {
                    
                    let allEventsData = try Data(contentsOf: url)
                    
                    let allEvents = try JSONSerialization.jsonObject(with: allEventsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                    
                    //               print(allEvents)
                    
                    
                    if let arrJSON = allEvents["Events"] {
                        
                        
                        for index in 0...arrJSON.count-1 {

                            
                            aObject = arrJSON[index] as! [String : AnyObject]

                            
                            if (aObject["Location"] as! String) == "Canned Ham Camp" {
                                print(aObject["Title"] as! String)

                            
                            events.append(aObject["Title"] as! String)
                            eventsDesc.append(aObject["Description"] as! String)
                            eventsLoc.append(aObject["Location"] as! String)
                            eventsHLoc.append(aObject["HumanLocation"] as! String)
                            eventsDay.append(aObject["Day"] as! String)
                            eventsStart.append(aObject["StartTime"] as! String)
                            eventsEnd.append(aObject["EndTime"] as! String)

                            
                            }
                            
                            
                            
                            
                        }
                        
                        
                        
                    }
                    
                    
                }
                catch {
                    
                }
                

            
        }
        
        
        
        
        
        
        
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    
    // MARK: - Table view data source
    
    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    var detailLoc: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    var detailHLoc: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    
    
}

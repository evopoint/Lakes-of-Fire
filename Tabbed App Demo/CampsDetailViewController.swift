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
    
    @IBOutlet weak var detailEventLabel: UILabel!
    
    @IBOutlet weak var detailEvent2Label: UITextView!
    


    var campEventList: String = ""
    
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.findEvents()
        self.configureView()

        
        
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
                detailTitleLabel.sizeToFit()
 //               print("detail")
            }
        }
        
        
        if let detaill = self.detailLoc {
            if let loc = self.detailLocLabel {
                loc.text = detaill
                detailLocLabel.sizeToFit()
            }
        }
        if let detailh = self.detailHLoc {
            if let hloc = self.detailHLocLabel {
                hloc.text = detailh
                detailHLocLabel.sizeToFit()
            }
        }
        
            if let detailevent = self.detailEvent2Label {
                detailevent.text = campEventList
                detailEvent2Label.sizeToFit()
            }
        

        
    }
    
        func findEvents() {
            var aObject: [String:AnyObject] = [:]
            
            
            if let path = Bundle.main.path(forResource: "events2", ofType: "json") {
                
                let url = URL(fileURLWithPath: path)
                
                do {
                    
                    let allEventsData = try Data(contentsOf: url)
                    
                    let allEvents = try JSONSerialization.jsonObject(with: allEventsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                    
                    //               print(allEvents)
                    
                    
                    if let arrJSON = allEvents["Events"] as? NSArray {
                        
                        
                        for index in 0...arrJSON.count-1 {

                            
                            aObject = arrJSON[index] as! [String : AnyObject]

                            
                            if (aObject["Location"] as! String) == detailItem {
                                
                                
                               print(aObject["Title"] as! String)
                            campEventList.append("\nEvent Title: ")
                            campEventList.append(aObject["Title"] as! String)
                            campEventList.append("\nDay: ")
                            campEventList.append(aObject["Day"] as! String)
                            campEventList.append("\nTime: ")
                            campEventList.append(aObject["HumanTime"] as! String)
                            campEventList.append("\nDescription: ")
                            campEventList.append(aObject["Description"] as! String)
                            campEventList.append("\n\n")
                                

                            
                            }
                            
                            print(campEventList)
                            
                            
                            
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

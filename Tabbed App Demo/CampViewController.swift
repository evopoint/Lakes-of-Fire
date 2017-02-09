//
//  CampViewController.swift
//  Tabbed App Demo
//
//  Created by Administrator on 11/1/16.
//  Copyright © 2016 Administrator. All rights reserved.
//
// CAMP

import UIKit

class CampViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    @IBOutlet weak var CampsTableView: UITableView!
    
    @IBOutlet weak var campDate: UILabel!
    
    @IBOutlet weak var campTitle: UILabel!
    
    
    
    var objects = [String]()
    
    var TableData:Array<String> = Array <String>()
    var camps: [String] = []
    var campsTitle: [String] = []
    var campsLoc: [String] = []
    var campsHLoc: [String] = []
    var aObject: [String:AnyObject] = [:]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return camps.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "campCell", for: indexPath) as! CampTableViewCell
        
            //  let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "campCell") as! CampTableViewCell

        cell.lblCampCell!.text = camps[indexPath.row]
   //c     call.lblCampDate!.text = camp
        return cell
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let path = Bundle.main.path(forResource: "camps", ofType: "json") {
            
            let url = URL(fileURLWithPath: path)
            
            do {
                
                let allCampsData = try Data(contentsOf: url)
                
                let allCamps = try JSONSerialization.jsonObject(with: allCampsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                
                //               print(allEvents)
                
                
                if let arrJSON = allCamps["Camps"] {
                    
                    
                    for index in 0...arrJSON.count-1 {
                        
                        aObject = arrJSON[index] as! [String : AnyObject]
                        
                        camps.append(aObject["Location"] as! String)
                        campsLoc.append(aObject["SiteId"] as! String)
                        campsHLoc.append(aObject["HumanLocation"] as! String)
                        
                        
                        
                        
                 //       print(camps)
                        
                        
                    }
                    
                    
                    
                }
                
                CampsTableView.reloadData()
                
            }
            catch {
                
            }
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "campShowDetail", sender: nil)
    }

    @IBAction func unwindToCampViewController(segue: UIStoryboardSegue) {
        print("Unwind to Root View Controller")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        if segue.identifier == "campShowDetail" {
            
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
            
            if let indexPath = CampsTableView.indexPathForSelectedRow {
                let controller = segue.destination  as! CampsDetailViewController
                controller.detailItem = camps[indexPath.row]
                controller.detailLoc = campsLoc[indexPath.row]
                controller.detailHLoc = campsHLoc[indexPath.row]
                
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                
 print(camps[indexPath.row])
                 print(campsLoc[indexPath.row])
                 print(campsHLoc[indexPath.row])
                
            }
        }
        
    }
    
    

}


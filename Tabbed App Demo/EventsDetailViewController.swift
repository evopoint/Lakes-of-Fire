//
//  EventsDetailViewController.swift
//  Tabbed App Demo
//
//  Created by Administrator on 11/3/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit

class EventsDetailViewController: UIViewController {


   
    @IBOutlet var EventDetailsViewController: UIView!
  
    
    
    
    @IBOutlet var detailTitleLabel: UILabel!

    
    @IBOutlet var detailDescriptionLabel: UILabel!
    
    @IBOutlet var detailHLocLabel: UILabel!
    
    @IBOutlet var detailLocLabel: UILabel!
    

    
    func configureView() {

        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailTitleLabel {
                label.text = detail.description
            }
        }
        

        if let detaild = self.detailDesc {
            if let desc = self.detailDescriptionLabel {
                desc.text = detaild
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    var detailDesc: String? {
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

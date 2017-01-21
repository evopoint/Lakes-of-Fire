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

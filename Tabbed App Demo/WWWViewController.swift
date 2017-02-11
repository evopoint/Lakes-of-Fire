//
//  WWWViewController.swift
//  Tabbed App Demo
//
//  Created by Administrator on 2/10/17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import UIKit

class WWWViewController: UIViewController {

    @IBOutlet weak var wwwWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        if let pdf = Bundle.main.url(forResource: "LOF-Program2016-web", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(url: pdf)
            wwwWebView.loadRequest(req as URLRequest)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

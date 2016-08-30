//
//  EventViewController.swift
//  BasePlay-iOS
//
//  Created by Abhishek Dave on 23/8/16.
//  Copyright © 2016 Abhishek Dave. All rights reserved.
//

import UIKit

class EventViewController: UITabBarController {
    
    @IBOutlet weak var barButton: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            barButton.target = self.revealViewController()
            barButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

        // Do any additional setup after loading the view.
    }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

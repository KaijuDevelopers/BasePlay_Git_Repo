//
//  POPUINavigationController.swift
//  BasePlay-iOS
//
//  Created by Abhishek Dave on 29/8/16.
//  Copyright © 2016 Abhishek Dave. All rights reserved.
//

import UIKit

class POPUINavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.popViewController(animated: true)
        // Do any additional setup after loading the view.
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

//
//  RateUSViewController.swift
//  BasePlay-iOS
//
//  Created by Abhishek Dave on 29/8/16.
//  Copyright © 2016 Abhishek Dave. All rights reserved.
//

import UIKit

class RateUSViewController: UIViewController {
    // ----APP RATE SETTINGS ---
    let APP_ID = "YOUR_STORE_ID_OF_APP"
    
    let showRateTimes = 3 //Times rateApp() called before alert shows
    // -------------------------
    
    let RATED_DEFAULT_KEY = "RATED_APP_KEY"
    let RATE_CNT_KEY = "RATE_CNT_KEY"
    
    var defaults: UserDefaults!
    var viewLoaded: Int = 0
    
    func showRateAlertInmediatly (_ view: UIViewController) {
        rateApp(view, immediatly: true)
    }
    
    func rateApp(_ view: UIViewController, immediatly: Bool?) {
        if  defaults == nil {
            defaults = UserDefaults()
            viewLoaded = defaults.object(forKey: RATE_CNT_KEY) == nil ? 0 : defaults.object(forKey: RATE_CNT_KEY) as! Int
        }
        
        var immed = false
        
        if immediatly != nil {
            immed = immediatly!
        }
        
        if !immed {
            viewLoaded += 1
        }
        
        defaults.set(viewLoaded, forKey: "viewLoadedCntRateApp")
        
        if viewLoaded % showRateTimes == 0 || immed {
            if (defaults.object(forKey: RATED_DEFAULT_KEY) == nil || immed) {
                viewLoaded = 0
                
                let rateAlert = UIAlertController(title: "Please, Rate Us!", message: "How much do you like this App?", preferredStyle: .alert)
                
                let fiveStarsAction = UIAlertAction(title: "★★★★★", style: .default, handler: {(alert: UIAlertAction!) in self.goToRate(view)})
                rateAlert.addAction(fiveStarsAction)
                let fourStarsAction = UIAlertAction(title: "★★★★✩", style: .default, handler: {(alert: UIAlertAction!) in self.goToRate(view)})
                rateAlert.addAction(fourStarsAction)
                let threeStarsAction = UIAlertAction(title: "★★★✩✩", style: .default, handler: {(alert: UIAlertAction!) in self.showCloseAlert(view, title: "Thank you", message: "We appreciate your opinion.")
                    self.noMoreRate()
                })
                rateAlert.addAction(threeStarsAction)
                let twoStarsAction = UIAlertAction(title: "★★✩✩✩", style: .default, handler: {(alert: UIAlertAction!) in self.showCloseAlert(view, title: "Thank you", message: "We appreciate your opinion.")
                    self.noMoreRate()
                })
                rateAlert.addAction(twoStarsAction)
                let oneStarsAction = UIAlertAction(title: "★✩✩✩✩", style: .default, handler: {(alert: UIAlertAction!) in self.showCloseAlert(view, title: "Thank you", message: "We appreciate your opinion.")
                    self.noMoreRate()
                })
                rateAlert.addAction(oneStarsAction)
                let notNowAction = UIAlertAction(title: "Not Now", style: .default, handler: nil)
                rateAlert.addAction(notNowAction)
                let noThanksAction = UIAlertAction(title: "Don't Ask Again", style: .default, handler: {(alert: UIAlertAction!) in self.noMoreRate()})
                rateAlert.addAction(noThanksAction)
                
                view.present(rateAlert, animated: true, completion: nil)
            }
        }
    }
    
    func goToRate(_ view: UIViewController) {
        let openStoreAlert = UIAlertController(title: "Great", message: "Now, App Store will open and you just have to write a review in 'Reviews' tabs.", preferredStyle: .alert)
        let openStoreAction = UIAlertAction(title: "Go To App Store", style: .default, handler: {(slert: UIAlertAction) in
            self.noMoreRate()
            UIApplication.shared().openURL(URL(string : "itms-apps://itunes.apple.com/app/id\(self.APP_ID)")!);
        })
        
        openStoreAlert.addAction(openStoreAction)
        
        view.present(openStoreAlert, animated: true, completion: nil)
    }
    
    func noMoreRate () {
        
        let defaults = UserDefaults()
        defaults.set(true, forKey: RATED_DEFAULT_KEY)
    }
    
    
    func showCloseAlert (_ view: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alert.addAction(alertAction)
        
        view.present(alert, animated: true, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        showRateAlertInmediatly(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

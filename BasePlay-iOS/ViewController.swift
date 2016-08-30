//
//  ViewController.swift
//  BasePlay-iOS
//
//  Created by Abhishek Dave on 22/8/16.
//  Programming by Yash Patel
//  Copyright © 2016 Abhishek Dave. All rights reserved.
//
import Foundation
import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class FBMain{
    
    var FBFirst_name:String
    var FBLast_name:String
    var FBEmail:String
    var FBPic_url:String
    
    init(FBFirst_name:String,FBLast_name:String,FBEmail:String,FBPic_url:String) {
        self.FBFirst_name = FBFirst_name
        self.FBLast_name = FBLast_name
        self.FBEmail = FBEmail
        self.FBPic_url = FBPic_url
    }
    

}
var FBGlobalVar = FBMain(FBFirst_name:"",FBLast_name:"",FBEmail:"",FBPic_url:"")

class ViewController: UIViewController, FBSDKLoginButtonDelegate
{
    
    //Facebook Login Button Declare : Start
    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    }()
    //Facebook Login Button Declare : End

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Facebook Add Button to View : Start
        view.addSubview(loginButton)
        loginButton.center = view.center
        loginButton.delegate = self
        
        
        if (FBSDKAccessToken.current()) == nil
        {
            print("Not Logged in yet")
        }
        else
        {
            fetchProfile()

        }
        //Facebook Add Button to View : End
        

    }
    

    
    
    //Facebook Custom fetchProfile() Declare : Start
    func fetchProfile() {
        
        let parameters = ["fields": "email, first_name, last_name, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start(completionHandler: { (connection, user, requestError) -> Void in
            
            
            if requestError != nil
            {
                print(requestError)
                return
            }
            
            let email = user?["email"] as? String
            let firstName = user?["first_name"] as? String
            let lastName = user?["last_name"] as? String
            let picture = user?["picture"] as? NSDictionary, data = picture?["data"] as? NSDictionary, url = data?["url"] as? String
            FBGlobalVar = FBMain(FBFirst_name:firstName!,FBLast_name:lastName!,FBEmail:email!,FBPic_url:url!)
            
//            self.nameLabel.text = "\(firstName!) \(lastName!)"
//
//            var pictureUrl = ""
//
//            if let picture = user["picture"] as? NSDictionary, data = picture["data"] as? NSDictionary, url = data["url"] as? String {
//                pictureUrl = url
//            }
            
            
//            
//            if let email = user?["email"] as? String
//            {
//                print(email)
//                print(user)
//                //MainEmail = Main(name:firstName!,fbemail: email)
//                
//                
//            }
            

            
        })
        
    }
    //Facebook Custom fetchProfile() Declare : End


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Facebook Predefine Delegates : Start
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: NSError!) {

        if((error) != nil)
        {
            //Handle Error
        }
        else if(result.isCancelled)
        {
            //Handle the cancel event
        }
        else
        {
            self.loginButton.isHidden = true
            let storyboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
            let vc: SWRevealViewController = storyboard.instantiateViewController(withIdentifier: "SWRevealViewControllerID") as! SWRevealViewController
            self.present(vc, animated: false, completion: nil)
            //self.performSegue(withIdentifier: "SWRevealViewControllerSeg", sender: self)
            
            
            fetchProfile()

            print("PutButtonCodeHHere1")
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    //Facebook Predefine Delegates : End

}




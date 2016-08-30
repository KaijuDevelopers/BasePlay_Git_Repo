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
        loginButton.center = view.center
        loginButton.delegate = self
        
        if(FBSDKAccessToken.current() != nil)
        {
            
        }
        else
        {
            view.addSubview(loginButton)
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        fetchProfile()
    }
    

    //Facebook Custom fetchProfile() Declare : Start
    func fetchProfile(){
        
        let parameters = ["fields": "email, first_name, last_name, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start(completionHandler: { (connection, user, requestError) -> Void in
            
            
            if requestError != nil
            {
                print(requestError)
                return
            }
            else
            {
                self.translateuserToMainViewController()
            }
            let email = user?["email"] as? String
            let firstName = user?["first_name"] as? String
            let lastName = user?["last_name"] as? String
            let picture = user?["picture"] as? NSDictionary, data = picture?["data"] as? NSDictionary, url = data?["url"] as? String
            FBGlobalVar = FBMain(FBFirst_name:firstName!,FBLast_name:lastName!,FBEmail:email!,FBPic_url:url!)
        
        })
  
    }
    //Facebook Custom fetchProfile() Declare : End


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Facebook Login Button : Start
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
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
            fetchProfile()
            facebookbuttonstate(state: true)
            translateuserToMainViewController()
        }
    }
    //Facebook Login Button : Start

    //Facebook Logout Button : Start
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!)
    {
        
    }
    //Facebook Logout Button : End
  
    func translateuserToMainViewController()
    {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        let vc: SWRevealViewController = storyboard.instantiateViewController(withIdentifier: "SWRevealViewControllerID") as! SWRevealViewController
        self.present(vc, animated: false, completion: nil)
    }
    
    func facebookbuttonstate(state:Bool)
    {
        loginButton.isHidden = state
    }


}




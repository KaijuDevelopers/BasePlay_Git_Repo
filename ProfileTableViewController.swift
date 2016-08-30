//
//  ProfileTableViewController.swift
//  BasePlay-iOS
//
//  Created by Abhishek Dave on 23/8/16.
//  Copyright © 2016 Abhishek Dave. All rights reserved.
//

import UIKit

class ProfileTableViewController: UIViewController {
    

    @IBOutlet weak var profilepic: UIImageView!
    @IBOutlet weak var menu: UIBarButtonItem!
    @IBOutlet weak var username: UILabel!

        
    @IBOutlet weak var BasketballSlide: UISlider!
    @IBOutlet weak var FootballSlide: UISlider!
    @IBOutlet weak var VollyballSlide: UISlider!
    @IBOutlet weak var TennisSlide: UISlider!
    @IBOutlet weak var BadmintonSlide: UISlider!
    
    @IBOutlet weak var BasRank: UILabel!
    @IBOutlet weak var FRank: UILabel!
    @IBOutlet weak var VRank: UILabel!
    @IBOutlet weak var TRank: UILabel!
    @IBOutlet weak var BadRank: UILabel!
    @IBOutlet weak var OverallRank: UILabel!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationItem.title = "Profile"
            
            
            username.text = FBGlobalVar.FBFirst_name + " " + FBGlobalVar.FBLast_name
            profilepic.imageFromUrl(urlString: FBGlobalVar.FBPic_url)
            
            
            if self.revealViewController() != nil {
                menu.target = self.revealViewController()
                menu.action = #selector(SWRevealViewController.revealToggle(_:))
                self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
                
            }
//            profilepic.layer.borderWidth = 1
//            profilepic.layer.masksToBounds = false
//            profilepic.layer.borderColor = UIColor.black().cgColor
//            profilepic.layer.cornerRadius = profilepic.frame.height/2
//            profilepic.clipsToBounds = true
//            
//            if self.revealViewController() != nil {
//                menu.target = self.revealViewController()
//                menu.action = #selector(SWRevealViewController.revealToggle(_:))
//                self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
                // Do any additional setup after loading the view.
            
            BasketballSlide.value = 81;
            FootballSlide.value = 20;
            VollyballSlide.value = 35;
            TennisSlide.value = 50;
            BadmintonSlide.value = 70;
            
            BasRankAction()
            FootRankAction()
            VRankAction()
            TRankAction()
            BadRankAction()
            OverallRankAction()
    

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillLayoutSubviews() {
        profilepic.image = profilepic.image?.circleMask
    }
    func cropToBounds(image: UIImage, width: Double, height: Double) -> UIImage {
        
        let contextImage: UIImage = UIImage(cgImage: image.cgImage!)
        
        let contextSize: CGSize = contextImage.size
        
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = CGFloat(width)
        var cgheight: CGFloat = CGFloat(height)
        
        // See what size is longer and create the center off of that
        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = 0
            cgwidth = contextSize.height
            cgheight = contextSize.height
        } else {
            posX = 0
            posY = ((contextSize.height - contextSize.width) / 2)
            cgwidth = contextSize.width
            cgheight = contextSize.width
        }
        
        let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
        
        
        // Create bitmap image from context using the rect
        let imageRef: CGImage = contextImage.cgImage!.cropping(to: rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        
        return image
    }

    func BasRankAction(){
        if(BasketballSlide.value == 100){
            BasRank.text = "Rank: Professional"
        }
        else if(BasketballSlide.value >= 80)
        {
            BasRank.text = "Rank: Expert"
        }else if(BasketballSlide.value >= 50){
            BasRank.text = "Rank: Intermediate"
        }else if(BasketballSlide.value >= 30){
            BasRank.text = "Rank: Beginner"
        }else {
            BasRank.text =  "Rank: Newbie"
        }
    }
    func FootRankAction(){
            if(FootballSlide.value == 100){
                FRank.text = "Rank: Professional"
            }
            else if(FootballSlide.value >= 80)
            {
                FRank.text = "Rank: Expert"
            }else if(FootballSlide.value >= 50){
                FRank.text = "Rank: Intermediate"
            }else if(FootballSlide.value >= 30){
                FRank.text = "Rank: Beginner"
            }else {
                FRank.text =  "Rank: Newbie"
            }
        }
        func VRankAction(){
            if(VollyballSlide.value == 100){
                VRank.text = "Rank: Professional"
            }
            else if(VollyballSlide.value >= 80)
            {
                VRank.text = "Rank: Expert"
            }else if(VollyballSlide.value >= 50){
                VRank.text = "Rank: Intermediate"
            }else if(VollyballSlide.value >= 30){
                VRank.text = "Rank: Beginner"
            }else {
                VRank.text =  "Rank: Newbie"
            }
        }
        func TRankAction(){
            if(TennisSlide.value == 100){
                TRank.text = "Rank: Professional"
            }
            else if(TennisSlide.value >= 80)
            {
                TRank.text = "Rank: Expert"
            }else if(TennisSlide.value >= 50){
                TRank.text = "Rank: Intermediate"
            }else if(TennisSlide.value >= 30){
                TRank.text = "Rank: Beginner"
            }else {
                TRank.text =  "Rank: Newbie"
            }
        }
        func BadRankAction(){
            if(BadmintonSlide.value == 100){
                BadRank.text = "Rank: Professional"
            }
            else if(BadmintonSlide.value >= 80)
            {
                BadRank.text = "Rank: Expert"
            }else if(BadmintonSlide.value >= 50){
                BadRank.text = "Rank: Intermediate"
            }else if(BadmintonSlide.value >= 30){
                BadRank.text = "Rank: Beginner"
            }else {
                BadRank.text = "Rank: Newbie"
            }
        }
        
        func OverallRankAction(){
            var overall:Float = (BadmintonSlide.value + FootballSlide.value + VollyballSlide.value + TennisSlide.value + BasketballSlide.value)/5
            if(overall == 100.0){
                OverallRank.text = "Professional"
            }
            else if(overall >= 80.0)
            {
                OverallRank.text = "Expert"
            }else if(overall >= 50.0){
                OverallRank.text = "Intermediate"
            }else if(overall >= 30.0){
                OverallRank.text = "Beginner"
            }else {
                OverallRank.text = "Newbie"
            }


        
        }



    }


    // MARK: - Table view data source

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



//Get Facebook Profile Pic Async :End




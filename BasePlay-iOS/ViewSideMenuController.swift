//
//  ViewSideMenuController.swift
//  BasePlay-iOS
//
//  Created by Yash Patel on 27/08/16.
//  Copyright © 2016 Abhishek Dave. All rights reserved.
//

import UIKit



class ViewSideMenuController: UITableViewController {

    @IBOutlet var FBDisplayPic: UIImageView!
    @IBOutlet var FBDisplayName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
 
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        

        
        
//        
        FBDisplayName.text = FBGlobalVar.FBFirst_name + " " + FBGlobalVar.FBLast_name
        FBDisplayPic.imageFromUrl(urlString: FBGlobalVar.FBPic_url)
 
        
    }

    override func viewWillLayoutSubviews() {
        
//        FBDisplayPic.layer.borderWidth = 1.0
//        FBDisplayPic.layer.masksToBounds = false //false
//        FBDisplayPic.layer.borderColor = UIColor.black().cgColor
//        FBDisplayPic.layer.cornerRadius = 13
//        FBDisplayPic.layer.cornerRadius = FBDisplayPic.frame.height/2
//        FBDisplayPic.layer.cornerRadius = FBDisplayPic.frame.size.width/2
//        FBDisplayPic.clipsToBounds = true
        
        
//        cropToBounds(image: FBDisplayPic.image!, width: 160 , height: 160)
//        FBDisplayPic.layer.borderWidth = 1.0
//        FBDisplayPic.layer.masksToBounds = false //false
//        FBDisplayPic.layer.borderColor = UIColor.black().cgColor
//        FBDisplayPic.layer.cornerRadius = 13
//        FBDisplayPic.layer.cornerRadius = FBDisplayPic.frame.height/2
//        FBDisplayPic.layer.cornerRadius = FBDisplayPic.frame.size.width/2
//        FBDisplayPic.clipsToBounds = true
        
       // imgAvatar.image = yourImage.circleMask
        
       // FBDisplayPic.image = FBDisplayPic.image?.circleMask
        

        
    }
//    
//    func cropToBounds(image: UIImage, width: Double, height: Double) -> UIImage {
//        
//        let contextImage: UIImage = UIImage(cgImage: image.cgImage!)
//        
//        let contextSize: CGSize = contextImage.size
//        
//        var posX: CGFloat = 0.0
//        var posY: CGFloat = 0.0
//        var cgwidth: CGFloat = CGFloat(width)
//        var cgheight: CGFloat = CGFloat(height)
//        
//        // See what size is longer and create the center off of that
//        if contextSize.width > contextSize.height {
//            posX = ((contextSize.width - contextSize.height) / 2)
//            posY = 0
//            cgwidth = contextSize.height
//            cgheight = contextSize.height
//        } else {
//            posX = 0
//            posY = ((contextSize.height - contextSize.width) / 2)
//            cgwidth = contextSize.width
//            cgheight = contextSize.width
//        }
//        
//        let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
//        
//        
//        // Create bitmap image from context using the rect
//        let imageRef: CGImage = contextImage.cgImage!.cropping(to: rect)!
//        
//        // Create a new image based on the imageRef and rotate back to the original orientation
//        let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
//        
//        return image
//    }
//    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        
       // FBDisplayPic.imageFromUrl(urlString: FBGlobalVar.FBPic_url)

        
       // FBDisplayPic.image = FBDisplayPic.image?.circleMask

 
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print(indexPath)
        if(indexPath.row == 5)
        {
            let loginManager = FBSDKLoginManager()
            loginManager.logOut()
            let storyboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
            let vc: ViewController = storyboard.instantiateViewController(withIdentifier: "ViewControllerID") as! ViewController
            self.present(vc, animated: false, completion: nil)
        }
    }

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

}

//Get Facebook Profile Pic Async :Start
extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(url: url as URL)
            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main())
            {
                (response: URLResponse?, data: Data?, error: NSError?) -> Void in
                if let imageData = data as NSData? {
                    self.image = UIImage(data: imageData as Data)
                    self.image = self.image?.circleMask
                }
            }
        }
    }
}
//Get Facebook Profile Pic Async :End

//CircleMake of ProfilePic :Start
extension UIImage {
    var circleMask: UIImage {
        let square = CGSize(width: min(size.width, size.height), height: min(size.width, size.height))
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: square))
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.image = self
        imageView.layer.cornerRadius = square.width/2
        imageView.layer.borderColor = UIColor.white().cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContext(imageView.bounds.size)
        imageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
}
//CircleMake of ProfilePic :End



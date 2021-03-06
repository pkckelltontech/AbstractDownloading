//
//  ViewController.swift
//  AbstractDownloading
//
//  Created by Pardeep on 31/07/16.
//  Copyright © 2016 www.programmingcrew.in. All rights reserved.
//

import UIKit
import FastImageCache


class ViewController: UIViewController {

    @IBOutlet weak var tableviewImages: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:- Table view delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "CellId"
        
        let cell : ViewControllerTableCell = tableView.dequeueReusableCellWithIdentifier(identifier) as! ViewControllerTableCell
    
        
//        cell.textLabel?.text = "Yo"
        let url = NSURL(string: "https://raw.githubusercontent.com/wangjwchn/TestImage/master/Image001.jpg")
        cell.imageUrl = url
        cell.customImageView.image = nil;
        let photo = FICDPhoto()
        photo.sourceImageURL = url
        
        FICImageCache.sharedImageCache().asynchronouslyRetrieveImageForEntity(photo, withFormatName: "32BitBGR") { [weak cell] (entity, formatName, image) in

            if((cell?.imageUrl.isEqual(url)) != nil){
                cell?.customImageView.image = image
                print("image retrived for entity %i",entity)
            }
        }
        
        return cell
    }

}


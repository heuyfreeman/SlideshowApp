//
//  ExpandImageViewController.swift
//  SlideshowApp
//
//  Created by Noboru Nishizawa on 2019/06/09.
//  Copyright © 2019 heuy.freeman. All rights reserved.
//

import UIKit

class ExpandImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    //index
    var imgNumber:Int = 0
    let expimgs = Images()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: expimgs.getName(imgNumber))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

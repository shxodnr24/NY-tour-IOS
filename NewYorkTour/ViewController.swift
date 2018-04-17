//
//  ViewController.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2017. 12. 12..
//  Copyright © 2017년 taewook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TestLabel: UILabel!
  
    @IBAction func barMenuOpen(_ sender: Any) {
        print("barMenu has Opend")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
  
    
    @IBOutlet weak var lowermahnattan: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "IMG_6650.JPG")
       lowermahnattan.setBackgroundImage(image, for: .normal)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


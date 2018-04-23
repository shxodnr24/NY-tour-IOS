//
//  LowerManhattanFirst.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2017. 12. 29..
//  Copyright © 2017년 taewook. All rights reserved.
//

import UIKit

class LowerManhattanFirst: UIViewController {
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storyboard.instantiateInitialViewController()
        present(nextView!, animated: true, completion: nil)
    }
    
}


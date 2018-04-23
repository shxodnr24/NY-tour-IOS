//
//  LMTAViewController.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2017. 12. 20..
//  Copyright © 2017년 taewook. All rights reserved.
//


import UIKit
import Firebase
import FirebaseDatabase

class LMTAViewController: UIViewController {
    

    @IBOutlet weak var testtest: UILabel!
    @IBOutlet weak var test02: UILabel!
    var test01: String?
    var test03: Int?
    var test911 = "테스트"
    var lowerlist = [FIRData]()
    var item = [String]()
    var test0111:String?
   
    @IBOutlet weak var addresslabel: UILabel!
    
    @IBOutlet weak var lmtatextfield: UITextView!
    
    override func viewDidLoad() {
     var test = [String]()
        super.viewDidLoad()
       
        func getDB(){
            var ref: DatabaseReference!
            ref = Database.database().reference()
            ref.child("ta/lower manhattan").observeSingleEvent(of: .value, with: { (snapshot) in
               
                let data = snapshot.value as? NSDictionary
                let taname1 = data?["taname"] as! String
                let location1 = data?["location"] as! String
                let info = data?["info"] as! String
                self.addresslabel.text = location1
                self.lmtatextfield.text = info
            
              
                //print(taname)
               // print(location)
               
             
               // print(tainfo)
               
                })
          
           
        }
        
        
        func testDB(test:String)->String {
            print(test)
            return test
        }
        
    
       
      
  
        
        
        
 
        
       
      /*
        func getdb() ->String{
            var test011:String!
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        ref.child("ta/lower manhattan").observeSingleEvent(of: .value, with: { (snapshot) in
            let data = snapshot.value as? NSDictionary
            let mu01 = data?["911museum"] as! String
            self.test911 = mu01
            test011 = mu01
            //print(mu01)
         //   print(self.test911)
         print(test011)
            
        })
          //  print(test911)
           print(test011)
            return self.test911
        }
       */
         addresslabel.adjustsFontSizeToFitWidth = true
      
        switch test03
        {
        case 0?:
            
          
            getDB()
            
         
        case 1?:
            lmtatextfield.text = owt1.explain
           
            addresslabel.text = owt1.address
        case 2?:
            lmtatextfield.text = owt1.explain
            
            addresslabel.text = owt1.address
        default:
            lmtatextfield.text = "디폴트입네다."
        }
        
        testtest.text  = test01
        title = test01
        test02.text = NSString(format:"%d", test03!) as String
        // Do any additional setup after loading the view, typically from a nib.
    }
 

    
    @IBAction func showgooglemap(_ sender: Any) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
}



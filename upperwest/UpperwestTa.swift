//
//  UpperwestTa.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2018. 3. 30..
//  Copyright © 2018년 taewook. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class UpperwestTa: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var handle:DatabaseHandle?
    var db = [UpperwestTaData]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
         super.viewDidLoad()
         var ref: DatabaseReference!
        ref = Database.database().reference()
        
         handle = ref?.child("ta/UpperWest").observe(DataEventType.value, with: {(snapshot) in
            
            for ta in snapshot.children.allObjects as![DataSnapshot]
            {
                let ta1 = ta.value as? [String : AnyObject]
                let taID = ta1?["ID"]
                let taImageURL = ta1?["imageURL"]
                let taLocation = ta1?["location"]
                let taInfo = ta1?["info"]
                
                let tadata = UpperwestTaData(id: taID as! String?, imageURL: taImageURL as! String?, info: taInfo as! String?, location: taLocation as! String? )
                self.db.append(tadata)
                
            }
            
            self.tableView.reloadData()
         })
       
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return db.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "upperwestta", for: indexPath) as! UpperwestTaCell
       
        let tourlist : UpperwestTaData
        tourlist = db[indexPath.row]
        let url = URL(string: tourlist.imageURL!)
        
        let data = try? Data(contentsOf : url!)
        cell.IDcell.text = tourlist.id
        cell.InfoCell.text = tourlist.info
        cell.LocationCell.text = tourlist.location
        cell.ImageView.image = UIImage(data : data!)
        
        return cell
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

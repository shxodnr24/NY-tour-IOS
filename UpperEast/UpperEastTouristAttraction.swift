//
//  UppereastRestaurant.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2018. 4. 11..
//  Copyright © 2018년 taewook. All rights reserved.
//

import UIKit
import Firebase

class UpperEastTouristAttraction: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var handle:DatabaseHandle?
    var db = [UpperEastTouristAttractionData]()
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
                
                let tadata = UpperEastTouristAttractionData(id: taID as! String?, imageURL: taImageURL as! String?, info: taInfo as! String?, location: taLocation as! String? )
                self.db.append(tadata)
                
            }
            
            self.tableView.reloadData()
        })

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return db.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath) as! UpperEastTouristAttractionCell
        
        let tourlist : UpperEastTouristAttractionData
        tourlist = db[indexPath.row]
        let url = URL(string: tourlist.imageURL!)
        
        let data = try? Data(contentsOf : url!)
        cell.nameCell.text = tourlist.id
        cell.addressCell.text = tourlist.location
        //cell.InfoCell.text = tourlist.info
      //  cell.LocationCell.text = tourlist.location
        cell.imageViewCell.image = UIImage(data : data!)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "upperEastTA"
        {
            let detailVC = segue.destination as! UpperEastTAdetail
             let selectedPath = self.tableView.indexPathForSelectedRow!
            
            let data : UpperEastTouristAttractionData
            data = db[selectedPath.row]
            
            detailVC.address = data.location
            detailVC.name = data.id
            
      /*detailVC.address
            move.test = data.id
            move.location = data.location
            move.info = data.info */
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

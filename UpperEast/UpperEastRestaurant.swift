//
//  UpperEastRestaurant.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2018. 4. 19..
//  Copyright © 2018년 taewook. All rights reserved.
//

import UIKit

class UpperEastRestaurant: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var businesses: [Business]!
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     // print(businesses[indexPath.row])
   
        
        let data : Business
        data = businesses[indexPath.row]
        print(" This is the",data.name!)
        
       
        
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
   
       tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        Business.searchWithTerm(term: "Thai", location: "40.773753,-73.959689", completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = businesses
            self.tableView.reloadData()
            if let businesses = businesses {
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            }
            
        }
        )

        // Do any additional setup after loading the view.
    }

  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil {
            return businesses!.count
        } else {
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        
        cell.business = businesses[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "restaurantMove"
        {
            let move = segue.destination as! UpperEastRestaurantDetail
            let selectedPath = self.tableView.indexPathForSelectedRow!
            let data : Business
            data = businesses[selectedPath.row]
            
            move.name = data.name
            move.address = data.address
            
            
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

//
//  RestaurantMap.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2018. 2. 27..
//  Copyright © 2018년 taewook. All rights reserved.
//


import UIKit


class RestaurantMap: UIViewController, UITableViewDataSource, UITableViewDelegate, RestaurantFilterDelegate {
   
 
  var businesses: [Business]!
    
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var TestLabel: UILabel!
    override func viewDidLoad() {
          super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.rowHeight = UITableViewAutomaticDimension
        tableview.estimatedRowHeight = 120
        Business.searchWithTerm(term: "Thai", location: "40.718696,-74.000812", completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = businesses
            self.tableview.reloadData()
            if let businesses = businesses {
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            }
            
        }
        )
      
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        
        cell.business = businesses[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navagationController = segue.destination as! UINavigationController
        let restaurantFilter = navagationController.topViewController as! RestaurantFilter
        restaurantFilter.delegate = self
    }
    
    func restaurantFilter(restaurantFilter: RestaurantFilter, didUpdateFilters filters: [String : AnyObject]) {
       var categories = filters["categories"] as? [String]
        Business.searchWithTerm(term: "Restaurants", sort: nil, location: "40.718696,-74.000812", categories: categories, deals: nil) {
            (businesses: [Business]!, error: Error!) ->Void in
            self.businesses = businesses
            self.tableview.reloadData()
            
            
            }
    
    
    
}
}

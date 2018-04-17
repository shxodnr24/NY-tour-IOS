//
//  RestaurantFilter.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2018. 3. 14..
//  Copyright © 2018년 taewook. All rights reserved.
//


import UIKit
@objc protocol RestaurantFilterDelegate {
   @objc  optional func restaurantFilter(restaurantFilter:RestaurantFilter, didUpdateFilters filters: [String:AnyObject])
    
}
class RestaurantFilter: UIViewController,UITableViewDataSource, UITableViewDelegate, SwitchCellDelegate{
    
    var categories : [[String:String]]!
    var switchStates = [Int:Bool]()
    @IBOutlet weak var tableView: UITableView!
    weak var delegate : RestaurantFilterDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        categories = yelpCategories()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
   
    @IBAction func onCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSearchButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        var filters = [String : AnyObject]()
        
        var selectedCategories = [String]()
        for(row,isSelected) in switchStates {
            if isSelected {
                selectedCategories.append(categories[row]["code"]!)
            }
        }
        if selectedCategories.count > 0 {
            filters["categories"] = selectedCategories as AnyObject
        }
        
        delegate?.restaurantFilter?(restaurantFilter: self, didUpdateFilters: filters)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
    func yelpCategories() -> [[String:String]] {
        return [["name" : "American New", "code" : "newamerican"],
        ["name" : "American", "code" : "armenian"],
        ["name" : "Korean" , "code" : "korean"]]
       
    }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SwithCell", for: indexPath) as! SwithCell
        
      cell.switchlabel.text = categories[indexPath.row]["name"]
     cell.delegate = self
      
        
        cell.onSwitch.isOn = switchStates[indexPath.row] ?? false
        return cell
    }
    
    func switchCell(switchCell: SwithCell, didChangeValue value: Bool) {
        let indexPath = tableView.indexPath(for: switchCell)!
        switchStates[indexPath.row] = value
        print("fillter view controll got the switch event")
    }
    
    

}

//
//  UpperEastFirst.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2018. 4. 4..
//  Copyright © 2018년 taewook. All rights reserved.
//

import UIKit

class UpperEastFirst: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBAction func optionBar(_ sender: Any) {
         NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    let mainMenu = ["Tourist Attraction", "Restaurant(Yelp)", "Restaurant(Recommend)", "settings"]
    let image = ["IMG_6512.JPG", "IMG_7025.JPG", "IMG_7497.JPG", "IMG_5022.JPG"]
    override func viewDidLoad() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
     return mainMenu.count
        
    }
    
   
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! UpperEastFirstCell
       
        cell.imageCell.image = UIImage(named: image[indexPath.row])
        //cell.imageCell.image = UIImage(named: mainMenu[indexPath.row])
        cell.labelCell.text = mainMenu[indexPath.row].capitalized
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = mainMenu[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: name)
         self.navigationController?.pushViewController(viewController!, animated: true)
        
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

//
//  UpperWestFirst.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2018. 3. 30..
//  Copyright © 2018년 taewook. All rights reserved.
//

import UIKit

class UpperWestFirst: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let cellName = ["Tourist Attraction", "Restaurant"]
    
    let cellImage = ["IMG_6512.JPG","IMG_7025.JPG"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCell", for: indexPath) as! UpperWestFirstCell
        
        cell.imageCell.image = UIImage(named: cellImage[indexPath.row])
        cell.labelCell.text = cellName[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = cellName[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: name)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Do any additional setup after loading the view.
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

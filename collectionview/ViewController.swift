//
//  ViewController.swift
//  collectionview
//
//  Created by Poonam Pandey on 29/04/18.
//  Copyright © 2018 Poonam Pandey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionview: UICollectionView!
    
    var arrayLabels = ["1 😘", "2 😎", "3 😡" , "4 💄", "5 🗼","6 🚕","7 🙋‍♀️","8 💰","9 👩‍🔧"]
    
    @IBAction func addLabels(_ sender: UIBarButtonItem) {
        collectionview.performBatchUpdates({
            for i in 0x1F601...0x1F605 {
                
                let text = "\(arrayLabels.count+1) \(UnicodeScalar(i)!)"
                arrayLabels.append(text)
                
                let index = IndexPath(item: arrayLabels.count-1, section: 0)
                collectionview.insertItems(at: [index])
            }
        }, completion: nil)
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let width = (view.frame.size.width - 8) / 3
        let layout = collectionview.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.itemSize = CGSize(width: width, height: width)
        
        
        
        //        This for loop prints all the emojis available
        //        for i in 0x1F601...0x1F64F {
        //            let c = String(UnicodeScalar(i)!)
        //            print(c)
        //        }
        // Rmember cmd + ctrl +spcae shows popup for emojis
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OpenDetailsViewController"{
            if let dest = segue.destination as? DetailsViewController,
                let index = sender as? IndexPath {
                dest.selectionText = arrayLabels[index.row]
            }
        }
    }
    
}

extension ViewController: UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayLabels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionAlbumCell", for: indexPath)
        let label = cell.viewWithTag(100) as? UILabel
        label?.text = arrayLabels[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "OpenDetailsViewController", sender: indexPath)
        
        //        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
        //        vc.selectionText = arrayLabels[indexPath.row]
        //        self.navigationController?.pushViewController(vc, animated: true)
        //        print("text is \(String(describing: arrayLabels[indexPath.row]))")
    }
}





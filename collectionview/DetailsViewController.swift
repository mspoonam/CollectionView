//
//  DetailsViewController.swift
//  collectionview
//
//  Created by Poonam Pandey on 29/04/18.
//  Copyright © 2018 Poonam Pandey. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var selectionText = ""
    @IBOutlet weak var labelDetailScreen: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        labelDetailScreen.text = selectionText
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

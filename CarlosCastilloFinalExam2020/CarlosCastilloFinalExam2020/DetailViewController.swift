//
//  DetailViewController.swift
//  CarlosCastilloFinalExam2020
//
//  Created by  on 12/14/20.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var myCatName: UILabel!
    @IBOutlet weak var myCatImage: UIImageView!
    @IBOutlet weak var myCatDescription: UILabel!
    
    
    var myCatObj : Cat = Cat() // catches data from first view controller
    
    
    func setCatValues()
    {
        self.myCatName.text = myCatObj.catName
        self.myCatDescription.text = myCatObj.catDescription
        self.myCatImage.image = myCatObj.catImage
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setCatValues()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

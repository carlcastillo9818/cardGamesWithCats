//
//  MainViewController.swift
//  CarlosCastilloFinalExam2020
//
//  Created by CARLOS CASTILLO on 12/14/20.
//

import UIKit

class MainViewController: UIViewController{

        // Important properties for this project
    @IBOutlet weak var Cat1: UILabel!
    @IBOutlet weak var Cat2: UILabel!
    @IBOutlet weak var Cat1ImageView: UIImageView!
    @IBOutlet weak var Cat2ImageView: UIImageView!
    var cat1Description : String = ""
    var cat2Description : String = ""
    var myCatArray : [Cat] = [] // array of cat objects
    var myClickedCat = Cat() // clicked cat object to pass to next view controller
    @IBOutlet var TapImage1: UITapGestureRecognizer! // property that represents the tap gesture stored in the first image
    @IBOutlet var TapImage2: UITapGestureRecognizer! // property representing the tap gesture stored in the second image
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createMyCats()
        randomCatPicker()
        
      
    
    }


    /* this function sets up cat objects and loads array with each cat object */
    func createMyCats()
    {
        let lion = Cat(name: "Lion", description: "King of the Jungle", image: UIImage(named: "lionpic.jpg")!)
        let tiger = Cat(name: "Tiger", description: "Largest Cat", image: UIImage(named: "tigerpic.jpg")!)
        let leopard = Cat(name: "Leopard", description: "All about the spots", image: UIImage(named: "leopardpic.jpg")!)
        let cougar = Cat(name: "Cougar", description: "Same as mountain lion", image: UIImage(named: "cougarpic.jpg")!)
        let cheetah = Cat(name: "Cheetah", description: "Fastest animal on land", image: UIImage(named: "cheetahpic.jpg")!)
        let jaguar = Cat(name: "Jaguar", description: "A nice car besides a cat", image: UIImage(named: "jaguarpic.jpg")!)
        let lynx = Cat(name: "Lynx", description: "Funny ear tips", image: UIImage(named: "lynxpic.jpg")!)
        let snowleopard = Cat(name: "Snow Leopard", description: "Most beautiful large cat", image: UIImage(named: "snowleopardpic.jpg")!)
        let mountainlion = Cat(name: "Mountain Lion", description: "Watch out when cycling", image: UIImage(named: "mountainlionpic.jpg")!)
        myCatArray = [lion, tiger, leopard, cougar, cheetah, jaguar, lynx, snowleopard, mountainlion]
    }
    
    // this function checks to see which tap gesture inside the image was tapped and assigns the clicked cats data to match it
    func assignClickedCatData()
    {
        if(TapImage2.state == .ended)
        {
            self.myClickedCat.catImage = Cat2ImageView.image!
            self.myClickedCat.catDescription = cat2Description
            self.myClickedCat.catName = Cat2.text!
        }
        else
        if(TapImage1.state == .ended)
            {
                    self.myClickedCat.catImage = Cat1ImageView.image!
                    self.myClickedCat.catDescription = cat1Description
                    self.myClickedCat.catName = Cat1.text!
            }
    }
    
        /* this function picks 2 cats randomly from an array of large cats and assigns their image and name to the 2 image views and 2 name labels. */
    func randomCatPicker()
    {
        var random_element1 = myCatArray.randomElement()!
        var random_element2 = myCatArray.randomElement()!
        
        while(random_element2.catName == random_element1.catName)
        {
            random_element2 = myCatArray.randomElement()!
        }
        Cat1.text = random_element1.catName
        Cat1ImageView.image = random_element1.catImage
        cat1Description = random_element1.catDescription
 
        Cat2.text = random_element2.catName
        Cat2ImageView.image = random_element2.catImage
        cat2Description = random_element2.catDescription
        
    }
    
    /* this function picks random new cats from the cat array and displays the new cats on the battle card –  HINT: random number generator */
    @IBAction func NewBattleButtonPress(_ sender: Any) {
        
        randomCatPicker()
        
    }
    
    
  
    
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let myBackItem = UIBarButtonItem() // create an object for the back button on the top bar
        myBackItem.title = "Go Back" // change the text of the back button!
        navigationItem.backBarButtonItem = myBackItem // set change here

        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.\
        assignClickedCatData() // call this function to determine which cats data to pass on to the clickedCat var
        
        let vc = segue.destination as! DetailViewController
        vc.myCatObj = self.myClickedCat
    }


}


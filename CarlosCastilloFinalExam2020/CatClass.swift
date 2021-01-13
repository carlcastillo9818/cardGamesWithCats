//
//  CatClass.swift
//  CarlosCastilloFinalExam2020
//
//  Created by  on 12/14/20.
//

import Foundation
import UIKit

class Cat
{
    var catName : String
    var catDescription : String
    var catImage : UIImage
    
    init(name : String, description : String, image : UIImage) {
        self.catName = name
        self.catDescription = description
        self.catImage = image
    }
    
    init() {
        self.catName = ""
        self.catDescription = ""
        self.catImage = UIImage()
        
    }
}

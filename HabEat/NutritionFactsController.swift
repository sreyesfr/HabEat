//
//  NutritionFactsController.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco and Connor Hanley on 12/7/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import UIKit

class NutritionFactsController: UITableViewController {
    
    var calories = 0.0
    var fat = 0.0
    var cholesterol = 0.0
    var sodium = 0.0
    var carbs = 0.0

    @IBOutlet weak var calorieslbl:UILabel!
    @IBOutlet weak var fatlbl:UILabel!
    @IBOutlet weak var cholesterollbl:UILabel!
    @IBOutlet weak var sodiumlbl:UILabel!
    @IBOutlet weak var carbslbl:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calorieslbl.text = String(Int(calories))
        fatlbl.text = String(Int(fat)) + " grams"
        cholesterollbl.text = String(Int(cholesterol)) + " miligrams"
        sodiumlbl.text = String(Int(sodium)) + " miligrams"
        carbslbl.text = String(Int(carbs)) + " grams"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

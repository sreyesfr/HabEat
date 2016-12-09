//
//  FoodViewController.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco on 11/21/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import UIKit
import CoreData

class FoodViewController: UIViewController {
    
    var viewModel: FoodViewModel?
    @IBOutlet weak var menuButton:UIBarButtonItem!
    
    @IBOutlet weak var foodTitle:UILabel!
    @IBOutlet weak var foodPicture:UIImageView!
    @IBOutlet weak var habEatIdx:UILabel!
    @IBOutlet weak var habEatView:UIView!
    @IBOutlet weak var switchButton:UISwitch!
    

    @IBAction func clickedEat(){
        let perc = Int(viewModel!.getPercentDailyAverage())
        let title = "Are you sure?"
        let stringPerc = String(perc)
        let dishName = viewModel!.dish.name
        let message = "This " + dishName + " has approximately " + stringPerc + "% of your total daily intake."
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default,
                                      handler: { action in
                                        self.eatDish()
                                        self.goToJournal()})
        let noAction = UIAlertAction(title: "No", style: .default,
                                     handler: {action in })
        // No before yes, because that's how it's done! :)
        alert.addAction(noAction)
        alert.addAction(yesAction)

        present(alert, animated:true, completion:nil)
    }
    
    func goToJournal() {
        self.performSegue(withIdentifier: "journalSegue", sender: self)
    }
    
    func eatDish() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let entity =  NSEntityDescription.entity(forEntityName: "Meal", in:managedContext)
        let meal = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        let dishId = viewModel!.dish.id
        let dishName = viewModel!.dish.name
        meal.setValue(dishId, forKey: "dish_id")
        meal.setValue(dishName, forKey: "name")
        meal.setValue(Date(), forKey: "tmstmp")
        
        do {
            try managedContext.save()
            meals.append(meal)
            print(meal)
            print("Meal was saved")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorite")
        
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            favorites = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        //foodTitle.text = viewModel!.title()
        self.navigationItem.title = viewModel!.title()
        foodPicture.image = UIImage(named: viewModel!.dish.img)
        habEatIdx.text = String(Int(viewModel!.getHabEatIndex()))
        habEatView.backgroundColor = viewModel!.getBackgroundColor()
        if viewModel!.isFavorite(){
            switchButton.setOn(true, animated: true)
        }
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "embeddedSegue") {
            let childViewController = segue.destination as! NutritionFactsController
            childViewController.calories = viewModel!.dish.calories
            childViewController.fat = viewModel!.dish.fat
            childViewController.cholesterol = viewModel!.dish.cholesterol
            childViewController.sodium = viewModel!.dish.sodium
            childViewController.carbs = viewModel!.dish.carbs
            
        } else if (segue.identifier == "backSegue"){
            if let foodMenuVC = segue.destination as? FoodMenuViewController {
                let thisRest = allRestaurants.filter({$0.id == viewModel!.dish.rest_id}).first
                foodMenuVC.viewModel =  FoodMenuViewModel(restaurant: thisRest!)
            }
        }
    }
    
    @IBAction func switchChanged() {
        if (switchButton.isOn){
            viewModel!.addFavorite()
        } else{
            viewModel!.removeFavorite()
        }
    }
    

}
